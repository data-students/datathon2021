################################################################################
#                                                                              #
#  data_preparation.R                                                          #
#                                                                              #
################################################################################

# This script includes an example of how to download some of the datasets from 
# https://ajuntament.barcelona.cat/
# First of all, we open an excel file and follow the steps presented in 
# https://ajuntament.barcelona.cat/estadistica/angles/Download/index.htm about
# how to download the datasets to an excel file.
# For this example, we downloaded all the available years of the following dataset
# https://ajuntament.barcelona.cat/estadistica/catala/Estadistiques_per_temes/Habitatge_i_mercat_immobiliari/Mercat_immobiliari/Habitatges_lloguer/a2020/tbarris1.htm
# Note that the other years of the info can be obtained by only changing the 
# year of the previous link.

# Once we download the datasets into an excel file we can read them and work with
# them from R.


# We start by loading needed libraries
library(readxl)
library(tidyr)
library(dplyr)
library(stringr)

# We create an empty dataframe where we will create a unique dataset of the rent 
# prices
df_rent <- data.frame()

# Since we have data of multiple years, we perform the same operations in a foor 
# loop (each iteration for a given year)
for (i in c(2014:2021)){
  # We read the excel sheet of year 'i'. Note that we select the range of cells
  # we wan to read and that the name of the excel sheet is the same as the year.
  # (change the name of the excel file if needed)
  df <- read_excel("preu_lloguer_2014_2021.xlsx", sheet=toString(i), range = "A10:H83")
  # Once read, we delete empty columns and add the column names
  df <- df[, c(1, 5:8)]
  names(df) <- c("barri", "T1", "T2", "T3", "T4")
  df2 <- df %>% 
    # We separate the first column into different levels
    mutate(barri = str_replace(barri, "\\s", "|")) %>% 
    separate(barri, into = c("districte", "codi_barri"), sep = "\\|") %>%
    mutate(codi_barri = str_replace(codi_barri, "\\s\\s\\s\\s", "")) %>% 
    separate(codi_barri, into = c("codi_barri", "barri"), sep = "\\.") %>%
    # We change the names of the columns and give the correct format to NAs
    mutate_at(vars(T1, T2, T3, T4), na_if, "-") %>%
    mutate_at(vars(T1, T2, T3, T4), na_if, "nd") %>%
    rename_with(.fn= ~paste0(i, .),.cols = starts_with("T"))
  # We paste the several df in a unique df
  if (i == 2014){
    df_rent <- df2
  } else {
    df_rent <- df_rent %>%
      full_join(df2)
  }
}
rm(df, df2, i, name)

# Since the decimal separator of R is '.' and not ',' we replace the decimal separator
# and change the class of the columns
df_rent <- df_rent %>%
  mutate(across(.cols = !starts_with("20"),.fns = ~as.factor(.))) %>%
  mutate(across(.cols = starts_with("20"), .fns = ~str_replace(., pattern = "\\.", replacement = ""))) %>%
  mutate(across(.cols = starts_with("20"), .fns = ~str_replace(., pattern = ",", replacement = "."))) %>%
  mutate(across(.cols = starts_with("20"), .fns = ~as.numeric(.))) 

sapply(df_rent, class)

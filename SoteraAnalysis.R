## ----load_data---------------------------------------------------------------------------------------------------------------------------------------------------
# Run clinical data file generator

#source("./data_request_20240423/30037614241CRFV21FAC_R_2024-04-24_0737.r")

baseline= read.csv(file='./data_request_20240423/baseline_20190121.csv')
Finalstudy =  read_csv(file='./data_request_20240423/Final_study_pop_20190107.csv')

# DO NOT USE read_csv for this file
monitoring = read.csv("./data_request_20240423/all_factor_visi_data.csv")

intra_op = read_csv("./data_request_20240423/intraop_20190121.csv")


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------
monitoring <- monitoring %>% rename(Study.ID=Study.ID.in.format....e.g..ppp.ss.nnnn.)
monitoring <- monitoring %>% mutate(across(c(SPO2, PR, RR, CNIBP_SYS,CNIBP_DIA, CNIBP_MAP, BP_SYS, BP_MAP, BP_DIA, HR), as.double))


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------
jama_p=read_csv("./data_request_20240423/primary_outcomes_jama_revision.csv")
jama_s =read_csv("./data_request_20240423/secondary_outcomes_20190211.csv")


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------
monitoring_na = monitoring %>% filter(is.na(Study.ID))


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------
monitor_n = monitoring |> filter(!is.na(BP_SYS)) 
monitor_v = monitoring |> filter(is.na(BP_SYS)) 


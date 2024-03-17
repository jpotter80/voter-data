# importing and reading with readxl
data <- read_excel("Filtered_Buncombe_County_Voter_Information_Data.xlsx")

# displays the first few rows of the dataset
head(data)

# displays a concise summary of the object
str(data)

# rename columns
data_renamed <- data %>%
  rename(
    ID = `OBJECTID`,
    Status = `StatusCode`,
    Party = `PartyCode`,
    Race = `RaceCode`,
    Gender = `GenderCode`,
    Age = `AgeAtYearEnd`,
    Reg_Date = `RegistrationDate`,
    City_State_Zip = `ResidentialAddressCityStateZip`,
    Zip = `ResidentialAddressZipCode`,
    Precint = `JurisdictionPrecinctCode`,
    Cong_Dist = `JurisdictionCongDisCode`,
    School_Dist = `JurisdictionSchoolDistrictCode`,
  )
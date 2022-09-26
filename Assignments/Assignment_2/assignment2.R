# find all .csv files in ./data/
csv_files <- list.files(recursive = TRUE, 
                        full.names = TRUE, 
                        pattern = ".csv", 
                        path = "Data")

# How many .csv files are there? 
length(csv_files)

# Look at wingspan vs mass file
wing <- csv_files[145]
df <- read.csv(wing)

# Shows the first five lines of the data set
head(df,5)

# All files in "Data" that begin with a lowercase "b"
b_files <- list.files(path = "Data", 
                      recursive = TRUE, 
                      pattern = "^b", 
                      full.names = TRUE,
                      ignore.case = FALSE);b_files

# ^ = 'starts with'
# $ = 'ends with'
# * = can be repeated infinite number of times
# . = 'any single character'

# dumb way to read first line of each file
readLines("Data/data-shell/creatures/basilisk.dat", n = 1)
readLines("Data/data-shell/data/pdb/benzaldehyde.pdb", n = 1)
readLines("Data/Messy_Take2/b_df.csv", n = 1)

# Slightly better way of seeing first line of each file
# Use b_files
readLines(b_files[1], n = 1) # Using [] to see results 
readLines(b_files[2], n = 1) # one at a time
readLines(b_files[3], n = 1)

# for-loop
for(eachfile in b_files){
  print(readLines(eachfile, n=1))
}

# Same thing for all files that end in .csv
for(eachfile in csv_files){
  print(readLines(eachfile, n=1))
}


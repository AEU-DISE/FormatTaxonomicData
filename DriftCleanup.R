f_structureData <- function(drift_files) {

ldf <- lapply(drift_files, read_excel, sheet = "Taxonomy Data", skip=8, col_types = c("text", "text", "text", "text", "skip", "skip", "skip", "skip", "skip", "text", "text", "text", "text", "text", "text", "text", "skip", "skip", "text", "text", "text", "text", "skip", "skip", "text", "skip", "skip", "skip", "skip", "skip", "skip","skip", "skip", "skip","skip", "skip", "skip", "skip", "skip", "skip","skip", "skip", "skip","skip", "skip", "skip" ))

ldf1 <- lapply(ldf, `[`, -c(1:2),) #remove two extra rows that are descriptive rows, but still want to keep column titles.

return(ldf1) }

# Clean up names in each file so that they line up with each other. There were some inconsistencies in the original.
f_nameChange <- function(x) {
    x <- janitor::clean_names(x)
    names(x)[2:6] <- c("station", "time", "date", "taxon", "life_stage")
    return(x)
  }

f_combineData <- function(listdf=ldf1)  {
# apply function
ldf2 <- lapply(listdf, f_name_change)
 # combine into data frame
  drift_comb <- bind_rows(ldf2, .id = "dataset")
}





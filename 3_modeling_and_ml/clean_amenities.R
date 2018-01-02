clean_amenities <- function(listings_df) {
  listings_df <- listings_df %>%
    filter(!grepl("translation missing", amenities)) %>%
    mutate(amenities = gsub("[{}]|\"|[()]|-", "", amenities)) %>%
    mutate(amenities = gsub(" |/", "_", amenities)) %>%
    mutate(amenities = gsub("24", "x24", amenities))
  
<<<<<<< HEAD
  # Then, split the strings by amenity and create new columns
  splitting <- strsplit(listings_df$amenities, ",")
  all_amenities <- Reduce(union, splitting)
  for (i in all_amenities) {
    listings_df[paste0("amenity_", i)] <- 
=======
  # Then, split the strings by amenity and create new column
  splitting <- strsplit(listings_df$amenities, ",")
  all_amenities <- Reduce(union, splitting)
  for (i in all_amenities) {
    listings_df[paste("amenity_", i, sep = "")] <- 
>>>>>>> 4cd374e2c4858a90aa6398913786cb0d84f9b3fa
      grepl(i, listings_df$amenities)
  }
  return(listings_df)
}

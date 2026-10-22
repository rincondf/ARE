hist(Sequential_sampling_lit$Year)
Sequential_sampling_lit$Country[which(Sequential_sampling_lit$Country == "California")] <- "United States"


non_seasonal <- c(
  "Benin", "Botswana", "Brazil", "Burkina Faso", "Cameroon", "Cape Verde",
  "Colombia", "Curaçao", "Guatemala", "Indonesia", "Kenya", "Malaysia",
  "Nigeria", "Peru", "Philippines", "Puerto Rico", "Sudan", "Tamil Nadu",
  "Thailand", "Trinidad and Tobago", "Uganda"
)

Sequential_sampling_lit$Seasonality <- ifelse(Sequential_sampling_lit$Country %in% non_seasonal, "non-seasonal", "seasonal")


data_hist <- hist(Sequential_sampling_lit$Year)

years <- seq(1950, 2025, 5)



seas <- rep(NA, 15)

for(i in 1: 15) {
  seas[i] <- length(which(Sequential_sampling_lit$Seasonality[
    which(Sequential_sampling_lit$Year > years[i] & 
            Sequential_sampling_lit$Year <= years[i] + 5)] == "seasonal"))
}
seas


nonseas <- data_hist$counts[1:15] - seas


barplot(rbind(seas, nonseas), names.arg = data_hist$breaks[1:15])



temp <- tempfile()

download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode="wb")

unzip(temp,
      "household_power_consumption.txt"
      )

data<- read.csv("household_power_consumption.txt",
                sep = ";",
                header=TRUE
                )

unlink(temp)

data$Date<-as.Date(data$Date,
                   "%d/%m/%Y"
                   )

data2<- subset(data,
               Date =="2007-02-01"| Date =="2007-02-02"
               )

Sys.setlocale("LC_TIME",
              "English"
              )


with(data2,
     plot(strptime(with(data2,
                        paste(Date,
                              Time)),
                   "%Y-%m-%d %H:%M:%S"),
          as.numeric(as.character(Global_active_power)),
          xlab="",
          ylab= "Global Active Power (kilowatts)",
          type="l"
          
          
     )
)






png(filename = "Plot2.png",
    width = 480,
    height = 480
    )

with(data2,
     plot(strptime(with(data2,
                        paste(Date,
                              Time)),
                   "%Y-%m-%d %H:%M:%S"),
          as.numeric(as.character(Global_active_power)),
          xlab="",
          ylab= "Global Active Power (kilowatts)",
          type="l"
          
          
          )
     )


dev.off()
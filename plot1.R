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


with(data2,
     hist(as.numeric(as.character(Global_active_power)),
          breaks=11,
          col="red",
          main = title("Global Active Power",
                       cex.main=0.8),
          xlab= "Global Active Power (kilowatts)",
          cex.axis=0.75,
          cex.lab=0.75
          
     )
)




png(filename = "Plot1.png",
    width = 480,
    height = 480
    )

with(data2,
     hist(as.numeric(as.character(Global_active_power)),
                 breaks=11,
                 col="red",
                 main = title("Global Active Power",
                              cex.main=0.8),
                 xlab= "Global Active Power (kilowatts)",
                 cex.axis=0.75,
                 cex.lab=0.75
                 
         )
    )



dev.off()

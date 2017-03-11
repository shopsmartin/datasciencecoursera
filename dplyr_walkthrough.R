#dply is a package in R that allows you to manipulate dataframe
#relies on verbs to manip data

# don't have dplyr? Uncomment below
# dplyr has a lot of dependencies
# install.packages('dplyr', dependencies = TRUE)

#loading packages
require(dplyr)
require(datasets)


head(swiss)


#make panels of histograms exploring data is first
oldpar <- par()
par(mfrow = c(2, 3))
colnames <- dimnames(swiss)[[2]]

#check variablkes for histograms
for (i in 1:ncol(swiss)) {
    hist(swiss[, i],
    main = colnames[i])
}
par <- oldpar
plot(swiss) #scatterplot matrix


# dplyr verbs to use

"filter() slice()
arrange()
select() rename()
distinct()
mutate() transmute() <-creates new variables
summarise() "


# filter and sort

#compare tweo way same thing
filter(swiss, Catholic > 60)

swiss[swiss$Catholic > 60,]

#sort
arrange(swiss, desc(Education), Catholic)

#select
select(swiss, Education, Examination, Agriculture)
select(swiss, - (Catholic:Infant.Mortality))

#like sql distinct
distinct(select(swiss, Education))
library(plyr)
plot(arrange(count(swiss, 'Education'), freq))


#mutate

swiss1 <- swiss
swiss1 <- mutate(swiss1,
    rank_Catholic = rank( - Catholic),
    majority_Catholic = ifelse(Catholic > 50, "True", "False")
    )

swiss1 %>%
  select(Catholic, rank_Catholic, majority_Catholic) %>%
  arrange(desc(Catholic))

#transmute?
swiss2 <- swiss
swiss2 <- transmute(swiss2,
    rank_Catholic = rank( - Catholic),
    majority_Catholic = ifelse(Catholic > 50, "True", "False")
    )

swiss2

sample_n(swiss, 10)
sample_frac(swiss, 0.20)


#grouped operations
#group and summarize
detach("package:plyr", unload = TRUE)
by_majority <- group_by(swiss1, majority_Catholic)
summarise(by_majority,
          count = n(),
          ag_mean = mean(Agriculture))





#dplyr dependencies 
"package `colorspace' successfully unpacked and MD5 sums checked
package ` memoise ' successfully unpacked and MD5 sums checked
package `mime' successfully unpacked and MD5 sums checked
package `stringi' successfully unpacked and MD5 sums checked
package ` RColorBrewer ' successfully unpacked and MD5 sums checked
package `dichromat' successfully unpacked and MD5 sums checked
package `munsell' successfully unpacked and MD5 sums checked
package ` labeling ' successfully unpacked and MD5 sums checked
package `chron' successfully unpacked and MD5 sums checked
package `digest' successfully unpacked and MD5 sums checked
package ` crayon ' successfully unpacked and MD5 sums checked
package `praise' successfully unpacked and MD5 sums checked
package `evaluate' successfully unpacked and MD5 sums checked
package ` formatR ' successfully unpacked and MD5 sums checked
package `highr' successfully unpacked and MD5 sums checked
package `markdown' successfully unpacked and MD5 sums checked
package ` stringr ' successfully unpacked and MD5 sums checked
package `yaml' successfully unpacked and MD5 sums checked
package `plyr' successfully unpacked and MD5 sums checked
package ` gtable ' successfully unpacked and MD5 sums checked
package `reshape2' successfully unpacked and MD5 sums checked
package `scales' successfully unpacked and MD5 sums checked
package ` proto ' successfully unpacked and MD5 sums checked
package `assertthat' successfully unpacked and MD5 sums checked
package `R6' successfully unpacked and MD5 sums checked
package ` Rcpp ' successfully unpacked and MD5 sums checked
package `magrittr' successfully unpacked and MD5 sums checked
package `lazyeval' successfully unpacked and MD5 sums checked
package ` DBI ' successfully unpacked and MD5 sums checked
package `BH' successfully unpacked and MD5 sums checked
package `RSQLite' successfully unpacked and MD5 sums checked
package ` RMySQL ' successfully unpacked and MD5 sums checked
package `RPostgreSQL' successfully unpacked and MD5 sums checked
package `data.table' successfully unpacked and MD5 sums checked
package ` testthat ' successfully unpacked and MD5 sums checked
package `knitr' successfully unpacked and MD5 sums checked
package `microbenchmark' successfully unpacked and MD5 sums checked
package ` ggplot2 ' successfully unpacked and MD5 sums checked
package `Lahman' successfully unpacked and MD5 sums checked
package `nycflights13' successfully unpacked and MD5 sums checked
package ` dplyr ' successfully unpacked and MD5 sums checked"
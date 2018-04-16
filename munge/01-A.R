# Example preprocessing script.
customer.count <- ddply(CustomerData, c('CustomerId'), nrow)
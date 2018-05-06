model <- getCreditModel()

expect_match(model$method, "rf")

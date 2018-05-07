describe("CreditModel", {

  describe("model object", {
    it("is a training model", {

      require(caret)

      credit_limit_model <- getCreditModel()

      # check the class of the loaded model
      expect_true("train" %in% class(credit_limit_model))

      expect_s3_class(credit_limit_model, "train")

      # model methid is random forest (rf)
      expect_match(credit_limit_model$method, "rf")
      })
  })
  describe("model outcome", {
    it("can preditict", {

      require(caret)

      data("creditlimittestdata")

      credit_limit_model <- getCreditModel()
      predictions <- predict(credit_limit_model, newdata=dataset_test)

      # redictions must be factor class since they are classifications
      expect_is(predictions, "factor")

      # number of predictions should match the number of test records
      expect_equal(length(predictions), 345)
    })
  })

})

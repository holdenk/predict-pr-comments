package com.holdenkarau.predict.pr.comments.sparkProject.ml

import org.apache.spark.{SparkConf, SparkContext}

/**
  * Use this to output data to use in TFX
  */
object TFXOutputApp extends App{
  val (inputFile, outputFile, dataPrepLocation, issueInput) = (args(0), args(1), args(2), args(3))
  val conf = new SparkConf()

  MyTFXRunner.run(conf, inputFile, outputFile, dataPrepLocation, issueInput, output)
}

private object MyTFXRunner {
  def run(conf: SparkConf, inputFile: String, outputFile: String, dataprepLocation: String, issueInput: String) = {

    val sc = new SparkContext(conf)
    val trainingPipeline = new TrainingPipeline(sc)
    trainingPipeline.trainAndSaveModel(input=inputFile, issueInput=issueInput, output=outputFile, dataprepPipelineLocation=dataprepLocation)
  }
}

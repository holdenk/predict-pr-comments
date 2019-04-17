package com.holdenkarau.predict.pr.comments.sparkProject.ml

/**
 * A simple test to make sure an individual model can be trained
 */
import com.holdenkarau.predict.pr.comments.sparkProject.dataprep.{ResultData, IssueStackTrace}

import com.holdenkarau.spark.testing.{SharedSparkContext, Utils}
import org.apache.spark.sql._
import org.apache.spark.sql.types._
import org.apache.spark.sql.catalyst.ScalaReflection
import org.scalatest.FunSuite
import org.scalatest.Matchers._

class ServingTest extends FunSuite with SharedSparkContext {
}

package com.holdenkarau.predict.pr.comments.sparkProject.ml
import scala.collection.immutable.{HashSet => ImmutableHashSet}

object FileFormats {
  // Loosely from https://en.wikipedia.org/wiki/List_of_file_formats#Programming_languages_and_scripts
  val formats = ImmutableHashSet(List(
    "md",
    "scala",
    "go",
    "gs",
    "html",
    "AHK",
    "APPLESCRIPT",
    "AS",
    "AU3",
    "BAT",
    "BAS",
    "CLJS",
    "CMD",
    "Coffee",
    "CPP",
    "duino",
    "EGG",
    "EGT",
    "ERB",
    "HTA",
    "IBI",
    "ICI",
    "IJS",
    ".ipynb",
    "ITCL",
    "JS",
    "JSFL",
    "LUA",
    "M",
    "MRC",
    "PHP",
    "PHP5",
    "PHP6",
    "PHP7",
    "PL",
    "PM",
    "PY",
    "R",
    "RB",
    "RUBY",
    "TCL",
    "VBS").map(_.toLowerCase))
}

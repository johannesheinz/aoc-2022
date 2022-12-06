import scala.util.Try
import scala.util.control.Breaks._


object TuningTrouble {

  def findStartOfMessage(line: String): Unit = {

    var hasMarker = false
    var markerPosition = 14

    breakable {
      for (marker <- line.sliding(14, 1)) {

        var foundMarkerInWindow = true

        val uniquePairs = for {
          (valueA, indexA) <- marker.zipWithIndex
          (valueB, indexB) <- marker.zipWithIndex
          if indexA < indexB
        } yield (valueA, valueB)

        for (tuple <- uniquePairs) {
          if (tuple._1 == tuple._2) {
            foundMarkerInWindow = false
          }
        }

        if (foundMarkerInWindow) {
          hasMarker = true;
          break()
        }

        markerPosition += 1
      }
    }

    print("  " + line.take(20) + "... - ")
    if (hasMarker) {
      println(s"Marker at position $markerPosition")
    } else {
      println(s"No marker found")
    }
  }

  def openFile(filename: String, callback: (String => Unit)): Unit = {
    println(s"\nReading from '$filename'")

    Try {
      val bufferedSource = scala.io.Source.fromFile(filename)
      for (line <- bufferedSource.getLines()) {
        callback(line)
      }
      bufferedSource
    }.toEither match {
      case Left(error) => println("[ERROR] Could not open file, " + error)
      case Right(bufferedSource) => bufferedSource.close()
    }
  }

  def main(args: Array[String]): Unit = {

    if (!args.isEmpty) {
      for (filename <- args) {
        openFile(filename, findStartOfMessage)
      }

    } else {
      openFile("input.txt", findStartOfMessage)
    }
  }
}

import scala.util.Try
import scala.util.control.Breaks._


object TuningTrouble {

  def findStartOfPacket(line: String): Unit = {

    var hasMarker = false
    var markerPosition = 4

    breakable {
      for (marker <- line.sliding(4, 1)) {
        if (
          (marker(0) != marker(1)) &&
          (marker(0) != marker(2)) &&
          (marker(0) != marker(3)) &&
          (marker(1) != marker(2)) &&
          (marker(1) != marker(3)) &&
          (marker(2) != marker(3))) {

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
        openFile(filename, findStartOfPacket)
      }

    } else {
      openFile("input.txt", findStartOfPacket)
    }
  }
}

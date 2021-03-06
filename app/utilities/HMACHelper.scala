package utilities

import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec
import javax.xml.bind.DatatypeConverter

object HMACHelper {
  def generateHMAC(sharedSecret: String, preHashString: String): String = {
    val secret = new SecretKeySpec(sharedSecret.getBytes, "HmacSHA1")
    val mac = Mac.getInstance("HmacSHA1")
    mac.init(secret)
    val hashString = mac.doFinal(preHashString.getBytes)
    DatatypeConverter.printBase64Binary(hashString)
  }

}

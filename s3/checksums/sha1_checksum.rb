require "digest"
require "base64"
cheksum = Digest::SHA1.file("myfile.txt").to_s
enc = Base64.encode(checksum).force_encoding("UTF-8")
puts enc
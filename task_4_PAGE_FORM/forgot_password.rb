require 'digest'
require 'securerandom'

def change_password(new_password)
  # obliczanie salt
  salt = SecureRandom.hex
  # obliczanie timestamp
  timestamp = Time.new.to_i.to_s
  # obliczanie SHA512 dla calosci
  sha512_password = Digest::SHA2.new(512).hexdigest(salt + "#" + new_password + "#" + timestamp)
  # zapis do stringa z ":"
  puts hashed_password = salt + ":" + sha512_password  + ":" + timestamp 
  # update pliku password.txt
  File.open("password.txt", "w") { |io| io.write(hashed_password) }
end

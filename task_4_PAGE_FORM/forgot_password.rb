require 'digest'
require 'securerandom'
require 'fast_secure_compare/fast_secure_compare'



def change_password(new_password,password_to_compare)
  if new_password == password_to_compare
    # obliczanie salt
    salt = SecureRandom.hex
    # obliczanie timestamp
    timestamp = Time.new.to_i.to_s
    # obliczanie SHA512 dla calosci
    sha512_password = Digest::SHA2.new(512).hexdigest(salt + "#" + new_password + "#" + timestamp)
    # zapis do stringa z ":"
    puts hashed_password = salt + ":" + sha512_password  + ":" + timestamp 
    # sprawdzanie czy poprawnie wczytany 
    # update pliku password.txt
    File.open("password.txt", "w") { |io| io.write(hashed_password) }

    return true
  else
    return false
  end
end

# user = user.new
# change_password("lama")
# File.open("password.txt")each { |line| puts line}
# user
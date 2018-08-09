require 'digest'
require 'fast_secure_compare/fast_secure_compare'

class SimpleUser 
  attr_accessor :password, :input_password, :salt, :timestamp
  attr_accessor :current_user 

  # Read password from txt file
  def password_from_file()
    file = File.open("password.txt", "rb")
    contents = file.read
    contents = contents.split(":")
  end

  def change_to_sha512(input_string)
    Digest::SHA2.new(512).hexdigest(salt + "#" + input_string + "#" + timestamp)
  end

  def check_password(input_string)
    FastSecureCompare.compare(password,change_to_sha512(input_string))
  end

  def update_password()
    content = password_from_file
  
    @salt = content[0]
    @password = content[1]
    @timestamp = content[2]
    current_user = false
  end

end

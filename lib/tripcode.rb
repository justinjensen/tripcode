require 'tripcode/version'
require 'digest/sha1'
require 'base64'

module Tripcode
  def self.hash(password)
    return "" if password.nil? || password.empty?
    password = password.encode('SHIFT_JIS', 'UTF-8', undef: :replace)
    password.gsub!('"', '&quot;')
    password.gsub!('&', '&amp;')
    password.gsub!('>', '&gt;')
    password.gsub!('<', '&lt;')
    salt = (password.b + 'H.')[1..2]
    salt.gsub!(/[^\.-z]/, '.')
    salt.tr!(':;<=>?@[\\]^_`', 'ABCDEFGabcdef')
    return password.crypt(salt)[-10..-1].strip
  end
  
  def self.secure(password, seed=SECRET)
    return "" if password.nil? || password.empty?
    seed = Base64::decode64(seed)
    password = password.encode('SHIFT_JIS', 'UTF-8', undef: :replace)
    secure_tripcode = Digest::SHA1.hexdigest(password.b + seed)
    secure_tripcode = Base64::encode64([secure_tripcode].pack('H*'))
    return secure_tripcode[0..14]
  end

  def self.parse(string, seed=SECRET)
    name, tripcode, secure_tripcode = string.split('#')
    tripcode = self.hash(tripcode)
    secure_tripcode = self.secure(secure_tripcode, seed)
    name = "" if name.nil?
    return name, tripcode, secure_tripcode
  end

  SECRET = <<-EOS
FW6I5Es311r2JV6EJSnrR2+hw37jIfGI0FB0XU5+9lua9iCCrwgkZDVRZ+1PuClqC+78FiA6hhhX
U1oq6OyFx/MWYx6tKsYeSA8cAs969NNMQ98SzdLFD7ZifHFreNdrfub3xNQBU21rknftdESFRTUr
44nqCZ0wyzVVDySGUZkbtyHhnj+cknbZqDu/wjhX/HjSitRbtotpozhF4C9F+MoQCr3LgKg+CiYH
s3Phd3xk6UC2BG2EU83PignJMOCfxzA02gpVHuwy3sx7hX4yvOYBvo0kCsk7B5DURBaNWH0srWz4
MpXRcDletGGCeKOz9Hn1WXJu78ZdxC58VDl20UIT9er5QLnWiF1giIGQXQMqBB+Rd48/suEWAOH2
H9WYimTJWTrK397HMWepK6LJaUB5GdIk56ZAULjgZB29qx8Cl+1K0JWQ0SI5LrdjgyZZUTX8LB/6
Coix9e6+3c05Pk6Bi1GWsMWcJUf7rL9tpsxROtq0AAQBPQ0rTlstFEziwm3vRaTZvPRboQfREta0
9VA+tRiWfN3XP+1bbMS9exKacGLMxR/bmO5A57AgQF+bPjhif5M/OOJ6J/76q0JDHA==
EOS
end

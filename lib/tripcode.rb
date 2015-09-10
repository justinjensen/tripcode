require "tripcode/version"

module Tripcode
  def self.hash(password)
    return "" if password.nil? || password.empty?
    password = password.strip
    password = password.gsub('&', '&amp;')
    salt = (password + 'H.')[1..2]
    salt.gsub!(/[^\.-z]/, '.')
    salt.tr!(':;<=>?@[\]^_`','ABCDEFGabcdef')
    return password.crypt(salt)[-10..-1].strip
  end
end

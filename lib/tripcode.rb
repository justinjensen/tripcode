require "tripcode/version"

module Tripcode
  def self.sjis(str)
    str.encode('shift_jis', 'utf-8', invalid: :replace, undef: :replace, replace: '')
  end
  
  def self.escape(str)
    str.gsub(/[&<">]/, '&'=>'&amp;','<'=>'&lt;','"'=>'&quot;','>'=>'&gt;')
  end

  def self.salt(password)
    password = password.encode("ASCII", "UTF-8", invalid: :replace, undef: :replace, replace: '.')
    salt = (password[0..2] + 'H.')
    salt.gsub!('[^\.-z]', '.')
    salt.tr!(':;<=>?@[\\]^_`','ABCDEFGabcdef')
    return salt[1..2]
  end
  
  def self.hash(password)
    return "" if password.nil? || password.empty?
    password = Tripcode.sjis(password)
    password = Tripcode.escape(password)
    salt = Tripcode.salt(password)
    return password.crypt(salt)[-10..-1].strip
  end
end

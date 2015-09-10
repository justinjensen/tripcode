require "tripcode/version"

module Tripcode
  SALT_TABLE =  ('.' * 47).split('') + ['/'] + ('0'..'9').to_a
  SALT_TABLE += ('A'..'G').to_a + ('A'..'Z').to_a + ('a'..'f').to_a
  SALT_TABLE += ('a'..'z').to_a + ('.' * 133).split('')

  def self.sjis(str)
    str.encode("shift_jis", invalid: :replace, undef: :replace, replace: '')
  end
  
  def self.escape(str)
    str.gsub(/[&<">]/, '&'=>'&amp;','<'=>'&lt;','"'=>'&quot;','>'=>'&gt;')
  end
  
  def self.hash(password)
    return "" if password.nil? || password.empty?
    password = Tripcode.sjis(password)
    password = Tripcode.escape(password)
    
    salt =  SALT_TABLE["#{password}H."[1].ord % 256]
    salt += SALT_TABLE["#{password}H."[2].ord % 256]
    return password.crypt(salt)[-10..-1].strip
  end
end

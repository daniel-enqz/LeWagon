def ip_to_num(ip_address)
  binary_notation = []
  final_result = 0
  until binary_notation.size == 4
    binary_notation << ("%08b" % ip_address.to_i)
    ip_address = ip_address.gsub(ip_address.to_i.to_s, "")[1..]
  end
  binary_notation.join.chars.each_with_index do |number, index|
    final_result += (2**(30 - index + 1)) if number.to_i == 1
  end 
  final_result
end
#ip_to_num("37.160.113.170")


def num_to_ip(number)    
  binary = ""
  while(number != 0)
      binary = String(number % 2) + binary
      number = number / 2
  end
  binary 
end

p num_to_ip(3232235521)
# "192.168.0.1"
# OK
phone = Hash.new(number: number)
phone[:number]

# Better
Phone = Struct.new(:number)
phone = Phone.new(number)
phone.number

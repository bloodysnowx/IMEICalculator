class IMEICalculator
  def calc(imeiString)
    if(imeiString.length != 14)
      raise "length of imei must be 14."
    end
    checkSum = 0
    imeiString.each_char.with_index(1) do |char, i|
      checkSum += Integer(char) * (i % 2 == 1 ? 1 : 2)
    end
    return imeiString.to_s + ((10 - checkSum % 10) % 10).to_s
  end
end

calculator = IMEICalculator.new
p calculator.calc(ARGV[0])

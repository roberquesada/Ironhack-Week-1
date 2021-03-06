require 'pry'

module Camera
  def take_photo
    "Photo taken in Android"
  end
end

class Device

  def initialize operative_system, inches
    @operative_system = operative_system
    @inches = inches
  end

  def print_current_time
    Time.now
  end

end

class Agenda

  attr_reader :contact_list

  def initialize
    @contact_list = []
  end

  def add_contact name, number
    @contact_list << {:name => name, :number => number}
  end

end

class Phone < Device

  include Camera

  def initialize operative_system, inches, agenda
    super(operative_system, inches)
    @agenda = agenda
  end

  def add_contact name, number
    @agenda.add_contact(name, number)
  end

  def contacts
    @agenda.contact_list
  end

  def call_contact name
    @agenda.contact_list.find { |contact| contact[:name] == name }
  end

end

class SmartWatch < Device
  include Camera

  def print_current_time
    "***#{super}***"
  end

end

class Laptop < Device

  def initialize operative_system, inches, touchable
    super(operative_system, inches)
    @touchable = touchable
  end

end


class Microwave

  def heat_food
    "Is heating!!!"
  end

  def print_current_time
    Time.now
  end
end

phone = Phone.new('IOS', 12, Agenda.new)
smartwatch = SmartWatch.new('Android', 8)
laptop = Laptop.new('Linux', 13, true)
microwave = Microwave.new


devices = [phone, smartwatch, laptop, microwave]

devices.each { |device| puts device.print_current_time}

binding.pry
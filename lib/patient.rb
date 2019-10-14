class Patient

  attr_accessor :name, :appointments

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end
  
  def appointments
    Appointment.all.select {|appointments| appointments.patient == self}
  end
  
  def doctors
    Appointment.all.collect {|appointment| appointment.doctor if appointment.patient == self}
  end
end
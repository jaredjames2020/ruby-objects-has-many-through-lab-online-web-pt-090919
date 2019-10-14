class Doctor

  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_appointment(date, patient)
    Appointment.new(date, patient, self)
  end
  
  def appointments
    Appointment.all.select {|appointment| appointment.doctor == self}
  end

  def patients
    Appointment.all.collect {|appointment| appointment.patient if appointment.doctor == self}
  end
  
end

  describe "#patient" do
    it "belongs to a patient" do
      doctor_who = Doctor.new("The Doctor")
      hevydevy = Patient.new("Devin Townsend")
      appointment = doctor_who.new_appointment(hevydevy, "Friday, January 32nd")
      expect(appointment.patient).to eq(hevydevy)
    end
  end
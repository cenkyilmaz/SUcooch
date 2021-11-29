from django.shortcuts import render

from django.http import HttpResponse

def route(request, location1, location2):

	location = {
	  "Beşiktaş": 10,
	  "Ataşehir": 50,
	  "Kadıköy": 60
	}

	distance = location[location2] - location[location1]

	return HttpResponse("Distance: " + str(distance) + " km" + "\nDuration: " + str(distance/30 * 60)  + " minutes")


class Route:

	def __init__(self, inital_location, destination, driver):

		self.inital_location = inital_location
		self.destination = destination
		self.Driver = driver

class Car:

	def __init__(self, brand, model, price):

		self.brand = brand 
		self.model = model
		self.price = price

class Driver: 

	def __init__(self, name, animal, music, baggage, numberOfSeatsAvailable, smoking, car):

		self.name = name
		self.animal = animal
		self.music = music
		self.baggage = baggage
		self.numberOfSeatsAvailable = numberOfSeatsAvailable
		self.smoking = smoking
		self.car = car
		self.rating = None
		self.rating_counter = 0

	def RateIt(self, rating):

		if self.rating == None:

			self.rating = rating
			self.rating_counter = 1

		else:

			self.rating_counter
			self.rating = (self.rating * self.rating_counter + rating) / (self.rating_counter + 1)

			self.rating_counter += 1

class Passenger:

	def __init__(self, name, animal, music, baggage, smoking):

		self.name = name
		self.animal = animal
		self.music = music
		self.baggage = baggage
		self.smoking = smoking

driver1 = Driver(name = "Ahmet", animal = True, music = False, baggage = True, numberOfSeatsAvailable = 2, smoking = True, car = Car(brand = "Mercedes", model = "C", price = 100))
driver2 = Driver(name = "Mehmet", animal = False, music = True, baggage = True, numberOfSeatsAvailable = 2, smoking = True, car = Car(brand = "BMW", model = "520i", price = 90))

passenger1 = Passenger(name = "Mina", animal = True, music = False, baggage = True, smoking = True)
passenger2 = Passenger(name = "Ayşe", animal = False, music = True, baggage = True, smoking = True)

driver_list = [driver1, driver2]
passenger_list = [passenger1, passenger2]

def findCar(request):

	# lets say passenger1 finds a car

	passenger = passenger1

	message_string = ""

	for driver in driver_list:

		if passenger.animal == driver.animal and passenger.music == driver.music and passenger.baggage == driver.baggage and passenger.smoking == driver.smoking:

			driver.RateIt(5)

			message_string = passenger.name + " matches with " + driver.name + " with rate of " + str(driver.rating) + " <br/>"

			

	# lets say passenger2 finds a car

	passenger = passenger2


	for driver in driver_list:

		if passenger.animal == driver.animal and passenger.music == driver.music and passenger.baggage == driver.baggage and passenger.smoking == driver.smoking:

			driver.RateIt(4)

			message_string += passenger.name + " matches with " + driver.name + " with rate of " + str(driver.rating)

	return HttpResponse(message_string)

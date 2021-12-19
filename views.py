from django.shortcuts import render

from django.http import HttpResponse
import datetime

locations = {
  "Beşiktaş": 10,
  "Ataşehir": 50,
  "Kadıköy": 60
}


class Booking:

	def __init__(self, route, passenger):

		self.route = route
		self.passenger = passenger

class Route:

	def __init__(self, inital_location, destination, driver, start_time, cost):

		self.inital_location = inital_location
		self.destination = destination
		self.driver = driver
		self.start_time = start_time
		self.capacity = 3
		self.cost = cost
		self.findDistance(self.inital_location, self.destination, self.driver, self.start_time)

	def findDistance(self, inital_location, destination, driver, start_time):

		distance = abs(locations[destination] - locations[inital_location])
		hour = distance / 35

		print(driver.name + " created a route between " + inital_location + " - " + destination + " with estimated distance " + str(distance) + " with estimated arrival time " + str(start_time + datetime.timedelta(hours=hour)) + " <br/>")



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

driver1 = Driver(name = "Alex", animal = True, music = False, baggage = True, numberOfSeatsAvailable = 2, smoking = True, car = Car(brand = "Mercedes", model = "C", price = 100))
driver2 = Driver(name = "Matthew", animal = False, music = True, baggage = True, numberOfSeatsAvailable = 2, smoking = True, car = Car(brand = "BMW", model = "520i", price = 90))


start_time1 = datetime.datetime(2021, 12, 17)
start_time2 = datetime.datetime(2021, 12, 18)


route1 = Route(inital_location = "Beşiktaş", destination = "Ataşehir", driver = driver1, start_time = start_time1, cost = 50)
route2 = Route(inital_location = "Kadıköy", destination = "Ataşehir", driver = driver2, start_time = start_time2, cost = 100)

passenger1 = Passenger(name = "Mina", animal = True, music = False, baggage = True, smoking = True)
passenger2 = Passenger(name = "Lily", animal = False, music = True, baggage = True, smoking = True)
passenger3 = Passenger(name = "Rachel", animal = False, music = True, baggage = True, smoking = True)


driver_list = [driver1, driver2]
passenger_list = [passenger1, passenger2]

route_list = [route1, route2]

booking_list = []

def route(request, location1, location2):

	location = {
	  "Beşiktaş": 10,
	  "Ataşehir": 50,
	  "Kadıköy": 60
	}

	distance = abs(location[location2] - location[location1])

	return HttpResponse("Distance: " + str(distance) + " km" + "\nSüre: " + str(distance/30 * 60)  + " dakika")

def findCar(request):

	message_string = ""

	# lets say passenger1 finds a car

	passenger = passenger1

	for route in route_list:
		
		driver = route.driver

		booking_counter = 0
		for booking in booking_list:

			if booking.route == route:

				booking_counter = booking_counter + 1

		if route.capacity > booking_counter and passenger.animal == driver.animal and passenger.music == driver.music and passenger.baggage == driver.baggage and passenger.smoking == driver.smoking:

			new_booking = Booking(route = route, passenger = passenger)

			booking_list.append(new_booking)

			message_string += passenger.name + " will pay " + str(route.cost) + " <br/>"

			driver.RateIt(5) #after the trip ends, passenger rates the driver

			message_string += passenger.name + " matches with " + driver.name + " with rate of " + str(driver.rating) + " <br/>"
			

			

	# lets say passenger2 finds a car

	passenger = passenger2


	for route in route_list:

		driver = route.driver

		booking_counter = 0
		for booking in booking_list:

			if booking.route == route:

				booking_counter = booking_counter + 1

		if route.capacity > booking_counter and passenger.animal == driver.animal and passenger.music == driver.music and passenger.baggage == driver.baggage and passenger.smoking == driver.smoking:

			new_booking = Booking(route = route, passenger = passenger)

			booking_list.append(new_booking)

			message_string += passenger.name + " will pay " + str(route.cost) + " <br/>"

			driver.RateIt(4) #after trip ends, passenger rates the driver

			message_string += passenger.name + " matches with " + driver.name + " with rate of " + str(driver.rating) + " <br/>"


	# lets say passenger2 finds a car

	passenger = passenger3


	for route in route_list:

		driver = route.driver

		booking_counter = 0
		for booking in booking_list:

			if booking.route == route:

				booking_counter = booking_counter + 1

		if route.capacity > booking_counter and passenger.animal == driver.animal and passenger.music == driver.music and passenger.baggage == driver.baggage and passenger.smoking == driver.smoking:

			new_booking = Booking(route = route, passenger = passenger)

			booking_list.append(new_booking)

			message_string += passenger.name + " will pay " + str(route.cost) + " <br/>"

			driver.RateIt(4) #after the trip ends, passenger rates the driver

			message_string += passenger.name + " matches with " + driver.name + " with rate of " + str(driver.rating) + " <br/>"


	for route in route_list:

		amount_of_money = 0
		for booking in booking_list:

			if booking.route == route:

				amount_of_money += route.cost

		message_string += route.driver.name + " will earn " + str(amount_of_money) + " from " + route.inital_location + " - " + route.destination + " <br/>"





	return HttpResponse(message_string)









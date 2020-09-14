########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments, create a list of the layers you identify.
    #  There are three layers: all data for all rides, data for drivers, and data for rides
    #  Things: driver id, rider id, cost, date, rating, rides
    #  Relationships: driver id, rides belong to a driver; rider id, cost, date, rating belong to a ride, etc.

# Which layers are nested in each other? Which layers are "next" to each other?
# Which layers of data "have" within it a different layer?
    # Within the outermost layer, the drivers hash, there are two additional layers.
    # There is an array layer that contains information about the trips completed by each driver.
    # There is also a hash layer that contains details about each of those trips (i.e. rider id, date, cost, rating).
    # Similarly, the middle array layer can also be considered to have within it a different layer
    # (i.e. the hash layer that contains the specific details for the trips). The outermost drivers hash layer is next to
    # the middle trips array layer which is next to the innermost hash layer containing details of the trips.

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# Layer 1 (Outermost) - Hash that represents all ride data where driver ids are keys and rides are values
# Layer 2 (Middle) - Arrays that include the rides completed by each driver (layer2 + layer3 = array of hashes)
# Layer 3 (Innermost) - Hash that contains the specific data (date, cost, rider id, rating) for each ride

# There are three layers to this data structure. The largest outer structure is a hash that contains all of the information
# about the drivers and their rides. Within the hash, the keys are the drivers and the values are arrays that contain
# information (date, rider id, cost, rating) about the drivers' rides. This information is contained in hashes that represent
# the final, innermost layer of the data structure.

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

drivers = {
    DR0001: [
        {
            date: "3rd Feb 2016",
            cost: 30,
            rider_id: "RD0015",
            rating: 4
        },
        {
            date: "3rd Feb 2016",
            cost: 10,
            rider_id: "RD0003",
            rating: 3
        },
        {
            date: "5th Feb 2016",
            cost: 45,
            rider_id: "RD0003",
            rating: 2
        },
    ],
    DR0002: [
        {
            date: "3rd Feb 2016",
            cost: 25,
            rider_id: "RD0073",
            rating: 5
        },
        {
            date: "4th Feb 2016",
            cost: 15,
            rider_id: "RD0013",
            rating: 1
        },
        {
            date: "5th Feb 2016",
            cost: 35,
            rider_id: "RD0066",
            rating: 3
        },
    ],
    DR0003: [
        {
            date: "4th Feb 2016",
            cost: 5,
            rider_id: "RD0022",
            rating: 5
        },
        {
            date: "5th Feb 2016",
            cost: 50,
            rider_id: "RD0003",
            rating: 2
        },
    ],
    DR0004: [
        {
            date: "3rd Feb 2016",
            cost: 5,
            rider_id: "RD0022",
            rating: 5
        },
        {
            date: "4th Feb 2016",
            cost: 10,
            rider_id: "RD0022",
            rating: 4
        },
        {
            date: "5th Feb 2016",
            cost: 20,
            rider_id: "RD0073",
            rating: 5
        },
    ],
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?


# The number of rides each driver has given
def num_rides(drivers)
  drivers.map do |driver, rides|
    puts "#{driver} had #{rides.length} rides"
  end
end

puts "====================== NUMBER OF RIDES ======================"
num_rides(drivers)

# The total amount of money each driver has made
def total_earnings(drivers)
  drivers.map do |driver, rides|
    total = rides.map { |ride| ride[:cost]}
    puts "#{driver} earned a total of $#{'%.2f' % total.sum}"
  end
end

puts
puts "====================== TOTAL EARNINGS ======================="
total_earnings(drivers)

# The average rating for each driver
def average_rating(drivers)
  drivers.map do |driver, rides|
    average_rating = ((rides.sum { |ride| ride[:rating] }) / rides.length.to_f)
    puts "#{driver}'s average rating is #{'%.2f' % average_rating}"
  end
end

puts
puts "====================== AVERAGE RATING ========================"
average_rating(drivers)

# Which driver made the most money?
def highest_earning_driver(drivers)
  highest_earnings = 0
  highest_earner = ""
  drivers.each do |driver, rides|
    earnings = rides.map { |ride| ride[:cost] }.sum
    if earnings > highest_earnings
      highest_earnings = earnings
      highest_earner = driver
    end
  end
  puts "#{highest_earner} made the most money for a total of $#{'%.2f' % highest_earnings}"
end

puts
puts "=================== HIGHEST EARNING DRIVER ==================="
highest_earning_driver(drivers)

# Which driver has the highest average rating?
def highest_average_rating(drivers)
  highest_rating = 0
  highest_rated_driver = ''
  drivers.each do |driver, rides|
    average_rating = ((rides.sum { |ride| ride[:rating] }) / rides.length.to_f)
    if average_rating > highest_rating
      highest_rating = average_rating
      highest_rated_driver = driver
    end
  end
  puts "#{highest_rated_driver} had the highest average rating of #{'%.2f' % highest_rating}"
end

puts
puts "=================== HIGHEST AVERAGE RATING ==================="
highest_average_rating(drivers)

# For each driver, on which day did they make the most money?
def best_day(drivers)
  drivers.each do |driver, rides|
    highest_daily_earnings = 0
    best_earnings_day = ""
    rides.each do |ride|
      if ride[:cost] > highest_daily_earnings
        best_earnings_day = ride[:date]
        highest_daily_earnings = ride[:cost]
      end
    end
    puts "#{driver}'s best day was #{best_earnings_day} when they earned $#{'%.2f' % highest_daily_earnings}"
  end
end

puts
puts "==================== HIGHEST EARNING DAY ====================="
best_day(drivers)

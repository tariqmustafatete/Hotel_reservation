--What factors affect whether customers cancel their booking?
--Are cancellations more likely during weekends?
--Which general recommendations for the hotel can you make


--Calculate the average lead time for each type of meal plan

SELECT type_of_meal_plan,ROUND( AVG(lead_time),3) AS avg_lead_time
 FROM [airbnb].[dbo].[Hotel Reservations]
GROUP BY type_of_meal_plan
order by type_of_meal_plan ;

--Count the number of bookings by arrival year and month:

SELECT arrival_year, arrival_month, COUNT(*) AS no_of_bookings
FROM [airbnb].[dbo].[Hotel Reservations]
GROUP BY arrival_year, arrival_month;

--Calculate the average price per room for each market segment type:

SELECT market_segment_type,ROUND( AVG(avg_price_per_room),3) AS avg_price
FROM [airbnb].[dbo].[Hotel Reservations]
GROUP BY market_segment_type

--Identify guests who have made multiple bookings but have also cancelled in the past:

SELECT Booking_ID, COUNT(*) AS no_of_bookings, SUM(no_of_previous_cancellations) AS total_cancellations
FROM [airbnb].[dbo].[Hotel Reservations]
WHERE no_of_previous_bookings_not_canceled > 1
GROUP BY Booking_ID
HAVING SUM(no_of_previous_cancellations) > 0

--Calculate the percentage of bookings that were cancelled:

SELECT COUNT(*) AS total_bookings, SUM(CASE WHEN booking_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_bookings,
    SUM(CASE WHEN booking_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*) AS cancellation_rate
FROM [airbnb].[dbo].[Hotel Reservations];
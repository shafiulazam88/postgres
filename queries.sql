create table Users (
  user_id serial primary key,
  role varchar(20) not null default 'customer',
  name varchar(100) not null,
  email varchar(255) not null unique,
  password text not null,
  phone varchar(20) not null
);

create table Vehicles (
  vehicle_id serial primary key,
  name varchar(100) not null,
  type varchar(20) not null,
  model varchar(100) not null,
  registration_number varchar(50) not null unique,
  rental_price_per_day int NOT NULL,
  vehicle_status varchar(100) NOT NULL DEFAULT 'available'
);

create table Bookings (
  booking_id serial primary key,
  user_id int not null references Users (user_id),
  vehicle_id int not null references Vehicles (vehicle_id),
  start_date date not null,
  end_date date not null,
  booking_status VARCHAR(20) NOT NULL,
  total_cost INT NOT NULL,
  check (end_date >= start_date),
  check (
    booking_status in ('pending', 'confirmed', 'completed', 'cancelled')
  )
);



select
  b.booking_id,
  v.name as vehicle_name,
  u.name as customer_name,
  b.start_date,
  b.end_date,
  b.booking_status,
  b.total_cost
from
  bookings as b
  inner join users as u on u.user_id = b.user_id
  inner join vehicles as v on b.vehicle_id = v.vehicle_id;



select
  *
from
  vehicles as v
where
  not exists (
    select
      *
    from
      bookings as b
    where
      b.vehicle_id = v.vehicle_id
  );



select
  *
from
  vehicles as v
where
  v.vehicle_status = 'available'
  and v.type = 'car';



select
  v.name as vehicle_name,
  count(b.booking_id) as total_bookings
from
  vehicles as v
  inner join bookings as b on b.vehicle_id = v.vehicle_id
group by
  v.vehicle_id,
  v.type
having
  count(b.booking_id) > 2;
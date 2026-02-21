-- Mock Data for Blood Donation Coordination System

-- ZIP codes
INSERT INTO zip (zip, city) VALUES
('10001', 'New York'),
('90001', 'Los Angeles'),
('60601', 'Chicago'),
('77001', 'Houston'),
('85001', 'Phoenix'),
('19101', 'Philadelphia'),
('78201', 'San Antonio'),
('92101', 'San Diego');

-- Clinics (donation centers)
INSERT INTO clinic (name, zip, address_line) VALUES
('Downtown Blood Center',     '10001', '123 Main St'),
('Westside Donation Clinic',  '90001', '456 Sunset Blvd'),
('Lakefront Medical Center',  '60601', '789 Lake Shore Dr'),
('Houston Health Clinic',     '77001', '321 Texas Ave'),
('Phoenix Donor Hub',         '85001', '654 Desert Rd');

-- Doctor home clinics
INSERT INTO doctor_home_clinic (name, zip, address_line) VALUES
('Central Medical Group',     '10001', '100 Park Ave'),
('Pacific Health Associates', '90001', '200 Ocean Dr'),
('Midwest Physicians Group',  '60601', '300 Michigan Ave');

-- Blood recipient clinics
INSERT INTO blood_recipient_clinic (name, zip, address_line, demand) VALUES
('City General Hospital',         '10001', '10 Hospital Blvd',   500.00),
('LA Medical Center',             '90001', '20 Wilshire Ave',    350.00),
('Chicago Regional Hospital',     '60601', '30 Clark St',        420.00),
('Houston Emergency Center',      '77001', '40 Memorial Dr',     280.00),
('Phoenix Community Hospital',    '85001', '50 Camelback Rd',    310.00),
('Philadelphia General',          '19101', '60 Broad St',        390.00),
('San Antonio Medical Center',    '78201', '70 Alamo Plaza',     260.00),
('San Diego Health System',       '92101', '80 Harbor Dr',       330.00),
('Northside Regional Hospital',   '10001', '90 Broadway',        410.00),
('Southside Medical Center',      '77001', '100 Kirby Dr',       295.00),
('Eastside Community Clinic',     '60601', '110 State St',       225.00),
('Westside Emergency Hospital',   '90001', '120 Venice Blvd',    375.00),
('Desert Oasis Medical Center',   '85001', '130 Scottsdale Rd',  200.00),
('Liberty Bell Hospital',         '19101', '140 Independence Ave',315.00),
('Riverwalk Health Center',       '78201', '150 Commerce St',    245.00);

-- Doctors
INSERT INTO doctor (first_name, last_name, home_clinic_id) VALUES
('James',   'Carter',   1),
('Emily',   'Ross',     1),
('Michael', 'Chen',     2),
('Sarah',   'Patel',    2),
('David',   'Kim',      3),
('Laura',   'Thompson', 3),
('Robert',  'Martinez', 1),
('Anna',    'Williams', 2);

-- Donors (40+)
INSERT INTO donor (first_name, last_name, blood_type, last_health_check_date, is_eligible_for_donation) VALUES
('Alice',     'Johnson',   'A+',  '2025-01-10', TRUE),
('Bob',       'Smith',     'O-',  '2025-02-15', TRUE),
('Carol',     'Davis',     'B+',  '2024-12-20', TRUE),
('Daniel',    'Wilson',    'AB+', '2025-03-01', TRUE),
('Eva',       'Moore',     'A-',  '2025-01-25', TRUE),
('Frank',     'Taylor',    'O+',  '2024-11-30', FALSE),
('Grace',     'Anderson',  'B-',  '2025-02-10', TRUE),
('Henry',     'Thomas',    'A+',  '2025-03-05', TRUE),
('Iris',      'Jackson',   'O+',  '2025-01-18', TRUE),
('Jack',      'White',     'AB-', '2024-10-22', FALSE),
('Karen',     'Harris',    'A+',  '2025-02-28', TRUE),
('Leo',       'Martin',    'B+',  '2025-01-05', TRUE),
('Maria',     'Garcia',    'O-',  '2025-03-10', TRUE),
('Nathan',    'Lee',       'A-',  '2024-12-15', TRUE),
('Olivia',    'Walker',    'O+',  '2025-02-20', TRUE),
('Peter',     'Hall',      'B-',  '2025-01-30', TRUE),
('Quinn',     'Allen',     'AB+', '2025-03-08', TRUE),
('Rachel',    'Young',     'A+',  '2024-11-10', FALSE),
('Samuel',    'King',      'O+',  '2025-02-05', TRUE),
('Tina',      'Wright',    'B+',  '2025-01-22', TRUE),
('Umar',      'Scott',     'A-',  '2025-03-12', TRUE),
('Victoria',  'Green',     'O-',  '2024-12-28', TRUE),
('William',   'Baker',     'AB+', '2025-02-12', TRUE),
('Xena',      'Adams',     'A+',  '2025-01-08', TRUE),
('Yusuf',     'Nelson',    'B-',  '2025-03-03', TRUE),
('Zoe',       'Carter',    'O+',  '2024-12-05', TRUE),
('Aaron',     'Mitchell',  'A+',  '2025-02-18', TRUE),
('Bella',     'Perez',     'B+',  '2025-01-14', TRUE),
('Chris',     'Roberts',   'O-',  '2025-03-07', TRUE),
('Diana',     'Turner',    'AB-', '2024-11-20', FALSE),
('Ethan',     'Phillips',  'A-',  '2025-02-25', TRUE),
('Fiona',     'Campbell',  'O+',  '2025-01-19', TRUE),
('George',    'Parker',    'B+',  '2025-03-11', TRUE),
('Hannah',    'Evans',     'A+',  '2024-12-10', TRUE),
('Ivan',      'Edwards',   'O-',  '2025-02-08', TRUE),
('Julia',     'Collins',   'B-',  '2025-01-27', TRUE),
('Kevin',     'Stewart',   'AB+', '2025-03-04', TRUE),
('Linda',     'Sanchez',   'A+',  '2024-11-15', TRUE),
('Marcus',    'Morris',    'O+',  '2025-02-22', TRUE),
('Nina',      'Rogers',    'B+',  '2025-01-11', TRUE),
('Oscar',     'Reed',      'A-',  '2025-03-09', TRUE),
('Paula',     'Cook',      'O-',  '2024-12-18', TRUE),
('Quentin',   'Morgan',    'AB+', '2025-02-14', TRUE),
('Rosa',      'Bell',      'B-',  '2025-01-23', TRUE),
('Steve',     'Murphy',    'O+',  '2025-03-06', TRUE);

-- Donations (20+)
INSERT INTO donation (date, donor_id, doctor_id, clinic_id, amount_ml) VALUES
('2025-01-15', 1,  1, 1, 450.00),
('2025-01-18', 2,  2, 1, 475.00),
('2025-01-20', 3,  3, 2, 450.00),
('2025-01-22', 4,  4, 2, 500.00),
('2025-01-25', 5,  5, 3, 450.00),
('2025-01-28', 7,  6, 3, 475.00),
('2025-02-01', 8,  7, 4, 450.00),
('2025-02-03', 9,  8, 4, 500.00),
('2025-02-05', 11, 1, 5, 450.00),
('2025-02-08', 12, 2, 5, 475.00),
('2025-02-10', 13, 3, 1, 450.00),
('2025-02-12', 14, 4, 2, 500.00),
('2025-02-15', 15, 5, 3, 450.00),
('2025-02-18', 16, 6, 4, 475.00),
('2025-02-20', 17, 7, 5, 450.00),
('2025-02-22', 19, 8, 1, 500.00),
('2025-02-25', 20, 1, 2, 450.00),
('2025-02-28', 21, 2, 3, 475.00),
('2025-03-02', 22, 3, 4, 450.00),
('2025-03-05', 23, 4, 5, 500.00),
('2025-03-07', 24, 5, 1, 450.00),
('2025-03-09', 25, 6, 2, 475.00);

-- Deliveries (15+, one per donation due to 1:1 constraint)
INSERT INTO delivery (date, donation_id, blood_recipient_clinic_id) VALUES
('2025-01-16', 1,  1),
('2025-01-19', 2,  2),
('2025-01-21', 3,  3),
('2025-01-23', 4,  4),
('2025-01-26', 5,  5),
('2025-01-29', 6,  6),
('2025-02-02', 7,  7),
('2025-02-04', 8,  8),
('2025-02-06', 9,  9),
('2025-02-09', 10, 10),
('2025-02-11', 11, 11),
('2025-02-13', 12, 12),
('2025-02-16', 13, 13),
('2025-02-19', 14, 14),
('2025-02-21', 15, 15),
('2025-02-23', 16, 1),
('2025-02-26', 17, 3);

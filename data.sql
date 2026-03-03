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

-- Donations (recent dates so "last 7 days" queries return data)
INSERT INTO donation (date, donor_id, doctor_id, clinic_id, amount_ml) VALUES
(current_date - 10, 1,  1, 1, 450.00),
(current_date -  9, 2,  2, 1, 475.00),
(current_date -  8, 3,  3, 2, 450.00),
(current_date -  7, 4,  4, 2, 500.00),
(current_date -  6, 5,  5, 3, 450.00),
(current_date -  6, 7,  6, 3, 475.00),
(current_date -  5, 8,  7, 4, 450.00),
(current_date -  5, 9,  8, 4, 500.00),
(current_date -  4, 11, 1, 5, 450.00),
(current_date -  4, 12, 2, 5, 475.00),
(current_date -  3, 13, 3, 1, 450.00),
(current_date -  3, 14, 4, 2, 500.00),
(current_date -  2, 15, 5, 3, 450.00),
(current_date -  2, 16, 6, 4, 475.00),
(current_date -  1, 17, 7, 5, 450.00),
(current_date -  1, 19, 8, 1, 500.00),
(current_date,      20, 1, 2, 450.00),
(current_date,      21, 2, 3, 475.00),
(current_date,      22, 3, 4, 450.00),
(current_date,      23, 4, 5, 500.00);

-- Deliveries (one per donation for delivered subset; still respects UNIQUE donation_id)
INSERT INTO delivery (date, donation_id, blood_recipient_clinic_id) VALUES
(current_date -  9, 1,  1),
(current_date -  8, 2,  2),
(current_date -  7, 3,  3),
(current_date -  6, 4,  4),
(current_date -  5, 5,  5),
(current_date -  5, 6,  6),
(current_date -  4, 7,  7),
(current_date -  4, 8,  8),
(current_date -  3, 9,  9),
(current_date -  3, 10, 10),
(current_date -  2, 11, 11),
(current_date -  2, 12, 12),
(current_date -  1, 13, 13),
(current_date -  1, 14, 14),
(current_date,      15, 15);

-- Blood requests (>=15). Some fulfilled, some open (unfulfilled).
INSERT INTO blood_request (request_date, blood_recipient_clinic_id, blood_type, amount_ml, status, fulfilled_by_donation_id) VALUES
(current_date - 3,  1, 'A+', 450, 'FULFILLED', 13),
(current_date - 3,  2, 'O-', 450, 'OPEN',      NULL),
(current_date - 2,  3, 'B+', 475, 'FULFILLED', 11),
(current_date - 2,  4, 'AB+',500, 'OPEN',      NULL),
(current_date - 2,  5, 'A-', 450, 'FULFILLED', 12),
(current_date - 2,  6, 'O+', 450, 'OPEN',      NULL),
(current_date - 1,  7, 'B-', 475, 'OPEN',      NULL),
(current_date - 1,  8, 'A+', 450, 'FULFILLED', 15),
(current_date - 1,  9, 'O+', 450, 'OPEN',      NULL),
(current_date - 1, 10, 'AB-',500, 'OPEN',      NULL),
(current_date,     11, 'B+', 450, 'OPEN',      NULL),
(current_date,     12, 'A+', 450, 'OPEN',      NULL),
(current_date,     13, 'O-', 475, 'OPEN',      NULL),
(current_date,     14, 'A-', 450, 'OPEN',      NULL),
(current_date,     15, 'AB+',500, 'OPEN',      NULL);
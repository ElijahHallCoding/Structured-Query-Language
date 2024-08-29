-- Create the Tables

-- Create the Members Table
CREATE TABLE Members (
    id INT PRIMARY KEY,               -- Unique identifier for each member
    name VARCHAR(255) NOT NULL,       -- Member's name, cannot be NULL
    age INT                           -- Member's age
);

-- Create the WorkoutSessions Table
CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY,       -- Unique identifier for each workout session
    member_id INT,                    -- Foreign key referencing the member's ID in the Members table
    session_date DATE,                -- Date of the workout session
    session_time VARCHAR(50),         -- Time of the workout session
    activity VARCHAR(255),            -- Activity performed during the session
    FOREIGN KEY (member_id) REFERENCES Members(id)  -- Establishing the foreign key relationship
);

-- Task 1: SQL Data Insertion

-- Step 1: Insert Records into the Members Table
INSERT INTO Members (id, name, age) VALUES
(1, 'Jane Doe', 28),
(2, 'John Smith', 35),
(3, 'Imperia Manning', 22),
(4, 'Michael Brown', 40);

-- Step 2: Insert Records into the WorkoutSessions Table
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) VALUES
(1, 1, '2024-08-28', '08:00 AM', 'Yoga'),
(2, 2, '2024-08-28', '07:00 AM', 'Cardio'),
(3, 3, '2024-08-28', '09:00 AM', 'Weight Training'),
(4, 4, '2024-08-28', '06:00 AM', 'Swimming');

-- Task 2: SQL Data Update

-- Update Workout Session Time for Jane Doe
UPDATE WorkoutSessions
SET session_time = '06:00 PM'  -- Changing from morning to evening
WHERE member_id = (SELECT id FROM Members WHERE name = 'Jane Doe');

-- Task 3: SQL Data Deletion

-- Step 1: Delete John Smith’s Record from the Members Table
DELETE FROM Members
WHERE name = 'John Smith';

-- Step 2: Also Delete John's Associated Workout Sessions
DELETE FROM WorkoutSessions
WHERE member_id = (SELECT id FROM Members WHERE name = 'John Smith');
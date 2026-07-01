DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS oc_activities;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS oc_activities (
    activity_id VARCHAR(15) PRIMARY KEY,
    activity_number VARCHAR(12) NOT NULL,
    trip_title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    start_date DATE NOT NULL,
    start_location VARCHAR(255),
    start_time VARCHAR(255),
    end_date DATE,
    end_time VARCHAR(255),
    PRIMARY KEY (activity_id)
);

CREATE TABLE IF NOT EXISTS activity_reports (
    report_id SERIAL,
    activity_id VARCHAR(15),

    PRIMARY KEY (report_id),
    FOREIGN KEY (activity_id) REFERENCES oc_activities(activity_id)
)

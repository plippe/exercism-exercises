extern crate chrono;
use chrono::{DateTime, Duration, Utc};

// Returns a Utc DateTime one billion seconds after start.
pub fn after(start: DateTime<Utc>) -> DateTime<Utc> {
    let gigasecond = 10_i64.pow(9);
    start + Duration::seconds(gigasecond)
}
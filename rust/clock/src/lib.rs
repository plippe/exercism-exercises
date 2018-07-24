const MINUTES_IN_DAY: i64 = 60 * 24;

#[derive (PartialEq, Debug)]
pub struct Clock { time: u64 }

impl Clock {
    pub fn new(hours: i64, minutes: i64) -> Clock {
        Clock { time: Self::to_minutes(hours, minutes) }
    }

    pub fn add_minutes(&self, minutes: i64) -> Clock {
        Clock { time: Self::to_minutes(0, self.time as i64 + minutes) }
    }

    pub fn to_minutes(hours: i64, minutes: i64) -> u64 {
        let total_minutes = (hours * 60) + minutes;
        let total_minutes_for_a_day = total_minutes % MINUTES_IN_DAY;
        let total_minutes_for_a_day_abs = 
            if total_minutes > 0 { total_minutes_for_a_day } 
            else { total_minutes_for_a_day + MINUTES_IN_DAY };

        total_minutes_for_a_day_abs as u64
    }

    pub fn hours(&self) -> u64 { self.time / 60 }
    pub fn minutes(&self) -> u64 { self.time % 60 }
}

use std::fmt;
impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours(), self.minutes())
    }
}

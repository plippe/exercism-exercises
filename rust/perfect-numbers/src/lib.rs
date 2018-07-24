use std::cmp::Ordering::{Equal, Greater, Less};

#[derive(Debug, PartialEq, Eq)]
pub enum Classification {
    Abundant,
    Perfect,
    Deficient
}

pub fn classify(num: u64) -> Option<Classification> {
    let aliquot_sum = (1..num)
        .filter(|d| num % d == 0)
        .sum::<u64>();
        
    match (num, aliquot_sum.cmp(&num)) {
        (0, _) => None,
        (_, Greater) => Some(Classification::Abundant),
        (_, Less) => Some(Classification::Deficient),
        (_, Equal) => Some(Classification::Perfect),
    }
}

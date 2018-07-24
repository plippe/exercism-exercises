extern crate regex;
use regex::{Regex};

pub fn is_valid_isbn(isbn: &str) -> bool {
    let re = Regex::new(r"^[0-9]-?[0-9]{3}-?[0-9]{5}-?[0-9X]$").unwrap();

    re.is_match(isbn) &&
        isbn.chars()
            .filter(|c| c != &'-')
            .map(|c| c.to_digit(10).unwrap_or(10))
            .zip((1..=10).rev())
            .map(|(a, b)| a * b)
            .sum::<u32>()
            .wrapping_rem(11)
            .eq(&0)
}
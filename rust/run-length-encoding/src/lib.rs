// https://github.com/rust-lang-nursery/rustup.rs#working-with-nightly-rust
#![feature(option_filter)]

extern crate regex;
use regex::{Captures, Regex};

pub fn chars_to_number(acc: u32, c: char) -> u32 {
    c
        .to_digit(10)
        .map(|n| acc * 10 + n)
        .unwrap_or(0)
}

pub fn encode(source: &str) -> String {
    fn char_count_push_char(mut acc: Vec<(u32, char)>, c: char) -> Vec<(u32, char)> {
        acc
            .last()
            .cloned()
            .filter(|(_, old_c)| old_c == &c)
            .map(|(old_count, old_c)| {
                acc.pop();
                acc.push((old_count + 1, old_c));
            })
            .unwrap_or_else(||
                acc.push((1, c))
            );

        acc
    }

    fn char_count_to_string((count, c): &(u32, char)) -> String {
        match count {
            1 => c.to_string(),
            _ => format!("{}{}", count, c),
        }
    }

    source
        .chars()
        .fold(vec![], char_count_push_char)
        .iter()
        .map(char_count_to_string)
        .collect::<Vec<String>>()
        .join("")
}

pub fn decode(source: &str) -> String {

    fn caps_to_count_and_char(caps: Captures) -> (u32, char) {
        let count = caps.get(1).map(|m| m.as_str().chars().fold(0, chars_to_number).max(1)).unwrap_or(1);
        let c = caps.get(2).and_then(|m| m.as_str().chars().next()).unwrap_or(' ');

        (count, c)
    }

    fn char_count_to_string((count, c): (u32, char)) -> String {
        c.to_string().repeat(count as usize)
    }

    Regex::new(r"([0-9]*)([a-zA-Z ])")
        .unwrap()
        .captures_iter(source)
        .map(caps_to_count_and_char)
        .map(char_count_to_string)
        .collect::<Vec<String>>()
        .join("")
}
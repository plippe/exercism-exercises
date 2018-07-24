pub fn series(digits: &str, len: usize) -> Vec<String> {
    match len {
        0 => vec!["".to_string(); digits.len() + 1],
        _len => digits.chars()
            .collect::<Vec<char>>()
            .windows(_len)
            .map(|chars| chars.iter().cloned().collect::<String>())
            .collect(),
    }
}
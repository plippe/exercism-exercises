use std::collections::HashSet;

pub fn check(candidate: &str) -> bool {
    let special_chars = [' ', '-'];
    let mut set = HashSet::new();

    candidate
        .to_lowercase()
        .chars()
        .filter(|c| !special_chars.iter().any(|s| s == c))
        .all(|c| set.insert(c))
}
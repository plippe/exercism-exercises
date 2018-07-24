pub fn build_proverb(list: Vec<&str>) -> String {
    let start = list.windows(2)
        .map(|window| format!("For want of a {} the {} was lost.\n", window[0], window[1]))
        .collect::<Vec<String>>()
        .join("");

    let end = list.first().map_or("".to_string(), |head| format!("And all for the want of a {}.", head));

    start + &end
}
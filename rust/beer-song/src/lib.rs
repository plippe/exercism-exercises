pub fn verse(n: i32) -> String {
    fn count(n: i32) -> String {
        match n {
            0 => "No more bottles".to_string(),
            1 => "1 bottle".to_string(),
            _n => format!("{} bottles", _n),
        }
    }

    fn drink(n: i32) -> String {
        match n {
            0 => "Go to the store and buy some more".to_string(),
            1 => "Take it down and pass it around".to_string(),
            _ => "Take one down and pass it around".to_string(),
        }
    };

    fn next(n: i32) -> i32 {
        match n {
            0 => 99,
            _n => _n - 1,
        }
    }

    format!("{} of beer on the wall, {} of beer.\n{}, {} of beer on the wall.\n",
        count(n),
        count(n).to_lowercase(),
        drink(n),
        count(next(n)).to_lowercase())
}

pub fn sing(start: i32, end: i32) -> String {
    (end..=start).map(verse).rev().collect::<Vec<String>>().join("\n")
}
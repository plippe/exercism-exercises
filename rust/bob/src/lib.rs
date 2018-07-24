pub fn reply(message: &str) -> &str {
    let is_question = message.trim().ends_with("?");
    let is_yell = message == message.to_uppercase() && message != message.to_lowercase();
    let is_empty = message.trim().is_empty();

    match (is_question, is_yell, is_empty) {
        (_, _, true) => "Fine. Be that way!",
        (true, true, _) => "Calm down, I know what I'm doing!",
        (true, _, _) => "Sure.",
        (_, true, _) => "Whoa, chill out!",
        _ => "Whatever.",
    }
}
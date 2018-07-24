pub fn raindrops(n: usize) -> String {
    let factors = [
        (3, "Pling"),
        (5, "Plang"),
        (7, "Plong")
    ];

    let output = factors
        .iter()
        .fold(String::new(), |acc, &(f, str)| 
            if n % f == 0 { acc + str }
            else { acc }
        );

    if ! output.is_empty() { output } 
    else { n.to_string() }
}
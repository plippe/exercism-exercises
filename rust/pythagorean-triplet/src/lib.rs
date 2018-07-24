pub fn is_pythagorean_triplet(a: &u32, b: &u32, c: &u32) -> bool {
    a.pow(2) + b.pow(2) == c.pow(2)
}

pub fn find() -> Option<u32> {

    let sum = 1000;

    (1..sum)
        .map(|a| (a, sum -a))
        .flat_map(|(a, max_b)|
            (a..max_b)
                .map(|b| (a, b, sum - a - b))
                .filter(|(a, b, c)| is_pythagorean_triplet(a, b, c))
                .collect::<Vec<(u32, u32, u32)>>()
        )
        .collect::<Vec<(u32, u32, u32)>>()
        .first()
        .map(|(a, b, c)| a * b * c)

}
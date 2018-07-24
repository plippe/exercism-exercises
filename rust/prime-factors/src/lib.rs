pub fn push(mut vec: Vec<u64>, n: u64) -> Vec<u64> {
    vec.push(n);
    vec
}

pub fn factors(n: u64) -> Vec<u64> {
    fn recursive(n: u64, d: u64, vec: Vec<u64>) -> Vec<u64> {
        match n {
            1 => vec,
            _n if _n % d == 0 => recursive(_n / d, d, push(vec, d)),
            _n => recursive(_n, d + 1, vec),
        }
    }

    recursive(n, 2, Vec::new())
}
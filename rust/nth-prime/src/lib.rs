pub fn is_prime(n: u32) -> bool {
    ! (2..n - 1).any(|i| n % i == 0)
}

pub fn nth(n: u32) -> Option<u32> {
    match n {
        n if n <= 0 => None,
        n => (1..).filter(|c| is_prime(*c)).nth(n as usize),
    }
}
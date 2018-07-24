pub fn collatz(n: u64) -> Option<u64> {
    fn recursive(n: u64, s: u64) -> Option<u64> {
        match n {
            0 => None,
            1 => Some(s),
            _n if n % 2 == 0 => recursive(_n / 2, s + 1),
            _n => recursive(_n * 3 + 1, s + 1),
        }
    }

    recursive(n, 0)
}
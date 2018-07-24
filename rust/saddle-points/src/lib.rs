pub fn find_saddle_points(input: &[Vec<u64>]) -> Vec<(usize, usize)> {

    fn is_greatest_in_row(input: &[Vec<u64>], row_index: usize, value: u64) -> bool {
        input[row_index]
            .iter()
            .all(|cell| &value >= cell)
    };

    fn is_smallest_in_column(input: &[Vec<u64>], column_index: usize, value: u64) -> bool {
        input
            .iter()
            .map(|row| row[column_index])
            .all(|cell| value <= cell)
    };

    fn is_saddle_points(input: &[Vec<u64>], row_index: usize, column_index: usize) -> bool {
        let value = input[row_index][column_index];
        is_greatest_in_row(input, row_index, value) && is_smallest_in_column(input, column_index, value)
    };

    input.iter()
        .enumerate()
        .flat_map(|(row_index, _)|
            input[row_index]
                .iter()
                .enumerate()
                .map(|(column_index, _)| (row_index, column_index))
                .collect::<Vec<(usize, usize)>>()
        )
        .filter(|(row_index, column_index)| is_saddle_points(input, *row_index, *column_index))
        .collect()

}
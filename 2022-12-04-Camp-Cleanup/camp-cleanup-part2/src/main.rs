use std::env;
use std::fs;
use std::iter::Iterator;


struct Range {
    start: i32,
    end: i32,
}


fn get_filename(args: Vec<String>) -> String {
    let mut filename = "input.txt";
    if args.len() > 1 {
        filename = &args[1];
    }
    return filename.to_string();
}

fn is_in_range(range: &Range, number: i32) -> bool {
    return number >= range.start && number <= range.end;
}

fn get_overlap(range_a: &Range, range_b: &Range) -> i32 {

    let mut overlap = 0;

    let start = if range_a.start < range_b.start { range_a.start } else { range_b.start };
    let end = if range_a.end > range_b.end { range_a.end + 1 } else { range_b.end + 1 };

    for n in 1..3 {
        println!("for test: {n}");
    }

    for i in start..end {
        if is_in_range(range_a, i) && is_in_range(range_b, i) {
            overlap += 1;
        }
    }
    
    return overlap;
}

fn has_overlap(range_a: &Range, range_b: &Range) -> bool {
    return (range_a.start <= range_b.start && range_a.end >= range_b.start)
    || (range_b.start <= range_a.start && range_b.end >= range_a.start)
}

fn has_no_overlap(range_a: &Range, range_b: &Range) -> bool {
    return range_a.end < range_b.start || range_b.end < range_a.start
}

fn map_assignment_to_range(assignment: &str) -> Range {
    let positions: Vec<&str> = assignment.split("-").collect();

    let range = Range {
        start: positions[0].parse().unwrap(),
        end: positions[1].parse().unwrap()
    };

    return range;
}

fn main() {
    let file_name = get_filename(env::args().collect());
    println!("\nReading from file {}\n", file_name);

    let file_content = fs::read_to_string(file_name)
        .expect("Should have been able to read the file");

    let mut total_overlap = 0;

    for line in file_content.split("\n") {

        let assignments: Vec<&str> = line.split(",").collect();

        let range_a = map_assignment_to_range(assignments[0]);
        let range_b = map_assignment_to_range(assignments[1]);

        if has_overlap(&range_a, &range_b) {
            total_overlap += 1;
        }
    }

    println!("\nResult: {total_overlap}");
}
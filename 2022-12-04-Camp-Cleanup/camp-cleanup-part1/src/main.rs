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

fn is_contained(range_a: &Range, range_b: &Range) -> bool {
    return range_b.start >= range_a.start && range_b.end <= range_a.end;
}

fn map_assignment_to_range(assignment: &str) -> Range {
    let positions: Vec<&str> = assignment.split("-").collect();

    let range = Range {
        start: positions[0].parse().unwrap(),
        end: positions[1].parse().unwrap()
    };

    // println!("range: {0}..{1}", range.start, range.end);

    return range;
}

fn main() {
    let file_name = get_filename(env::args().collect());
    println!("\nReading from file {}\n", file_name);

    let file_content = fs::read_to_string(file_name)
        .expect("Should have been able to read the file");

    let mut counter = 0;

    for line in file_content.split("\n") {
        // println!("line: {line}");

        let assignments: Vec<&str> = line.split(",").collect();

        let range_a = map_assignment_to_range(assignments[0]);
        let range_b = map_assignment_to_range(assignments[1]);

        let a_in_b = is_contained(&range_b, &range_a);
        let b_in_a = is_contained(&range_a, &range_b);

        if a_in_b || b_in_a {
            counter += 1;
        }
    }

    println!("\nResult: {counter}");
}
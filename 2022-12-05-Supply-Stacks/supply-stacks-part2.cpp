#include <string>
#include <fstream>
#include <iostream>
#include <queue>
#include <vector>


void print_deques(std::vector<std::deque<char>> list) {
    std::vector<std::deque<char>> copy = list;
    for (std::deque<char> &deque : copy) {
        std::deque<char> fronts = deque;
        std::cout << "Queue front";
        while (!fronts.empty()) {
            std::cout << '\t' << fronts.front();
            fronts.pop_front();
        }
        std::cout << "\n";
    }
}

int main(int argc, char *argv[]) {

    // Overwrite input file name via program arguments if necessary
    std::string filename{"input.txt"};
    if (argc > 1) {
        filename = argv[1];
    }
    std::cout << "\nReading from file " << filename << "\n\n";

    // Open file and read its content
    std::ifstream input{filename};
    if (!input.is_open()) {
        std::cerr << "Couldn't read file: " << filename << "\n";
        return 1; 
    }

    std::vector<std::deque<char>> deques;

    int number_of_stacks = 0;
    bool parsing_crate_area = true;

    std::string line;
    int line_counter = 0;

    while (std::getline(input, line)) {
        if (line_counter == 0) {
            // Calculate number of stacks only in the first line
            number_of_stacks = (line.length() + 1) / 4;

            deques.resize(number_of_stacks);
        }

        if (line.length() == 0) {
            std::cout << "(line " << line_counter << ") - Skipping empty line\n";

        } else if (parsing_crate_area) {
            // Parse crates

            if (line[1] == '1') {
                // Line containing crate numbers
                std::cout << "(line " << line_counter << ") - Skipping numbers line\n";
                parsing_crate_area = false;

            } else {
                for (int stack = 0; stack < number_of_stacks; stack++) {

                    std::string raw_crate =  line.substr(stack * 4, 3);
                    char crate = raw_crate[1];
                    
                    if (crate != ' ') {
                        std::cout << "(line " << line_counter << ") - Reading crate '" << crate << "' in stack " << (stack + 1) << "\n";
                        deques[stack].push_front(crate);
                    }
                }
            }

        } else {
            // Parse moves

            int position_from = line.find(" from");
            int position_to = line.find(" to");

            int amount = stoi(
                line.substr(5, position_from - 5)
            );
            int from = stoi(
                line.substr(position_from + 6, position_to - position_from - 6)
            );
            int to = stoi(
                line.substr(position_to + 4)
            );

            std::cout << "(line " << line_counter << ") - Reading amount '"
                 << amount << "' from '"
                 << from << "' to '"
                 << to << "'\n";

            // print_deques(deques);

            std::vector<char> temp;
            while(amount > 0) {
                temp.push_back(deques[from - 1].back());
                deques[from - 1].pop_back();
                amount--;
            }

            for(std::vector<int>::size_type t = temp.size(); t > 0 ; t--) {
                deques[to - 1].push_back(temp[t-1]);
            }

            // print_deques(deques);

        }
        
        line_counter++;
    }

    std::cout << "\n ---------------------------------------- \n\n";
    for (std::deque<char> &deque : deques) {
        std::cout << deque.back();
    }
    std::cout << "\n";    

    return 0;
}
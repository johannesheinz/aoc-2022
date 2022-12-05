#include <string>
#include <fstream>
#include <iostream>
#include <stack>
#include <vector>


void reverse_stack(std::vector<std::stack<char>> &source, std::vector<std::stack<char>> &target) {
    for(std::vector<std::stack<char>>::size_type i = 0; i < source.size(); i++) {
        std::stack<char> stack = source[i];
        
        while (!stack.empty()) {
            target[i].push(stack.top());
            stack.pop();
        }
    }
}

// (!) destorys the stack while printing
void print_stack(std::vector<std::stack<char>> &stack_list) {
    int couter = 1;
    for (std::stack<char> &stack : stack_list) {
        std::cout << "Stack ";
        while (!stack.empty()) {
            std::cout << stack.top() << ", ";
            stack.pop();
        }
        std::cout << "\n";
        couter++;
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

    std::vector<std::stack<char>> stacks;
    std::vector<std::stack<char>> inverse_stacks;

    int number_of_stacks = 0;
    bool parsing_crate_area = true;

    std::string line;
    int line_counter = 0;

    while (std::getline(input, line)) {
        if (line_counter == 0) {
            // Calculate number of stacks only in the first line
            number_of_stacks = (line.length() + 1) / 4;

            stacks.resize(number_of_stacks);
            inverse_stacks.resize(number_of_stacks);
        }

        if (line.length() == 0) {
            std::cout << "(line " << line_counter << ") - Skipping empty line\n";

        } else if (parsing_crate_area) {
            // Parse crates

            if (line[1] == '1') {
                // Line containing crate numbers
                std::cout << "(line " << line_counter << ") - Skipping numbers line\n";
                parsing_crate_area = false;
                reverse_stack(inverse_stacks, stacks);
                // print_stack(stacks);

            } else {
                for (int stack = 0; stack < number_of_stacks; stack++) {

                    std::string raw_crate =  line.substr(stack * 4, 3);
                    char crate = raw_crate[1];
                    
                    if (crate != ' ') {
                        std::cout << "(line " << line_counter << ") - Reading crate '" << crate << "' in stack " << (stack + 1) << "\n";
                        inverse_stacks[stack].push(crate);
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

            while(amount > 0) {
                stacks[to - 1].push(stacks[from - 1].top());
                stacks[from - 1].pop();
                amount--;
            }
        }
        
        line_counter++;
    }

    std::cout << "\n ---------------------------------------- \n\n";
    // print_stack(stacks);
    for (std::stack<char> &stack : stacks) {
        std::cout << stack.top();
    }
    std::cout << "\n";    

    return 0;
}
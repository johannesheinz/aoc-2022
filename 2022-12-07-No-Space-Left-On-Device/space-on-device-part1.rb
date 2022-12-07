
class Directory

    def initialize(name, parent)
        @name = name
        @parent = parent

        @size = 0
        @children = Array.new

        unless @parent.nil?
            @parent.addChild(self)
        end
    end

    def addFile(file)
        @size += file

        unless @parent.nil?
            @parent.addFile(file)
        end
    end
    
    def addChild(child)
        puts "Added child #{child.getName} to #{@name}"
        @children << child
    end

    def getName()
        @name
    end

    def getPath()
        unless @parent.nil?
            @parent.getPath + @name + "/"
        else
            @name
        end
    end

    def getParent()
        @parent
    end

    def print(indentation = 0)
        puts " " * indentation + "DIR '#{@name}' #{@size} incl. #{@children.length} children"

        @children.each do |child|
            child.print(indentation + 4)
        end
    end

    def sum()
        total = @size <= 100000 ? @size : 0

        @children.each do |child|
            total += child.sum
        end

        total
    end
end


filename = ARGV.length > 0 ? ARGV[0] : "input.txt"
puts "Reading from #{filename}"
puts

root = nil
current = nil

File.foreach(filename) { |line|

    inputs = line.split

    case first = inputs.shift
    when "$"
        case command = inputs.shift
        when "cd"
            case target = inputs.shift
            when "/"
                root = Directory.new(target, nil)
                current = root
            when ".."
                current = current.getParent()
            else
                current = Directory.new(target, current)
            end
            # puts "cd #{target}"
        when "ls"
            # puts "ls"
        else
            puts "Invalid command: #{command}"
        end
    when "dir"
        directroy_name = inputs.shift
        # puts "Found directory: #{directroy_name}"
    when /\d+/
        file_size = Integer(first)
        file_name = inputs.shift
        puts "Found file '#{current.getPath}#{file_name}' with size #{file_size}"
        current.addFile(file_size)
    else
        puts  "No match: #{first} #{inputs}"
    end
}

puts
root.print
puts

puts "-" * 20
puts " RESULT: #{root.sum}"
puts "-" * 20

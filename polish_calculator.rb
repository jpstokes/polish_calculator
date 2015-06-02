#!/usr/bin/env ruby

class PolishCalculator
  def operate
    args = []
    numbers = []
    input = nil

    while input != 'q'
      begin
        case input
        when /^-?\d+(\.\d{1,2})?$/
          args.push(input.to_f)
        when '+', '**', '-', '/', '*', '%'
          if args.count > 1
            numbers = args.pop(2)
            args.push(numbers[0].send(input, numbers[1]))
          else
            raise 'Error: There must be 2 numbers in stack.'
          end
        else
          raise 'Error: you must enter either a digit or an operator.' if args.any?
        end
      rescue Exception => e
        p e.message
      end

      p args.last if args.any?
      input = gets.chomp
    end
  end
end

PolishCalculator.new.operate

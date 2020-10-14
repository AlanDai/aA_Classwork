require_relative "employee.rb"

class Manager < Employee
    def initialize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        employee_total = 0
        @employees.each { |emp| employee_total += emp.salary }
        employee_total * multiplier
        # @employees.map(&:salary).sum * multiplier
    end
end
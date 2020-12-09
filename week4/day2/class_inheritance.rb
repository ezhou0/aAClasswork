class Employee
  attr_reader :name, :salary, :title
  attr_writer :boss

  def initialize(name, salary, title, boss = nil)
    @name = name
    @salary = salary
    @title = title
    self.boss = boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

  def boss=(boss)
    @boss = boss
    @boss.add_employee(self) unless @boss.nil?
  end
end

class Manager < Employee
  attr_reader :employees
  def initialize(name, salary, title, boss = nil)
    super
    @employees = []
  end

  def add_employee(employee)
    employees << employee
  end

  def bonus(multiplier)
    self.total_salary * multiplier
  end

  def total_salary
    total = 0
    self.employees.each do |employee|
      if employee.is_a? (Manager)
        total += employee.salary + employee.total_salary
      else
        total += employee.salary
      end
    end
    total
  end

end

ned = Manager.new("Ned", 1000000, "Founder")
darren = Manager.new("Darren", 78000, "TA", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "ta", darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
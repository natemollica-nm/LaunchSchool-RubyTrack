# Find File::path and File#path methods in Ruby Documentation
# How do they differ?

# File::path (Ruby 2.5.0) is a Class Method while file#path is an Class Instance Method.
# Class Method (File::path) --> Returns string representation of the path.
#   Examples: File.path("/dev/null") ===> "/dev/null" , File.path(Pathname.new("/tmp") ===> "/tmp"

# Instance Method (File#path) --> Returns the pathname used to create file as a string. Does not normalize the name.
#     Notes: 
#       1. Pathname may not point to the file corresponding to file.
#   Examples File.new("testfile").path ===> "testfile" , File.new("/tmp/../tmp/xxx", "w").path ===> "/tmp/../tmp/xxx"

# Answer: Class methods differ from instance methods in that for an instance method to work you'll need an 
#        instantiated object of that class to call that method upon whereas a class method is called upon 
#         the class directly. Their definitions syntactically are different as well: (see below)

class Student
  @@class_variable = "This is a class var." 
  def initialize(name = "N/A", id = 0000)
    @student_name = name
    @student_id = id
  end
  
  def student_info # Instance variable of instantiated Student object to retrieve student info.
    [@student_name, @student_id]
  end

  def self.class_var # This is a class method (indicated by using 'self' keyword) to access the class variable 'class_variable' and return it.
    @@class_variable
  end
end

nate = Student.new("Nate", 123456)
puts nate.student_info
puts Student.class_var
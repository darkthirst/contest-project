# frozen_string_literal: true

module GlobalHelper
  DATA_ISSUE_MESSAGE = "\nIssue with input data. Please check data format. Example: 1,S1-88,S2-53,S3-69,S4-64\n\n"
  LINE_DATA_LENGHT = 5
  DEFAULT_INPUT_FILE_PATH = './input_data.txt'

  def self.initialize_class_and_student(input_file_path = DEFAULT_INPUT_FILE_PATH)
    standard = instantiate_standard

    File.foreach(input_file_path) do |line|
      student = create_student(line)
      standard.add_student(student)
    end
    standard.assign_grade_marks_and_average
    standard
  end

  def self.create_student(line)
    student_data = line.split(',')

    input_hygiene_check(student_data)

    id = student_data[0].to_i
    subject_marks = student_data[1..(LINE_DATA_LENGHT - 1)].collect { |x| x.split('-').last.to_f }

    Student.new(id, *subject_marks)
  end

  def self.instantiate_standard(name = '', teacher_name = '')
    Standard.new(name, teacher_name)
  end

  def self.input_hygiene_check(student_data)
    if student_data.nil? || student_data.size != LINE_DATA_LENGHT
      printf DATA_ISSUE_MESSAGE
      exit(0)
    end
  end
end

# frozen_string_literal: true

module ReportHelper
  def self.generate_all_reports(standard)
    generate_score_cards(standard)
    generate_grade_wise_data(standard)
    generate_average_student_count_data(standard)
  end

  def self.generate_score_cards(standard)
    students = standard.students
    if students.count.zero?
      puts '0 Student in class'
      exit(1)
    else
      puts "\n\nScore card\n\n"
    end

    puts 'ID  Subject1  Subject2  Subject3  Subject4  Grand-Total  Grade  Average-Compare'

    students.each do |student|
      average_compare = student.above_grade_average ? 'ABOVE' : 'BELOW'
      output_string = student.id < 10 ? '0' : ''
      output_string += "#{student.id} |  #{student.subject1_marks}  |   #{student.subject2_marks}  |   #{student.subject3_marks}   |   #{student.subject4_marks}  |   #{student.total_marks}   |   #{student.grade}   |     #{average_compare}"
      puts output_string
    end

    puts "\n\n--------------------------------------------------------------\n\n"
  end

  def self.generate_grade_wise_data(standard)
    puts 'Grade Report'
    standard.grade_vs_student_count.each do |key, value|
      puts "Number of students in #{key} Grade :: #{value}"
    end
  end

  def self.generate_average_student_count_data(standard)
    above_average_count, below_average_count = standard.calculate_above_and_below_average_student_count
    puts "Number of students above their grade average #{above_average_count}"
    puts "Number of students below their grade average #{below_average_count}"
    puts "\n\n--------------------------------------------------------------\n\n"
  end
end

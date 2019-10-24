# frozen_string_literal: true

class Student
  attr_accessor :id, :grade, :subject1_marks, :subject2_marks, :subject3_marks, :subject4_marks, :total_marks, :above_grade_average

  def initialize(id, subject1_marks, subject2_marks, subject3_marks, subject4_marks)
    @id = id
    @subject1_marks = subject1_marks
    @subject2_marks = subject2_marks
    @subject3_marks = subject3_marks
    @subject4_marks = subject4_marks
    @total_marks = calculate_total_marks
    @grade = calculate_grade
  end

  def calculate_total_marks
    @subject1_marks + @subject2_marks + @subject3_marks + @subject4_marks
  end

  def calculate_grade
    if @total_marks >= 340
      'A'
    elsif @total_marks >= 300
      'B'
    else
      'C'
    end
  end
end

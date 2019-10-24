# frozen_string_literal: true

class Standard
  attr_accessor :name, :teacher_name, :students, :grade_vs_student_count, :grades_average_score

  DEFAULT_STANDARD_NAME = 'Jifflenow'
  DEFAULT_TEACHER_NAME = 'Shubham'
  DEFAULT_SCORE_HASH = { A: 0, B: 0, C: 0 }.freeze

  def initialize(name = DEFAULT_STANDARD_NAME, teacher_name = DEFAULT_TEACHER_NAME)
    @name = name
    @teacher_name = teacher_name
    @students = []
    @grade_vs_student_count = DEFAULT_SCORE_HASH.dup
    @grade_wise_total_marks = DEFAULT_SCORE_HASH.dup
    @grades_average_score   = DEFAULT_SCORE_HASH.dup
  end

  def add_student(student)
    @students << student unless student.nil?
  end

  def assign_grade_marks_and_average
    if students.count.positive?
      @students.each do |student|
        grade_scored = student.grade
        @grade_vs_student_count[grade_scored.to_sym] += 1
        @grade_wise_total_marks[grade_scored.to_sym] += student.total_marks
      end
      @grades_average_score = {
        A: calculate_grade_average(:A),
        B: calculate_grade_average(:B),
        C: calculate_grade_average(:C)
      }

      @students.each do |student|
        student_grade = student.grade
        student.above_grade_average = student.total_marks >= @grades_average_score[student_grade.to_sym]
      end
    end
    self.grade_vs_student_count = grade_vs_student_count
    # self.grade_wise_total_marks = @grade_wise_total_marks
    self.grades_average_score = @grades_average_score

    true
  end

  def calculate_grade_average(grade)
    # grade = grade.to_sym
    student_count = @grade_vs_student_count[grade]
    return 0 if student_count.zero?

    (@grade_wise_total_marks[grade] / @grade_vs_student_count[grade]).round(2)
  end

  def calculate_above_and_below_average_student_count
    above_average_count = 0
    below_average_count = 0
    @students.each do |student|
      # both check to ensure when the value is null
      if student.above_grade_average == true
        above_average_count += 1
      elsif student.above_grade_average == false
        below_average_count += 1
      end
    end
    [above_average_count, below_average_count]
  end
end

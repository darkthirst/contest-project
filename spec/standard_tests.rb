# frozen_string_literal: true

require_relative '../lib/standard'
require_relative '../lib/student'

describe Standard do
  it 'instantiates class with assigning grade marks and average' do
    student1 = Student.new(1, 50, 70, 60, 80)
    student2 = Student.new(2, 90, 80, 60, 80)
    student3 = Student.new(3, 70, 50, 70, 98)
    student4 = Student.new(4, 90, 80, 90, 90)
    standard = Standard.new
    standard.add_student(student1)
    standard.add_student(student2)
    standard.add_student(student3)
    standard.add_student(student4)
    expect(standard.students.length).to eq 4
    expect(student1.above_grade_average).to eq nil
    expect(student2.above_grade_average).to eq nil
    expect(student3.above_grade_average).to eq nil
    expect(student4.above_grade_average).to eq nil
    expect(standard.assign_grade_marks_and_average).to eq true
    expect(student1.above_grade_average).to eq false
    expect(student2.above_grade_average).to eq true
    expect(student3.above_grade_average).to eq true
    expect(student4.above_grade_average).to eq true
    expect(standard.grade_vs_student_count[:A]).to eq 1
    expect(standard.grade_vs_student_count[:B]).to eq 1
    expect(standard.grade_vs_student_count[:C]).to eq 2
    expect(standard.grades_average_score[:A]).to eq 350.0
    expect(standard.grades_average_score[:B]).to eq 310.0
    expect(standard.grades_average_score[:C]).to eq 274.0
    expect(standard.calculate_above_and_below_average_student_count).to eq [3, 1]
  end

  it 'instantiates class without assigning grade marks and average' do
    student1 = Student.new(1, 50, 70, 60, 80)
    student2 = Student.new(2, 90, 80, 60, 80)
    student3 = Student.new(3, 70, 50, 70, 98)
    student4 = Student.new(4, 90, 80, 90, 90)
    standard = Standard.new
    standard.add_student(student1)
    standard.add_student(student2)
    standard.add_student(student3)
    standard.add_student(student4)
    expect(standard.students.length).to eq 4
    expect(student1.above_grade_average).to eq nil
    expect(student2.above_grade_average).to eq nil
    expect(student3.above_grade_average).to eq nil
    expect(student4.above_grade_average).to eq nil
    expect(standard.grade_vs_student_count[:A]).to eq 0
    expect(standard.grade_vs_student_count[:B]).to eq 0
    expect(standard.grade_vs_student_count[:C]).to eq 0
    expect(standard.grades_average_score[:A]).to eq 0
    expect(standard.grades_average_score[:B]).to eq 0
    expect(standard.grades_average_score[:C]).to eq 0
    expect(standard.calculate_above_and_below_average_student_count).to eq [0, 0]
  end

  it 'instantiates class without using student data, assigns grade marks and average' do
    standard = Standard.new
    expect(standard.students.length).to eq 0
    expect(standard.assign_grade_marks_and_average).to eq true
    expect(standard.grade_vs_student_count[:A]).to eq 0
    expect(standard.grade_vs_student_count[:B]).to eq 0
    expect(standard.grade_vs_student_count[:C]).to eq 0
    expect(standard.grades_average_score[:A]).to eq 0
    expect(standard.grades_average_score[:B]).to eq 0
    expect(standard.grades_average_score[:C]).to eq 0
    expect(standard.calculate_above_and_below_average_student_count).to eq [0, 0]
  end
end

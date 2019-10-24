# frozen_string_literal: true

# main application

require_relative 'lib/standard'
require_relative 'lib/student'
require_relative 'helpers/global_helper'
require_relative 'helpers/report_helper'
INPUT_FILE_NOT_ENTERED = "\nUSING DEAFULT INPUT FILE: `./input_data.txt` \n"

# MAIN CODE EXECUTION STARTS HERE
input_file_path = ARGV.first
if input_file_path.nil? || input_file_path.length.zero? || !File.file?(input_file_path.strip) || File.empty?(input_file_path.strip)
  printf INPUT_FILE_NOT_ENTERED
end

standard = GlobalHelper.initialize_class_and_student

if standard.nil?
  printf "\nStandard not found\n\n"
  exit(0)
else
  ReportHelper.generate_all_reports(standard)
end

printf "\nexecution complete\n\n"
exit(1)

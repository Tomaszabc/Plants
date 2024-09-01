require "htmlbeautifier"

namespace :html do
  desc "Beautify all HTML files in the project"
  task :beautify do
    Dir.glob("app/views/**/*.html.erb").each do |file|
      original = File.read(file)
      beautified = HtmlBeautifier.beautify(original)
      File.write(file, beautified)
      puts "Beautified: #{file}"
    end
  end
end

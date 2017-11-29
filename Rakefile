$LOAD_PATH << __dir__ + "/lib"

require "emic_automata"

task :generate do
  book = Book.new
  book.generate
end

task :package do
  100.times do
    book = Book.new
    book.generate
  end

  sh "rm output/*.png"
  sh "cd output; zip -r -X '../bundle-#{Time.new.to_i}.zip' *"
end

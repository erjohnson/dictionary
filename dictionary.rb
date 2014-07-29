require './lib/term'

def space
  puts "\n"
end

def header
  system 'clear'
  puts "
────────────────────────────────────────────────────────────────────────────────────────
─██████████████─██████████████─████████████████───██████──────────██████─██████████████─
─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░██████████████░░██─██░░░░░░░░░░██─
─██████░░██████─██░░██████████─██░░████████░░██───██░░░░░░░░░░░░░░░░░░██─██░░██████████─
─────██░░██─────██░░██─────────██░░██────██░░██───██░░██████░░██████░░██─██░░██─────────
─────██░░██─────██░░██████████─██░░████████░░██───██░░██──██░░██──██░░██─██░░██████████─
─────██░░██─────██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░██──██░░██──██░░██─██░░░░░░░░░░██─
─────██░░██─────██░░██████████─██░░██████░░████───██░░██──██████──██░░██─██████████░░██─
─────██░░██─────██░░██─────────██░░██──██░░██─────██░░██──────────██░░██─────────██░░██─
─────██░░██─────██░░██████████─██░░██──██░░██████─██░░██──────────██░░██─██████████░░██─
─────██░░██─────██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░██──────────██░░██─██░░░░░░░░░░██─
─────██████─────██████████████─██████──██████████─██████──────────██████─██████████████─
────────────────────────────────────────────────────────────────────────────────────────
"
end

def main_menu
  header
  space
  puts "N > Add new term"
  puts "L > Show all terms"
  puts "X > Exit"
  space
  main_choice = gets.chomp.upcase
  if main_choice == "N"
    add_term
  elsif main_choice == "L"
    list_terms
  elsif main_choice == "X"
    puts "Fine! Go use UrbanDictionary... (ง'̀-'́)ง"
    exit
  else
    system 'clear'
    puts "Invalid! Try again"
  end
end

def add_term
  system 'clear'
  header
  puts "Each Term should have a word and definition."
  puts "For example: 'dog' and 'drools a lot'."
  space
  puts "Please enter a word:"
  input_word = gets.chomp.downcase
  space
  puts "Please enter a definition for " + input_word + ":"
  input_def = gets.chomp.downcase

  new_term = Term.new(input_word, input_def).save
  space
  puts "New Term Added To The Dictionary!"
  space
  sleep 0.7
  main_menu
end

def list_terms
  system 'clear'
  header
  Term.all.each_with_index do |term, index|
    puts index.to_s + ") " + term.word
  end
  space
  puts "Enter the number of the term you wish to View:"
  term_num = gets.chomp.to_i
  view_term(term_num)
end

def view_term term_num
  system 'clear'
  header
  puts Term.all.at(term_num).word
  puts Term.all.at(term_num).definition
  space
end

main_menu

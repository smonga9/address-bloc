require_relative '../models/address_book'

 class MenuController
   attr_reader :address_book

   def initialize
     @address_book = AddressBook.new
   end

   def main_menu
     # #2
     puts "Main Menu - #{address_book.entries.count} entries"
     puts "1 - View all entries"
     puts "2 - View entry by number"
     puts "3 - Create an entry"
     puts "4 - Search for an entry"
     puts "5 - Import entries from a CSV"
     puts "6 - Exit"
     print "Enter your selection: "

     # #3
     selection = gets.to_i

     case selection
       when 1
         system "clear"
         view_all_entries
         main_menu
       when 2
         system "clear"
         view_entry_by_number
         main_menu
       when 3
         system "clear"
         create_entry
         main_menu
       when 4
         system "clear"
         search_entries
         main_menu
       when 5
         puts "read_csv"
         # #8
         main_menu
       when 6
         puts "Good-bye!"
         exit(0)
       # #9
       else
         system "clear"
         puts "Sorry, that is not a valid input"
         main_menu
     end
   end

   # #10
   def view_all_entries
     address_book.entries.each do |entry|
       system "clear"
       puts entry.to_s
     # #15
       entry_submenu(entry)
     end

   def view_entry_by_number
     print "Please supply an entry number: "
     selection = gets.chomp.to_i
     if selection <= address.book.entries.length && selection > 0
       puts address.book.entries[selection - 1]
     else
       puts "Invalid entry"
       view_entry_by_number
     end
   end

     system "clear"
     puts "End of entries"
   end

   def create_entry
     system "clear"
     puts "New AddressBloc Entry"
     # #12
     print "Name: "
     name = gets.chomp
     print "Phone number: "
     phone = gets.chomp
     print "Email: "
     email = gets.chomp

     # #13
     address_book.add_entry(name, phone, email)

     system "clear"
     puts "New entry created"
   end

      def search_entries
      end

      def read_csv
    end

    def entry_submenu(entry)
     # #16
     puts "n - next entry"
     puts "d - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"

     # #17
     selection = gets.chomp

     case selection
     # #18
       when "n"
     # #19
       when "d"
       when "e"
     # #20
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         entry_submenu(entry)
     end
   end

   end

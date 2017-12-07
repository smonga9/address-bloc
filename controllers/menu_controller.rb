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
     puts "7 - Nuke all entries"
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
       when 7
         system "clear"
         @address_book.nuke
         puts "All entries deleted!"
         main_menu
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
        print "Search by name: "
        name = gets.chomp

        match = address_book.binary_search(name)
        system "clear"

        if match
          puts match.to_s
          search_submenu(match)
        else
          puts "No match found for #{name}"
        end
      end

      def read_csv
        print "Enter CSV file to import: "
        file_name = gets.chomp

        if file_name.empty?
          system "clear"
          puts "No CSV file read"
          main_menu

          begin
            entry_count = address_book.import_from_csv(file_name).count
            system "clear"
            puts "#{entry_count} new entries added from #{file_name}"
          rescue
            puts "#{file_name} is not a valid CSV file, please enter the name"
            read_csv
          end
        end

        def delete_entry(entry)
          address_book.entries.delete(entry)
          puts "#{entry.name} has been deleted"
        end
      end

      def edit_entry(entry)
        print "Updated name: "
        name = gets.chomp
        print "Updated phone number: "
        phone_number = gets.chomp
        print "Updated email: "
        email = gets.chomp

        entry.name = name if !name.empty?
        entry.phone_number = phone_number if !phone_number.empty?
        entry.email = email if !email.empty?
        system "clear"

        puts "Updated entry:"
        puts entry
      end
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

         delete_entry(entry)
       when "e"
     # #20
        edit_entry(entry)
        entry_submenu(entry)
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         entry_submenu(entry)
     end
   end

   def search_submenu(entry)
     puts "\nd - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"
     # #13
     selection = gets.chomp

     # #14
     case selection
       when "d"
         system "clear"
         delete_entry(entry)
         main_menu
       when "e"
         edit_entry(entry)
         system "clear"
         main_menu
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         puts entry.to_s
         search_submenu(entry)
     end
   end

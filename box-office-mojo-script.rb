require 'csv'
require 'rubygems'
require 'mechanize'
require 'pry'

CSV.open("./dumps/box-office-grosses-#{Time.now.to_i}.csv", 'wb') do |csv|
  years = [2014, 2013, 2009, 2008, 2007]
  page_nums = [1, 2, 3]

  a = Mechanize.new

  years.each do |year|
    page_nums.each do |page_num|
      a.get("http://www.boxofficemojo.com/intl/china/yearly/?yr=#{year}&order=DESC&pagenum=#{page_num}&p=.htm") do |page|
        parsed_html = Nokogiri::HTML(page.body)

        # GETS THE YEAR FROM PAGE TITLE
        year = parsed_html.title.gsub(/\D/, '')

        # GETS THE TABLE CONTAINING BOX OFFICE GROSSES
        box_office_table = parsed_html.css("table[cellpadding='3'][cellspacing='1']").first

        # GETS THE HEADER AND RESPECTIVE COLUMN NUMBERS
        headers = box_office_table.css('tr').first.css('td').map(&:content)
        title_column = headers.index('Movie Title')
        distributor_column = headers.index('Distributor')
        gross_column = headers.index('Gross')
        date_column = headers.index('Release')

        # ITERATES THROUGH EACH ROW AND ADDS IT TO CSV
        box_office_table.css("tr[bgcolor^='#f']").each do |row|
          data = row.css('td')

          begin
            title = data[title_column].content.encode('ASCII', invalid: :replace, undef: :replace)
            distributor = data[distributor_column].content if distributor_column && data[distributor_column].content != 'n/a'
            gross = data[gross_column].content.gsub(/\D/, '')
            date = "#{year}-#{data[date_column].content.gsub(/\//, '-')}"

            csv << [title, distributor, gross, date]
          rescue
            binding.pry
          end
        end
      end
    end
  end
end


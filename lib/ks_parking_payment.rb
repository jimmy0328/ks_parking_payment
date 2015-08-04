
require "ks_parking_payment/version"
require 'rubygems'
require 'rest-client'
require 'nokogiri'

module KsParkingPayment
 
  module_function

   def get car_no,car_tp
     @payment = []
      url = "http://kpp.tbkc.gov.tw/tw/search_index.php"
      if page = RestClient.post(url,{'car_no'=>car_no,"car_tp"=>car_tp})
        npage = Nokogiri::HTML(page)
        rows = npage.css('table tr')[3].css('table tr')
        data = Hash.new
        rows.each do |row|
          td = row.css('td').map{|td| td.text.strip}.join(',')
          @payment << td if td.size > 0 
        end
      end
      @payment
   end

   def str_to_obj(records)
     record_obj = []
      records.each do |record|
        data = record.split(",")
        record_obj << data
      end
      record_obj
   end
   def get_record car_no,car_tp
    @records = get car_no,car_tp
    str_to_obj(@records)
   end

   def print car_no,car_tp
      records = get car_no,car_tp
      res = " | %-7s | %-5s | %-12s | %-5s |%s|\n" % %w[ 停車單號 車牌 停車時間 到期日 金額]
      records.each do |record|
        data = record.split(",")
        data.each_with_index {|str, index| 
          if index == 4 && ((now.to_i) > str.to_i)  
            res << "\033[31m#{str}\033[0m"
          else
            res << "\033[32m#{str}\033[0m"
          end
          res << " | "
        }
        res << "\n"
      end
      puts res
   end

   def now
    Time.now.strftime("%Y%m%d")
   end

end

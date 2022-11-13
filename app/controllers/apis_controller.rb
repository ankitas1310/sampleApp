class ApisController < ApplicationController

	def change_string
       render json: { processed_string: params["input_string"].present? ?  compare_parameter_value : 'Please enter some string' }
	end


	def compare_parameter_value
       arr_value = params["input_string"].split
       arr_value.each_with_index {|av,ai| 
       	  Rails.application.config.companies.each_with_index {|bv,bi| 
       	    if (av.titleize == bv)
              arr_value[ai] = arr_value[ai] + "\u00A9".force_encoding('UTF-8')
            end
          }
        }
        return arr_value.join(" ")
	end
end
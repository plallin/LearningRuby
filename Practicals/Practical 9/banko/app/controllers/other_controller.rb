class OtherController < ApplicationController

  def name
	 @fname = params[:fst_name]
   @lname = params[:lst_name]
   @entry = Entry.create({:first_name => @fname, :last_name =>  @lname})
  end

  def index
   @user_id = params[:user_id].to_i
	 @person = Entry.find(@user_id)
	 @fname = @person.first_name
   @lname = @person.last_name
	 @person.update_attributes({:address => params[:st_name],
	     :salary => params[:salary], :loan => params[:loan],
		 :loan_reason => params[:reason]})
	 if !@person.address.nil? then render "show" end
  end

 # def show
	#  @pers0on = Entry.find(:last)
 # end

  def change
    @user_id = params[:user_id].to_i
	 @person = Entry.find(@user_id)
	 @fname = @person.first_name
    @lname = @person.last_name
	 @person.update_attributes({:salary => params[:salary], :loan => params[:loan]})
  end

 def quote
   @user_id = params[:user_id].to_i
	 @person = Entry.find(@user_id)
	 if !@person.salary.nil? then
	   if (@person.salary *  3) < @person.loan
			then @message = "You goddam pauper, you asked us for a loan that is:
							 more than three times your salary. \n Please go back
							and re-enter your correct salary."
	   else  @message = "Sure thing baby..."
	   end
	else @message = "Seem to have an empty record??"
	end
 end


end

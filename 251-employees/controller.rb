require './davinci-sinatra.rb'

get '/' do
  @employees = Employee.all
  @new_employee = Employee.new
  halt erb(:index)
end

post "/" do
  @new_employee = Employee.new # or Company.new
  @new_employee.first_name = params["first_name"]
  @new_employee.company_id = params ["company_id"]

  if @new_employee.save == true
  redirect "/"
  
  else
   @employees = Employee.order(:id)
  halt erb(:index)
  end
end


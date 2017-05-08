require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload('lib/**/*.rb')
require('./lib/employee')
require('./lib/division')
require('pry')
require('pg')

get('/') do
  erb(:index)
end
get('/create_divisions/new') do
  @divisions = Division.all()
  erb(:divisions)
end

get('/create_divisions') do
  @divisions = Division.all()
  erb(:divisions)
end

post('/create_divisions') do
  @divisions = Division.all()
  division_name = params.fetch('div_name')
  project_name = params.fetch('proj_name')
  new_division = Division.create({:division_name => division_name, :project_name => project_name})
  erb(:divisions)
end

get('/create_divisions/:id/edit') do
  @divisions = Division.all()
  @division = Division.find(params.fetch("id").to_i)
  erb(:divisions_edit)
end

delete("/create_divisions/:id") do
  @division = Division.find(params.fetch("id").to_i)
  @division.delete()
  @divisions = Division.all()
  erb(:index)
end

patch('/create_divisions/:id') do
  @divisions = Division.all()
  division_name = params.fetch('div_name')
  project_name = params.fetch('proj_name')
  @division = Division.find(params.fetch("id").to_i)
  @division = Division.update(:division_name => division_name, :project_name => project_name)
  erb(:index)
end

get('/employees/new') do
  @divisions = Division.all()
  erb(:employee_edit)
end

post('/employees') do
  employee_name = params.fetch('name')
  div_id = params.fetch('dept_id').to_i()
  new_employee = Employee.create({:name => employee_name, :division_id => div_id})
  erb(:index)
end

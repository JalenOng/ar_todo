require_relative 'config/application'
require_relative 'app/todo.rb'


# puts "Put your application code in #{File.expand_path(__FILE__)}"


# require_relative '../models/todo.rb'

def add_task(desc)
  index = Task.count
  my_task = Task.create(completion: 0, new_id: index+1, desc: desc)
  puts "Appended #{desc} to your TODO list."
end

def list

  n = 1
  Task.find_each do |x|
    x.update(new_id: n)
    puts "#{x.new_id}. #{mark_complete(x.completion)} #{x.desc}"
    n += 1
  end
end

def list_completed


  list = Task.where(completion: 1)
  list.order(:new_id)
  n = 1
  puts "Completed Tasks:"
  list.find_each do |x|
    x.update(new_id: n)
    puts "#{x.new_id}. #{mark_complete(x.completion)} #{x.desc}"
    n += 1
  end
end

def list_pending

  list = Task.where(completion: 0)
  list.order(:new_id)
  n = 1
  puts "Pending Tasks:"
  list.find_each do |x|
    x.update(new_id: n)
    puts "#{x.new_id}. #{mark_complete(x.completion)} #{x.desc}"
    n += 1
  end
end


def delete_task(id)
  my_task = Task.find_by(new_id: id)
  puts "Deleted #{my_task.desc} from your TODO list."
  my_task.destroy
end

def completed(id)

  my_task = Task.find_by(new_id: id)
  p my_task
  my_task.update(completion: 1)

end

def mark_complete(value)
  return "[x]" if value == 1
  return "[ ]"
end

def start
  # p list

  # task = gets.chomp.downcase
  command = ARGV
  task = command[0]


  if task == "add"
    # puts "What task do you want to add?"
    command = ARGV
    task_desc = command[(1..-1)].join(" ")
    add_task(task_desc)

  elsif task == "list"
    p list

  elsif task == "delete"
    # puts "Which task to delete?"
    command = ARGV
    task_desc = command[1]
    delete_task(task_desc)

  elsif task == "complete"
    # puts "Which task is completed?"
    command = ARGV
    task_desc = command[1]
    completed(task_desc)

  elsif task == "pending"
    list_pending

  elsif task == "completed"
    list_completed

  elsif task == "quit"

  else
    puts "Invalid command"

  end
end



# def start
#   p list
#   puts "What do you want to do?"
#   task = gets.chomp.downcase
#   # command = ARGV
#   # task = command[0]
#   # task_desc = command[(1..-1)].join(" ")

#   if task == "add"
#     puts "What task do you want to add?"
#     task_desc = gets.chomp
#     add_task(task_desc)
#     start
#   elsif task == "list"
#     p list
#     start
#   elsif task == "delete"
#     puts "Which task to delete?"
#     task_desc = gets.chomp
#     delete_task(task_desc)
#     start
#   elsif task == "complete"
#     puts "Which task is completed?"
#     task_desc = gets.chomp
#     completed(task_desc)
#     start
#   elsif task == "quit"

#   else
#     puts "Invalid command"
#     start
#   end
# end


start





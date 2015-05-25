require_relative 'models/task.rb'

def add_task(desc)
  my_task = Task.create(completion: 0, desc: desc)
end

def list
  Task.all

end


def delete_task(id)
  my_task = Task.find_by(id: id)
  my_task.destroy

end

def completed(id)
  my_task = Task.find_by(id: id)
  my_task.update(completion: 1)
end

require("rspec")
require("pg")
require("task")

describe(Task) do
  #tests are here
end

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(Task) do

  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#description") do
    it("lets you give it a description") do
      test_task = Task.new({:description => "wash the lion"})
      expect(test_task.description()).to(eq("wash the lion"))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
     task1 = Task.new({:description => "learn SQL"})
     task2 = Task.new({:description => "learn SQL"})
     expect(task1).to(eq(task2))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "Learn SQL"})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end  
end
namespace :poring do
  task :import, [:arg1, :arg2] => :environment do |t, args|
    puts "Args were: #{args}"
  end
end

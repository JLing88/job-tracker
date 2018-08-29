Company.destroy_all
Job.destroy_all
COMPANIES = ["ESPN", "Microsoft", "Turing", "Google", "Apple", "State University", "General Mototrs", "SAP"]
JOBS = ["Engineer", "Professor", "Quality Assurance", "Teacher", "Developer", "Product Manager", "Community Manager", "Consultant",]
CITIES = ["Denver", "New York", "Seattle", "Portland", "Indianapolis", "Miami", "San Diego", "Austin", "Las Vegas", "Little Rock", "LA", "Washington DC", "Oakland"]
CATEGORIES = [Category.create(title: 'IT'), Category.create(title: 'Software'), Category.create(title: 'Education')]

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "Job description!", level_of_interest: rand(5), city: CITIES.sample, category: CATEGORIES.sample)
    puts "  Created #{company.jobs[num].title}"
  end
end
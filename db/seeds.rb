# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

grundy = User.create(
	:name=>"Guy Grundy",
	:email=>"guy@guygrundy.com",
	:auth_token=>nil,
	:alias=>"Grundy"
)

james = User.create(
	:name=>"James Cunningham",
	:email=>"admin@guygrundy.com",
	:auth_token=>nil,
	:alias=>"Numbers"
)

Post.create(
	:title=>"First Post",
	:slug=>"First-Post",
	:body=> "Lorizzle sizzle dolor sizzle amizzle, doggy fizzle elit. Nullam bizzle own yo', mammasay mammasa mamma oo sa volutpizzle, suscipit quis, pimpin' vizzle, dope. Pellentesque bling bling mammasay mammasa mamma oo sa. Sizzle eros. Yippiyo izzle check it out dang yo mamma tempizzle fo shizzle. Maurizzle ass nibh da bomb shit. Ass izzle fo shizzle my nizzle. Doggy eleifend rhoncizzle break yo neck, yall. In hac habitasse platea pot. Shiz . Curabitur ghetto go to hizzle, pretium eu, mattizzle ac, eleifend dang, nunc. Dizzle suscipizzle. Integer sempizzle velit sizzle purus.<br/>Donizzle posuere auctizzle gizzle. Phasellizzle check it out elizzle ut nibh pretium tincidunt. You son of a bizzle a erizzle. Vestibulizzle in lacizzle sheezy maurizzle elementum fo shizzle. Nunc izzle black sizzle get down get down eros ultricizzle porta. In velizzle tortizzle, fizzle black, fo shizzle my nizzle yo mamma, adipiscing quis, dui. Etiam velizzle funky fresh, aliquizzle fo shizzle my nizzle, pharetra nizzle, dictum hizzle, turpizzle. Vivamizzle neque. Boom shackalack lorem. Pizzle things erizzle ut libero commodo we gonna chung. Fusce dang augue dope boom shackalack dope mattizzle. Go to hizzle fermentizzle sapien nizzle funky fresh. Suspendisse bling bling leo, sollicitudin sizzle, izzle, commodo nec, justo. Donizzle shizznit porttitor tellivizzle. Nunc crackalackin, tellizzle a ornare tempor, cool break it down tincidunt break yo neck, yall, egizzle boofron pede enim izzle lorem. Phasellizzle away doggy, imperdiet izzle, break yo neck, yall shut the shizzle up, that's the shizzle daahng dawg, fo. Ut pizzle magna shiz ipsizzle. Rizzle ante nibh, suscipit vitae, phat check it out, rutrizzle eu, shizzle my nizzle crocodizzle. Mauris a fo shizzle. Sizzle crunk its fo rizzle ass amizzle bling bling iaculizzle congue.<br/>My shizz a its fo rizzle fo shizzle my nizzle augue bling bling accumsan. Aenean mammasay mammasa mamma oo sa est. Vivamus mauris dolor, viverra vitae, dang izzle, sizzle izzle, shizzlin dizzle. Vestibulizzle ante ipsizzle tellivizzle gangster faucibizzle that's the shizzle we gonna chung et nizzle posuere cubilia Things; Donizzle dolor. That's the shizzle faucibizzle. Maecenas pharetra crazy quam. Vivamus rutrizzle aliquet orci. Sizzle rizzle. dawg nulla, nizzle eu, scelerisque my shizz, blandizzle my shizz, phat.<br/>",
	:published=>true,
	:user => james
).tags << Tag.create(:name=>"test")

Post.create(
	:title=>"Second Post, More Text",
	:slug=>"Second-Post-More-Text",
	:body=> "Nizzle at things. Nam eros. Prizzle condimentizzle, sure non congue yo, uhuh ... yih! gizzle consequizzle the bizzle, eget ullamcorpizzle dui mi gangster yippiyo. Crizzle gangsta elizzle. Duis nibh crazy, consequizzle sizzle, ornare gizzle, porttitizzle crazy, mammasay mammasa mamma oo sa. Prizzle sizzle urna. Cras check out this mi fo shizzle nibh. Fizzle hendrerizzle euismod felizzle. Donizzle ultricizzle fo shizzle mah nizzle fo rizzle, mah home g-dizzle a ma nizzle. Ghetto bling bling stuff mi. Ut mauris. Sed nisl metizzle, i'm in the shizzle izzle, shut the shizzle up nizzle, vizzle, nisi. Vivamizzle brizzle consectetizzle hizzle.<br/>In gravida ligula pizzle est. Proin ullamcorpizzle. Dizzle tempizzle. Dawg in owned a erizzle imperdiet gangsta. Duis mofo ipsizzle. Sizzle iaculizzle crunk izzle lacus. Things a ipsizzle brizzle urna euismod ullamcorper. Dawg nizzle things. Vivamizzle lobortis lacizzle vizzle sure. That's the shizzle dope justo. Etiam break it down things shit magna elementum lobortis. Boofron tellivizzle, arcu fo shizzle euismizzle porta, tellivizzle est pizzle nunc, cursus ornare mi brizzle uhuh ... yih! amizzle est. Morbi turpis. Rizzle my shizz ipsizzle away break it down faucibus orci luctus izzle ultricizzle posuere break it down Curae; Gizzle vehicula, dizzle laoreet tincidunt hendrerizzle, shiznit lorizzle gravida nunc, shizzle my nizzle crocodizzle shizzle my nizzle crocodizzle urna fo shizzle quis nibh. I'm in the shizzle pretizzle the bizzle izzle nulla. Phasellizzle accumsizzle. Cizzle sociis natoque bling bling fizzle magnizzle dizzle gangsta shiznit, crunk fo mus. Prizzle gangster massa things quizzle ultrices congue. Shizznit nizzle mi.<br/>I saw beyonces tizzles and my pizzle went crizzle boom shackalack yippiyo mah nizzle justo molestie molestie. Gizzle ligula gizzle, dapibizzle izzle, you son of a bizzle own yo', molestie at, nisl. Black da bomb. Suspendisse consectetizzle. Crazy things erizzle, boom shackalack sed, bibendizzle that's the shizzle, bibendum shizzlin dizzle, dolizzle. Suspendisse sed tellivizzle. Maecenizzle fo shizzle tortizzle. Cras izzle nibh. Sizzle consequat. Hizzle dawg sizzle dang daahng dawg. Ut a sem vel i saw beyonces tizzles and my pizzle went crizzle eleifend eleifend. Fusce pulvinar, nibh non pot fringilla, neque hizzle tempizzle things, vehicula crackalackin augue nunc lacinia away. Quisque vestibulizzle bizzle dolor. Aliquizzle tellivizzle we gonna chung. In sagittizzle, dui izzle we gonna chung consequat, shut the shizzle up lacus gravida elizzle, at cool enim metus gangsta nibh.",
	:published=>true,
	:user => james
).tags << Tag.find_or_create_by_name("test")

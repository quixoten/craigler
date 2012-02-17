# Craigler

Search API for craigslist

## SYNOPSIS
I couldn't decide which API I liked best, so you have two choices.

    Craigler.search(:motorcycles, :in => [:utah, :nevada, :arizona], :for => 'Boulevard M50') do |item|
      puts item.title
      puts item.url
      puts item.time
    end

or

    Craigler.find('Boulevard M50', :in => :california, :only => :motorcycles) do |item|
        puts item.title
        puts item.url
        puts item.time
   end

You can also create a search object to fetch the results later. When no location or category is given Craigler searches `:all_for_sale_or_wanted` `:in => :anywhere`

    search = Craigler::Search.new('Yamaha')
    search.results()

Note that the results are cached until you instruct craigler to update them.

    search.results(:refresh => true)

See {Craigler.Search} for a list of all available options

### Supported Categories
`:all_for_sale_or_wanted`, `:art_and_crafts`, `:auto_parts`, `:baby_and_kid_stuff`, `:barter`, `:bicycles`, `:boats`, `:books`, `:business`, `:cars_and_trucks`, `:clothing`, `:collectibles`, `:community`, `:computers_and_tech`, `:electronics`, `:event`, `:farm_and_garden`, `:free_stuff`, `:furniture`, `:games_and_toys`, `:garage_sales`, `:general`, `:gigs`, `:household`, `:housing`, `:items_wanted`, `:jewelry`, `:jobs`, `:materials`, `:media`, `:motorcycles`, `:musical_instruments`, `:personals`, `:photo_and_video`, `:recreational_vehicles`, `:resume`, `:services_offered`, `:sporting_goods`, `:tickets`, `:tools`

### Supported Locations

Use `:anywhere` to search all supported locations.

#### States
`:alaska`, `:arizona`, `:arkansas`, `:california`, `:colorado`, `:connecticut`, `:delaware`, `:dc`, `:florida`, `:georgia`, `:hawaii`, `:idaho`, `:illinois`, `:indiana`, `:iowa`, `:kansas`, `:kentucky`, `:louisiana`, `:maine`, `:maryland`, `:mass`, `:michigan`, `:minnesota`, `:mississippi`, `:missouri`, `:montana`, `:nebraska`, `:nevada`, `:n_hampshire`, `:new_jersey`, `:new_mexico`, `:new_york`, `:n_carolina`, `:north_dakota`, `:ohio`, `:oklahoma`, `:oregon`, `:pennsylvania`, `:rhode_island`, `:s_carolina`, `:south_dakota`, `:tennessee`, `:texas`, `:utah`, `:vermont`, `:virginia`, `:washington`, `:west_virginia` `:wisconsin`, `:wyoming`
#### Cities
##### Alabama
`:auburn`, `:bham`, `:columbusga`, `:dothan`, `:shoals`, `:gadsden`, `:huntsville`, `:mobile`, `:montgomery`, `:tuscaloosa`
##### Alaska 
`:anchorage`
##### Arizona 
`:flagstaff`, `:mohave`, `:phoenix`, `:prescott`, `:sierravista`, `:tucson`, `:yuma`
##### Arkansas 
`:fayar`, `:fortsmith`, `:jonesboro`, `:littlerock`, `:memphis`, `:texarkana`
##### California 
`:sfbay`, `:bakersfield`, `:chico`, `:fresno`, `:goldcountry`, `:humboldt`, `:imperial`, `:inlandempire`
`:losangeles`, `:mendocino`, `:merced`, `:modesto`, `:monterey`, `:orangecounty`, `:palmsprings`, `:redding`
`:reno`, `:sacramento`, `:sandiego`, `:slo`, `:santabarbara`, `:stockton`, `:ventura`, `:visalia`, `:yubasutter`
##### Colorado 
`:boulder`, `:cosprings`, `:denver`, `:fortcollins`, `:pueblo`, `:rockies`, `:westslope`
##### Connecticut 
`:newlondon`, `:hartford`, `:newhaven`, `:nwct`
##### Delaware 
`:delaware`
##### Dc 
`:washingtondc`
##### Florida 
`:daytona`, `:keys`, `:fortmyers`, `:gainesville`, `:jacksonville`, `:lakeland`, `:ocala`, `:orlando`
`:panamacity`, `:pensacola`, `:sarasota`, `:miami`, `:spacecoast`, `:staugustine`, `:tallahassee`, `:tampa`, `:treasure`
##### Georgia 
`:athensga`, `:atlanta`, `:augusta`, `:brunswick`, `:columbusga`, `:macon`, `:savannah`, `:valdosta`
##### Hawaii 
`:honolulu`
##### Idaho 
`:boise`, `:eastidaho`, `:pullman`, `:spokane`, `:twinfalls`
##### Illinois 
`:bn`, `:carbondale`, `:chambana`, `:chicago`, `:decatur`, `:peoria`, `:quadcities`, `:rockford`, `:springfieldil`, `:stlouis`
##### Indiana 
`:bloomington`, `:evansville`, `:fortwayne`, `:indianapolis`, `:tippecanoe`, `:muncie`, `:southbend`, `:terrehaute`
##### Iowa 
`:ames`, `:cedarrapids`, `:desmoines`, `:dubuque`, `:iowacity`, `:omaha`, `:quadcities`, `:siouxcity`, `:waterloo`
##### Kansas 
`:kansascity`, `:lawrence`, `:ksu`, `:topeka`, `:wichita`
##### Kentucky 
`:bgky`, `:cincinnati`, `:huntington`, `:lexington`, `:louisville`, `:westky`
##### Louisiana 
`:batonrouge`, `:lafayette`, `:lakecharles`, `:monroe`, `:neworleans`, `:shreveport`
##### Maine 
`:maine`
##### Maryland 
`:annapolis`, `:baltimore`, `:easternshore`, `:smd`, `:westmd`
##### Mass 
`:boston`, `:capecod`, `:southcoast`, `:westernmass`, `:worcester`
##### Michigan 
`:annarbor`, `:centralmich`, `:detroit`, `:flint`, `:grandrapids`, `:jxn`, `:kalamazoo`, `:lansing`
`:muskegon`, `:nmi`, `:porthuron`, `:saginaw`, `:southbend`, `:swmi`, `:up`
##### Minnesota 
`:duluth`, `:fargo`, `:mankato`, `:minneapolis`, `:rmn`, `:stcloud`
##### Mississippi 
`:gulfport`, `:hattiesburg`, `:jackson`, `:memphis`, `:northmiss`
##### Missouri 
`:columbiamo`, `:joplin`, `:kansascity`, `:semo`, `:springfield`, `:stlouis`
##### Montana 
`:montana`
##### Nebraska 
`:grandisland`, `:lincoln`, `:omaha`, `:siouxcity`
##### Nevada 
`:lasvegas`, `:reno`
##### N hampshire 
`:nh`
##### New jersey 
`:cnj`, `:jerseyshore`, `:newjersey`, `:southjersey`
##### New mexico 
`:albuquerque`, `:farmington`, `:lascruces`, `:roswell`, `:santafe`
##### New york 
`:albany`, `:binghamton`, `:buffalo`, `:catskills`, `:chautauqua`, `:elmira`, `:hudsonvalley`, `:ithaca`
`:longisland`, `:newyork`, `:plattsburgh`, `:rochester`, `:syracuse`, `:utica`, `:watertown`
##### N carolina 
`:asheville`, `:boone`, `:charlotte`, `:eastnc`, `:fayetteville`, `:greensboro`, `:hickory`, `:outerbanks`
`:raleigh`, `:wilmington`, `:winstonsalem`
##### North dakota 
`:fargo`, `:nd`
##### Ohio 
`:akroncanton`, `:athensohio`, `:cincinnati`, `:cleveland`, `:columbus`, `:dayton`, `:huntington`, `:limaohio`
`:mansfield`, `:parkersburg`, `:sandusky`, `:toledo`, `:wheeling`, `:youngstown`
##### Oklahoma 
`:fortsmith`, `:lawton`, `:oklahomacity`, `:stillwater`, `:tulsa`
##### Oregon 
`:bend`, `:corvallis`, `:eastoregon`, `:eugene`, `:medford`, `:oregoncoast`, `:portland`, `:roseburg`, `:salem`
##### Pennsylvania 
`:altoona`, `:erie`, `:harrisburg`, `:lancaster`, `:allentown`, `:philadelphia`, `:pittsburgh`, `:poconos`
`:reading`, `:scranton`, `:pennstate`, `:williamsport`, `:york`
##### Rhode island 
`:providence`
##### S carolina 
`:charleston`, `:columbia`, `:florencesc`, `:greenville`, `:hiltonhead`, `:myrtlebeach`
##### South dakota 
`:sd`
##### Tennessee 
`:chattanooga`, `:clarksville`, `:jacksontn`, `:knoxville`, `:memphis`, `:nashville`, `:tricities`
##### Texas 
`:abilene`, `:amarillo`, `:austin`, `:beaumont`, `:brownsville`, `:collegestation`, `:corpuschristi`, `:dallas`
`:elpaso`, `:galveston`, `:houston`, `:killeen`, `:laredo`, `:lubbock`, `:mcallen`, `:odessa`, `:sanantonio`
`:sanmarcos`, `:texarkana`, `:easttexas`, `:victoriatx`, `:waco`, `:wichitafalls`
##### Utah 
`:logan`, `:ogden`, `:provo`, `:saltlakecity`, `:stgeorge`
##### Vermont 
`:burlington`
##### Virginia 
`:blacksburg`, `:charlottesville`, `:danville`, `:easternshore`, `:fredericksburg`, `:norfolk`, `:harrisonburg`
`:lynchburg`, `:richmond`, `:roanoke`
##### Washington 
`:bellingham`, `:kpr`, `:olympic`, `:pullman`, `:seattle`, `:skagit`, `:spokane`, `:wenatchee`, `:yakima`
##### West virginia 
`:charlestonwv`, `:huntington`, `:martinsburg`, `:morgantown`, `:parkersburg`, `:wv`, `:wheeling`
##### Wisconsin 
`:appleton`, `:duluth`, `:eauclaire`, `:greenbay`, `:janesville`, `:racine`, `:lacrosse`, `:madison`
`:milwaukee`, `:sheboygan`, `:wausau` 


## REQUIREMENTS

* Hpricot

## INSTALL

* sudo gem install craigler

## Copyright

Copyright (c) 2009 Devin Christensen. See {file:LICENSE} for details.

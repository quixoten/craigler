module Craigler
  module US
    STATES = { :alabama => [:auburn, :bham, :dothan, :gadsden, :huntsville, :mobile, :montgomery, :shoals, :tuscaloosa]
             , :alaska => [:anchorage, :fairbanks, :juneau, :kenai]
             , :arizona => [:flagstaff, :mohave, :phoenix, :prescott, :showlow, :sierravista, :tucson, :yuma]
             , :arkansas => [:fayar, :fortsmith, :jonesboro, :littlerock, :texarkana]
             , :california => [:bakersfield, :chico, :fresno, :goldcountry, :hanford, :humboldt, :imperial, :inlandempire, :losangeles, :mendocino, :merced, :modesto, :monterey, :orangecounty, :palmsprings, :redding, :sacramento, :sandiego, :santabarbara, :santamaria, :sfbay, :siskiyou, :slo, :stockton, :susanville, :ventura, :visalia, :yubasutter]
             , :colorado => [:boulder, :cosprings, :denver, :eastco, :fortcollins, :pueblo, :rockies, :westslope]
             , :connecticut => [:hartford, :newhaven, :newlondon, :nwct]
             , :delaware => [:delaware]
             , :district_of_columbia => [:washingtondc]
             , :florida => [:cfl, :daytona, :fortlauderdale, :fortmyers, :gainesville, :jacksonville, :keys, :lakecity, :lakeland, :miami, :ocala, :okaloosa, :orlando, :panamacity, :pensacola, :sarasota, :spacecoast, :staugustine, :tallahassee, :tampa, :treasure, :westpalmbeach]
             , :georgia => [:albanyga, :athensga, :atlanta, :augusta, :brunswick, :columbusga, :macon, :nwga, :savannah, :statesboro, :valdosta]
             , :hawaii => [:honolulu]
             , :idaho => [:boise, :eastidaho, :lewiston, :twinfalls]
             , :illinois => [:bn, :carbondale, :chambana, :chicago, :decatur, :lasalle, :mattoon, :peoria, :quincy, :rockford, :springfieldil]
             , :indiana => [:bloomington, :evansville, :fortwayne, :indianapolis, :kokomo, :muncie, :richmondin, :southbend, :terrehaute, :tippecanoe]
             , :iowa => [:ames, :cedarrapids, :desmoines, :dubuque, :fortdodge, :iowacity, :masoncity, :ottumwa, :quadcities, :siouxcity, :waterloo]
             , :kansas => [:ksu, :lawrence, :nwks, :salina, :seks, :swks, :topeka, :wichita]
             , :kentucky => [:bgky, :eastky, :lexington, :louisville, :owensboro, :westky]
             , :louisiana => [:batonrouge, :cenla, :houma, :lafayette, :lakecharles, :monroe, :neworleans, :shreveport]
             , :maine => [:maine]
             , :maryland => [:annapolis, :baltimore, :easternshore, :frederick, :smd, :westmd]
             , :massachusetts => [:boston, :capecod, :southcoast, :westernmass, :worcester]
             , :michigan => [:annarbor, :battlecreek, :centralmich, :detroit, :flint, :grandrapids, :holland, :jxn, :kalamazoo, :lansing, :monroemi, :muskegon, :nmi, :porthuron, :saginaw, :swmi, :thumb, :up]
             , :minnesota => [:bemidji, :brainerd, :duluth, :mankato, :marshall, :minneapolis, :rmn, :stcloud]
             , :mississippi => [:gulfport, :hattiesburg, :jackson, :meridian, :natchez, :northmiss]
             , :missouri => [:columbiamo, :joplin, :kansascity, :kirksville, :loz, :semo, :springfield, :stjoseph, :stlouis]
             , :montana => [:billings, :bozeman, :butte, :greatfalls, :helena, :kalispell, :missoula, :montana]
             , :nebraska => [:grandisland, :lincoln, :northplatte, :omaha, :scottsbluff]
             , :nevada => [:elko, :lasvegas, :reno]
             , :new_hampshire => [:nh]
             , :new_jersey => [:cnj, :jerseyshore, :newjersey, :southjersey]
             , :new_mexico => [:albuquerque, :clovis, :farmington, :lascruces, :roswell, :santafe]
             , :new_york => [:albany, :binghamton, :buffalo, :catskills, :chautauqua, :elmira, :fingerlakes, :glensfalls, :hudsonvalley, :ithaca, :longisland, :newyork, :oneonta, :plattsburgh, :potsdam, :rochester, :syracuse, :twintiers, :utica, :watertown]
             , :north_carolina => [:asheville, :boone, :charlotte, :eastnc, :fayetteville, :greensboro, :hickory, :onslow, :outerbanks, :raleigh, :wilmington, :winstonsalem]
             , :north_dakota => [:bismarck, :fargo, :grandforks, :nd]
             , :ohio => [:akroncanton, :ashtabula, :athensohio, :chillicothe, :cincinnati, :cleveland, :columbus, :dayton, :limaohio, :mansfield, :sandusky, :toledo, :tuscarawas, :youngstown, :zanesville]
             , :oklahoma => [:enid, :lawton, :oklahomacity, :stillwater, :tulsa]
             , :oregon => [:bend, :corvallis, :eastoregon, :eugene, :klamath, :medford, :oregoncoast, :portland, :roseburg, :salem]
             , :pennsylvania => [:allentown, :altoona, :chambersburg, :erie, :harrisburg, :lancaster, :meadville, :pennstate, :philadelphia, :pittsburgh, :poconos, :reading, :scranton, :williamsport, :york]
             , :rhode_island => [:providence]
             , :south_carolina => [:charleston, :columbia, :florencesc, :greenville, :hiltonhead, :myrtlebeach]
             , :south_dakota => [:csd, :nesd, :rapidcity, :sd, :siouxfalls]
             , :tennessee => [:chattanooga, :clarksville, :cookeville, :jacksontn, :knoxville, :memphis, :nashville, :tricities]
             , :territories => [:micronesia, :puertorico, :virgin]
             , :texas => [:abilene, :amarillo, :austin, :beaumont, :bigbend, :brownsville, :collegestation, :corpuschristi, :dallas, :delrio, :easttexas, :elpaso, :galveston, :houston, :killeen, :laredo, :lubbock, :mcallen, :nacogdoches, :odessa, :sanangelo, :sanantonio, :sanmarcos, :texoma, :victoriatx, :waco, :wichitafalls]
             , :utah => [:logan, :ogden, :provo, :saltlakecity, :stgeorge]
             , :vermont => [:burlington]
             , :virginia => [:blacksburg, :charlottesville, :danville, :fredericksburg, :harrisonburg, :lynchburg, :norfolk, :richmond, :roanoke, :swva, :winchester]
             , :washington => [:bellingham, :kpr, :moseslake, :olympic, :pullman, :seattle, :skagit, :spokane, :wenatchee, :yakima]
             , :west_virginia => [:charlestonwv, :huntington, :martinsburg, :morgantown, :parkersburg, :swv, :wheeling, :wv]
             , :wisconsin => [:appleton, :eauclaire, :greenbay, :janesville, :lacrosse, :madison, :milwaukee, :northernwi, :racine, :sheboygan, :wausau]
             , :wyoming => [:wyoming]
             }

    class << self
      # Alternate interface to {Search#initialize}
      #
      # @param category [Symbol] the category to search
      # @param options [Hash] options passed to {Search#initialize}.
      def search(category, options = {})
        options = options.merge({ :only => category })
        results = Search.new(options.delete(:for), options).results()
        results.each {|result| yield(result) } if block_given?
        results
      end

      # Wrapper for {Search#initialize}
      #
      # @param (see Search#initialize)
      def find(search_term, options = {})
        results = Search.new(search_term, options).results()
        results.each {|result| yield(result) } if block_given?
        results
      end
    end
  end
end

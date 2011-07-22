# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Feed.create(  :feed_url   =>  'http://www.kerkida.net/rss/general/latest_news.php', 
              :site_name  =>  'Kerkida', 
              :site_url   =>  'http://www.kerkida.net/',
              :site_logo  =>  'http://www.kerkida.net/layout/top_logo.gif')
      
Feed.create(  :feed_url   =>  'http://www.politis-sports.com/rss/footballrss.xml', 
              :site_name  =>  'Politis Sports', 
              :site_url   =>  'http://www.politis-sports.com/',
              :site_logo  =>  'http://www.politis-sports.com/images2011/header01_logo.jpg')

Feed.create(  :feed_url   =>  'http://www.protathlima.com/rss/sports.jsp', 
              :site_name  =>  'Protathlima.com', 
              :site_url   =>  'http://www.protathlima.com/',
              :site_logo  =>  'http://www.protathlima.com/content/header_logo.jpg')

Feed.create(  :feed_url   =>  'http://www.sigmalive.com/rss/latest/10', 
              :site_name  =>  'SigmaLive Sports', 
              :site_url   =>  'http://www.sigmalive.com/sports/',
              :site_logo  =>  'http://www.sigmalive.com/sites/all/themes/sports/assets/logo_sports.png')

Feed.create(  :feed_url   =>  'http://www.supermpala.com/feed', 
              :site_name  =>  'SuperMpala', 
              :site_url   =>  'http://www.supermpala.com/',
              :site_logo  =>  'http://www.supermpala.com/ma/logo-24.png')

Feed.create(  :feed_url   =>  'http://www.ael-limassol.net/ael/feed/', 
              :site_name  =>  'Ael-Limassol.net', 
              :site_url   =>  'http://www.ael-limassol.net/',
              :site_logo  =>  'http://www.ael-limassol.net/ael/wp-content/themes/aelv3/style7/color-bg-element.png')      

Feed.create(  :feed_url   =>  'http://www.apoelfc.com.cy/nqcontent.cfm?a_id=1296&tt=graphic&feed=rss', 
              :site_name  =>  'ApoelFC.com.cy', 
              :site_url   =>  'http://www.apoelfc.com.cy/',
              :site_logo  =>  'http://www.apoelfc.com.cy/media/logo/logo2.png')

Feed.create(  :feed_url   =>  'http://www.shootandgoal.com/rss.php', 
              :site_name  =>  'ShootAndGoal.com', 
              :site_url   =>  'http://www.shootandgoal.com/',
              :site_logo  =>  'http://www.shootandgoal.com/logo.gif')
              
              
Team.create( :name         =>  'Apoel',
              :logo_image   =>  'apoel.gif')
              
Team.create( :name         =>  'Apollon Limassol',
              :logo_image   =>  'apollon_limassol.jpg')
    
Team.create( :name         =>  'Omonoia',
              :logo_image   =>  'omonoia.gif')
           
Team.create( :name         =>  'Anorthosi',
              :logo_image   =>  'anorthosis.jpg')

Team.create( :name         =>  'AEL Limassol',
              :logo_image   =>  'ael_limassol.gif')

Team.create( :name         =>  'Nea Salamina',
              :logo_image   =>  'nea_salamina.gif')

Team.create( :name         =>  'Olympiakos Nicosia',
              :logo_image   =>  'olympiakos_nicosia.gif')

Team.create( :name         =>  'Aris Limassol',
              :logo_image   =>  'aris_limassol.gif')

Team.create( :name         =>  'AEK Larnaca',
              :logo_image   =>  'aek_larnaca.gif')
              
Team.create( :name         =>  'APEP Pitsilias',
              :logo_image   =>  'apep_pitsilias.gif')

Team.create( :name         =>  'APOP Kinyras',
              :logo_image   =>  'apop_kinyras.gif')

Team.create( :name         =>  'AEP Paphos',
              :logo_image   =>  'aep_paphos.gif')

Team.create( :name         =>  'Ethnikos Achnas',
              :logo_image   =>  'ethnikos_achnas.gif')

Team.create( :name         =>  'Doxa Katokopias',
              :logo_image   =>  'doxa_katokopias.gif')

Team.create( :name         =>  'ENP',
              :logo_image   =>  'enp.gif')
              
Team.create( :name         =>  'Ermis Aradippou',
              :logo_image   =>  'ermis_aradippou.gif')

Team.create( :name         =>  'AOAN',
              :logo_image   =>  'aoan.gif')

Team.create( :name         =>  'ASIL',
              :logo_image   =>  'asil.gif')
              
Team.create( :name         =>  'Akritas Chlorakas',
              :logo_image   =>  'akritas_chlorakas.gif')

Team.create( :name         =>  'Alki',
              :logo_image   =>  'alki.gif')

Team.create( :name         =>  'Atromitos Geroskipou',
              :logo_image   =>  'atromitos_geroskipou.gif')
              
Team.create( :name         =>  'Digenis Morfou',
              :logo_image   =>  'digenis_morfou.gif')

Team.create( :name         =>  'MEAP',
              :logo_image   =>  'meap.gif')

Team.create( :name         =>  'PAEEK',
              :logo_image   =>  'paeek.gif')
              
Team.create( :name         =>  'Othellos Athienou',
              :logo_image   =>  'othellos_athienou.gif')

Team.create( :name         =>  'Omonoia Aradippou',
              :logo_image   =>  'omonoia_aradippou.gif')

Team.create( :name         =>  'Onisilos Sotiras',
              :logo_image   =>  'onisilos_sotiras.gif')
              
Team.create( :name         =>  'Frenaros',
              :logo_image   =>  'frenaros.gif')
              
## mexri edw oles oi omades A' kai B' katigorias

Organization.create(  :name           =>  'A\' Football League',
                      :description    =>  '',
                      :level          =>  'national')
      
Organization.create(  :name           =>  'B\' Football League',
                      :description    =>  '',
                      :level          =>  'national')
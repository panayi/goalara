# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#


Feed.create(  :feed_url   =>  'http://www.kerkida.net/rss/general/latest_news.php', 
              :site_name  =>  'Kerkida', 
              :site_url   =>  'http://www.kerkida.net/',
              :site_logo  =>  'kerkida.gif',
              :content_unique_div   => 'td[width=\'526\']>table.ArticlePage',
              :category_unique_div  => 'td.Breadcrumb',
              :image_unique_div     => 'div#big_img_panel')
      
Feed.create(  :feed_url   =>  'http://www.politis-sports.com/rss/footballrss.xml', 
              :site_name  =>  'Politis Sports', 
              :site_url   =>  'http://www.politis-sports.com/',
              :site_logo  =>  'politis.jpg',
              :content_unique_div   => "table[cellpadding='12']+table tr[bgcolor='']>td[valign='top']",
              :category_unique_div  => 'p.categories',
              :image_unique_div     => '')

Feed.create(  :feed_url   =>  'http://www.protathlima.com/rss/sports.jsp', 
              :site_name  =>  'Protathlima.com', 
              :site_url   =>  'http://www.protathlima.com/',
              :site_logo  =>  'protathlima.gif',
              :content_unique_div   => 'table.str_inc_Table',
              :category_unique_div  => 'table.navigation_table>tr>td',
              :image_unique_div     => '')

Feed.create(  :feed_url   =>  'http://www.sigmalive.com/rss/latest/10', 
              :site_name  =>  'SigmaLive Sports', 
              :site_url   =>  'http://www.sigmalive.com/sports/',
              :site_logo  =>  'sigmalive.gif',
              :content_unique_div   => 'div.contentContainer',
              :category_unique_div  => 'div.navi',
              :image_unique_div     => '')

Feed.create(  :feed_url   =>  'http://www.supermpala.com/feed', 
              :site_name  =>  'SuperMpala', 
              :site_url   =>  'http://www.supermpala.com/',
              :site_logo  =>  'supermpala.gif',
              :content_unique_div   => 'div.section-content-left',
              :category_unique_div  => 'div.map',
              :image_unique_div     => '')

# Feed.create(  :feed_url   =>  'http://www.ael-limassol.net/ael/feed/', 
#               :site_name  =>  'Ael-Limassol.net', 
#               :site_url   =>  'http://www.ael-limassol.net/',
#               :site_logo  =>  'http://www.ael-limassol.net/ael/wp-content/themes/aelv3/style7/color-bg-element.png',
#               :content_unique_div   => 'div.main-article',
#               :category_unique_div  => 'div#breadcrumbs',
#               :image_unique_div     => '')      

Feed.create(  :feed_url   =>  'http://www.apoelfc.com.cy/nqcontent.cfm?a_id=1296&tt=graphic&feed=rss', 
              :site_name  =>  'ApoelFC.com.cy', 
              :site_url   =>  'http://www.apoelfc.com.cy/',
              :site_logo  =>  'apoelfc.gif',
              :content_unique_div   => 'div#il_text',
              :category_unique_div  => 'div.breadcrumbInner>div.breadcrumb>ul',
              :image_unique_div     => '')

Feed.create(  :feed_url   =>  'http://www.shootandgoal.com/rss.php', 
              :site_name  =>  'ShootAndGoal.com', 
              :site_url   =>  'http://www.shootandgoal.com/',
              :site_logo  =>  'shootandgoal.jpg',
              :content_unique_div   => 'div#content',
              :category_unique_div  => 'div#nnnooonnneeee',
              :image_unique_div     => '')
              
Feed.create(  :feed_url   =>  'http://www.apoel1926.com/rss/apoel1926_news.xml', 
              :site_name  =>  'Apoel1926.com', 
              :site_url   =>  'http://www.apoelfc1926.com/',
              :site_logo  =>  'apoel1926.gif',
              :content_unique_div   => 'div#generalContainer>div.columnBoxYellowContent',
              :category_unique_div  => 'ul.parentLinksList',
              :image_unique_div     => '')              

Feed.create(  :feed_url   =>  'http://www.neasalamis.com.cy/football/football-news?format=feed&type=rss', 
              :site_name  =>  'NeaSalamis Official Site', 
              :site_url   =>  'http://www.neasalamis.com.cy/',
              :site_logo  =>  'neasalamis.jpg',
              :content_unique_div   => 'div.full-article',
              :category_unique_div  => 'div#nnnooonnneeee',
              :image_unique_div     => '')     

Feed.create(  :feed_url   =>  'http://www.typos.com.cy/rss/sports.cfm', 
              :site_name  =>  'Typos.com.cy', 
              :site_url   =>  'http://www.typos.com.cy/',
              :site_logo  =>  'typoscomcy.gif',
              :content_unique_div   => 'div#col1_content',
              :category_unique_div  => 'div#nnnooonnneeee',
              :image_unique_div     => '')         

              

Team.create( :name         =>  'Apoel',
              :logo_image   =>  'apoel.png')

Team.create( :name         =>  'Apollon Limassol',
              :logo_image   =>  'apollon_limassol.png')

Team.create( :name         =>  'Omonoia',
              :logo_image   =>  'omonoia.png')

Team.create( :name         =>  'Anorthosi',
              :logo_image   =>  'anorthosis.png')

Team.create( :name         =>  'AEL Limassol',
              :logo_image   =>  'ael_limassol.png')

Team.create( :name         =>  'Nea Salamina',
              :logo_image   =>  'nea_salamina.gif')

Team.create( :name         =>  'Olympiakos Nicosia',
              :logo_image   =>  'olympiakos_nicosia.png')

Team.create( :name         =>  'Aris Limassol',
              :logo_image   =>  'aris_limassol.png')

Team.create( :name         =>  'AEK Larnaca',
              :logo_image   =>  'aek_larnaca.png')

# Team.create( :name         =>  'APEP Pitsilias',
#               :logo_image   =>  'apep_pitsilias.png')

# Team.create( :name         =>  'APOP Kinyras',
#               :logo_image   =>  'apop_kinyras.png')

# Team.create( :name         =>  'AEP Paphos',
#               :logo_image   =>  'aep_paphos.png')

Team.create( :name         =>  'Ethnikos Achnas',
              :logo_image   =>  'ethnikos_achnas.png')

# Team.create( :name         =>  'Doxa Katokopias',
#               :logo_image   =>  'doxa_katokopias.png')

Team.create( :name         =>  'ENP',
              :logo_image   =>  'enp.png')

Team.create( :name         =>  'Ermis Aradippou',
              :logo_image   =>  'ermis_aradippou.png')

# Team.create( :name         =>  'AOAN',
#               :logo_image   =>  'aoan.png')

# Team.create( :name         =>  'ASIL',
#               :logo_image   =>  'asil_lysis.png')

# Team.create( :name         =>  'Akritas Chlorakas',
#               :logo_image   =>  'akritas_chlorakas.png')

Team.create( :name         =>  'Alki',
              :logo_image   =>  'alki_larnakas.png')
              
Team.create( :name         =>  'Anagennisi Deryneias',
             :logo_image   =>  'anagennisi_deryneias.png')

# Team.create( :name         =>  'Atromitos Geroskipou',
#               :logo_image   =>  'atromitos_yeroskipou.png')
# 
# Team.create( :name         =>  'Digenis Morfou',
#               :logo_image   =>  'digenis_morfou.png')
# 
# Team.create( :name         =>  'MEAP',
#               :logo_image   =>  'meap_nisou.jpeg')
# 
# Team.create( :name         =>  'PAEEK',
#               :logo_image   =>  'paeek_keryneias.png')
# 
# Team.create( :name         =>  'Othellos Athienou',
#               :logo_image   =>  'othellos_athienou.png')
# 
# Team.create( :name         =>  'Omonoia Aradippou',
#               :logo_image   =>  'omonia_aradippou.png')
# 
# Team.create( :name         =>  'Onisilos Sotiras',
#               :logo_image   =>  'onisilos_sotiras.png')
# 
# Team.create( :name         =>  'Frenaros',
#               :logo_image   =>  'frenaros.png')
              
## mexri edw oles oi omades A' kai B' katigorias

Organization.create(  :name           =>  'A\' Football League',
                      :description    =>  '',
                      :level          =>  'national')
      
# Organization.create(  :name           =>  'B\' Football League',
#                       :description    =>  '',
#                       :level          =>  'national')
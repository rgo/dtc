xml.instruct! 

xml.urlset(:xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9") do
    
  
    xml.url do
      xml.loc         url_for(root_url)
      xml.lastmod     w3c_date(Time.now.utc)
      xml.changefreq  'monthly'
      xml.priority    1
    end
  
    
    xml.url do
      xml.loc         url_for(sitemaps_url)
      xml.lastmod     w3c_date(Time.now.utc)
      xml.changefreq  'monthly'
      xml.priority    1
    end
  
    @cars.each do |car|
      xml.url do
        xml.loc         url_for(car_url(car))
        xml.lastmod     w3c_date(car.updated_at)
        xml.changefreq  'monthly'
        xml.priority    0.9
      end
    end
    
    @air_cons.each do |air_con|
      xml.url do
        xml.loc         url_for(air_con_url(air_con))
        xml.lastmod     w3c_date(air_con.updated_at)
        xml.changefreq  'monthly'
        xml.priority    0.9
      end
    end
    
    @dishwashers.each do |dishwasher|
      xml.url do
        xml.loc         url_for(dishwasher_url(dishwasher))
        xml.lastmod     w3c_date(dishwasher.updated_at)
        xml.changefreq  'monthly'
        xml.priority    0.9
      end
    end
    
    @dryers.each do |dryer|
      xml.url do
        xml.loc         url_for(dryer_url(dryer))
        xml.lastmod     w3c_date(dryer.updated_at)
        xml.changefreq  'monthly'
        xml.priority    0.9
      end
    end
    
    @freezers.each do |freezer|
      xml.url do
        xml.loc         url_for(freezer_url(freezer))
        xml.lastmod     w3c_date(freezer.updated_at)
        xml.changefreq  'monthly'
        xml.priority    0.9
      end
    end
    
    @fridges.each do |fridge|
      xml.url do
        xml.loc         url_for(fridge_url(fridge))
        xml.lastmod     w3c_date(fridge.updated_at)
        xml.changefreq  'monthly'
        xml.priority    0.9
      end
    end
    
    @fridges_freezers.each do |fridge_freezer|
      xml.url do
        xml.loc         url_for(fridge_freezer_url(fridge_freezer))
        xml.lastmod     w3c_date(fridge_freezer.updated_at)
        xml.changefreq  'monthly'
        xml.priority    0.9
      end
    end
    
    @ovens.each do |oven|
      xml.url do
        xml.loc         url_for(oven_url(oven))
        xml.lastmod     w3c_date(oven.updated_at)
        xml.changefreq  'monthly'
        xml.priority    0.9
      end
    end
    
    @washer_dryers.each do |washer_dryer|
      xml.url do
        xml.loc         url_for(washer_dryer_url(washer_dryer))
        xml.lastmod     w3c_date(washer_dryer.updated_at)
        xml.changefreq  'monthly'
        xml.priority    0.9
      end
    end
    
    @washing_machines.each do |washing_machine|
      xml.url do
        xml.loc         url_for(washing_machine_url(washing_machine))
        xml.lastmod     w3c_date(washing_machine.updated_at)
        xml.changefreq  'monthly'
        xml.priority    0.9
      end
    end
    
    @worktop_inductions.each do |worktop_induction|
      xml.url do
        xml.loc         url_for(worktop_induction_url(worktop_induction))
        xml.lastmod     w3c_date(worktop_induction.updated_at)
        xml.changefreq  'monthly'
        xml.priority    0.9
      end
    end
    
end
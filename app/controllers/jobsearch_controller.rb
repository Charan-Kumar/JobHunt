class JobsearchController < ApplicationController
  
  def jobs
    #Skills
    skills = Skill.where(full_profile_id:current_user.full_profile.id)
    skill_array=[]
    skills.each do |s|
      skill_array.append(s.name)
    end

    #Positions
    pos_array=[]
    positions = Position.where(full_profile_id:current_user.full_profile.id)
    positions.each do |p|
      pos_array.append(p.title)
    end

    if pos_array.empty?
      pos = ""
    else
      pos=pos_array.join(',')
    end
    
    #Industry
    @basic_profile = BasicProfile.find_by_user_id(current_user.id)

    industry = @basic_profile.industry
    headline = @basic_profile.headline

    title = []
    if headline.downcase.include?("quality")
      title.append("quality")
    end
    if headline.downcase.include?("test")
      title.append("testing")
    end
    if headline.downcase.include?("developer")
      title.append("developer")
    end


    if industry.nil?
      industry = ""
    end

    query_string = ""+industry+"," + pos +"," + title.join(',')+","+skill_array.join(',')
    if params[:data].nil?
      @jobs = IndeedAPI.search_jobs(:q => query_string, :limit => '1000', :co=>'in', :jt => 'fulltime', :start => params[:data]).results
    else
      if IndeedAPI.search_jobs(:q => query_string, :limit => '1000', :co=>'in', :jt => 'fulltime', :start => params[:data]).total_results > params[:data].to_i
        @jobs = IndeedAPI.search_jobs(:q => query_string, :limit => '1000', :co=>'in', :jt => 'fulltime', :start => params[:data]).results
      end
    end

    @fav = FavJob.where(user_id: current_user.id)

    respond_to do |format|
        format.js
        format.html
    end
  
  end



  def fav
    @jobs=[]
    jobs=FavJob.where(user_id: current_user.id)
    jobs.each do |j|
      s = IndeedAPI.get_job(j.job_key)
      if ! s.nil?
        @jobs.append([s,j.id])
      end
    end
  end
  respond_to do |format|
    format.js
  end
end

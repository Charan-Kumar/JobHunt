class LinkedinController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  @@config = { 
    :site => 'https://api.linkedin.com',
    :authorize_path => '/uas/oauth/authenticate',
    :request_token_path => '/uas/oauth/requestToken?scope=r_basicprofile+r_fullprofile',   
    :access_token_path => '/uas/oauth/accessToken' 
  }
  
  API_KEY = "78cns3o6ziddo2"
  SECRET_KEY = "TDXrW0mN792fNTmA"
  
  def generate_linkedin_oauth_url
    if LinkedinOauthSetting.find_by_user_id(current_user.id).nil?
      $token = params[:token]
      $secret = params[:secret]
      client = LinkedIn::Client.new(API_KEY,SECRET_KEY, @@config)
      client.authorize_from_access(@token,@secret)
      redirect_to :linkedin_linkedin_profile
    else
      redirect_to :oauth_account
    end
  end

  def oauth_account
    client = LinkedIn::Client.new(API_KEY,SECRET_KEY, @@config)
    pin = params[:oauth_verifier]
    if pin
      atoken, asecret = client.authorize_from_request($token, $secret, pin)
      LinkedinOauthSetting.create!(:asecret => asecret, :atoken => atoken, :user_id => current_user.id)
    end
    redirect_to :root
  end


  def index
    if current_user
      redirect_to :linkedin_linkedin_profile
    end
  end

  def linkedin_profile
    AngelJob.perform_async()
    if current_user.sign_in_count==1
      get_basic_profile
      get_full_profile
      get_positions
      get_educations
      get_skills
      get_phone_nos
      get_ims
      get_address
    end
    @basic_profile = BasicProfile.find_by_user_id(current_user.id)
    @full_profile = FullProfile.find_by_user_id(current_user.id)
    @positions = Position.where(full_profile_id:current_user.full_profile.id)
    @educations = Education.where(full_profile_id:current_user.full_profile.id)
    @skills = Skill.where(full_profile_id:current_user.full_profile.id)
    @phone=PhoneNo.find_by_user_id(current_user.id)
    @address=Address.find_by_user_id(current_user.id)
    @ims=Im.find_by_user_id(current_user.id)
    @user=User.find(current_user.id)
        
  end

  private

  def get_client
    linkedin_oauth_setting = LinkedinOauthSetting.find_by_user_id(current_user.id)
    client = LinkedIn::Client.new(API_KEY,SECRET_KEY, @@config)
    client.authorize_from_access($token,$secret)
    client
  end

  def get_basic_profile
    bprofile = BasicProfile.find_by_user_id(current_user.id)
    if bprofile.nil?
      client = get_client
      profile = client.profile(:fields => ["first-name", "last-name", "maiden-name", "formatted-name" ,:headline, :location, :industry, :summary, :specialties, "picture-url", "public-profile-url"])

      basic_profile = profile.to_hash
      basic_profile[:location] = basic_profile["location"]["name"]
      new_basic_profile = BasicProfile.new(basic_profile)
      new_basic_profile.user = current_user
      new_basic_profile.save 
      new_basic_profile
    else
      bprofile
    end
  end

  def get_full_profile
    fprofile = FullProfile.find_by_user_id(current_user.id)
    if fprofile.nil?
      client = get_client
      full_profile = client.profile(:fields => [:associations, :honors, :interests])
      full_profile = full_profile.to_hash
      new_full_profile = FullProfile.new(full_profile)
      new_full_profile.user = current_user
      new_full_profile.save 
      new_full_profile
    else
      fprofile
    end
  end

  def get_positions
    positions = Position.where(full_profile_id:current_user.full_profile.id)
    if positions.empty?
      client = get_client
      positions = client.profile(:fields => [:positions]).positions.all
      positions.each do |p|
        if p.is_current == "true"
          Position.create(
            title: p.title, 
            summary: p.summary, 
            start_date: Date.parse("1/#{p.start_date.month ? p.start_date.month : 1}/#{p.start_date.year}"), 
            end_date: Date.parse("1/#{p.end_date.month ? p.end_date.month : 1}/#{p.end_date.year}"), 
            is_current: p.is_current, 
            company: p.company.name, 
            full_profile_id: current_user.full_profile.id)
        else
          Position.create(
            title: p.title, 
            summary: p.summary, 
            start_date: Date.parse("1/#{p.start_date.month ? p.start_date.month : 1}/#{p.start_date.year}"), 
            is_current: p.is_current, 
            company: p.company.name, 
            full_profile_id: current_user.full_profile.id)
        end
      end
      current_user.full_profile.positions
    else
      positions
    end
  end

  def get_educations
    educations = Education.where(full_profile_id:current_user.full_profile.id)
    if educations.empty?
      client = get_client
      if client.profile(:fields => [:educations]).educations.nil?
        current_user.full_profile.educations
      else
        educations = client.profile(:fields => [:educations]).educations.all
        educations.each do |e|
          new_educations = Education.create(
            school_name: e.school_name, 
            field_of_study: e.field_of_study, 
            start_date: Date.parse("1/#{e.end_date.month ? p.end_date.month : 1}/#{e.end_date.year}"), 
            end_date: Date.parse("1/#{e.end_date.month ? p.end_date.month : 1}/#{e.end_date.year}"), 
            degree: e.degree, 
            activities: e.activities, 
            notes: e.notes, 
            full_profile_id: current_user.full_profile.id)  
        end
        current_user.full_profile.educations
      end
    else
      educations
    end
  end

  def get_skills
    skills = Skill.where(full_profile_id:current_user.full_profile.id)
    if skills.empty?
      client = get_client
      if client.profile(:fields => [:skills]).skills.nil?
        return
      else
        skills = client.profile(:fields => [:skills]).skills.all
        skills.each do |s|
          new_skills = Skill.create(
            skill_id: s.id, 
            name: s.skill.name,
            full_profile_id: current_user.full_profile.id)  
        end
      end
    else
      skills
    end
  end

  def get_phone_nos
    phones = PhoneNo.find_by_user_id(current_user.id)
    if phones.nil?
      client = get_client
      if client.profile(:fields => [:phone_numbers]).phone_numbers.all.nil?
        return
      else
        phones = client.profile(:fields => [:phone_numbers]).phone_numbers.all
        phones.each do |p|
          new_phone = PhoneNo.create(
            phone_type: p.phone_type, 
            phone_number: p.phone_number.to_i,
            user_id: current_user.id)  
        end
      end
    else
      phones
    end

  end

  def get_ims
    ims = Im.find_by_user_id(current_user.id)
    if ims.nil?
      client = get_client
      if client.profile(:fields => [:im_accounts]).im_accounts.all.nil?
        return
      else
        ims = client.profile(:fields => [:im_accounts]).im_accounts.all
        ims.each do |i|
          new_phone = Im.create(
            im_account_type: i.im_account_type, 
            im_account_name: i.im_account_name,
            user_id: current_user.id)  
        end
      end
    else
      ims
    end

  end

  def get_address
    ad = Address.find_by_user_id(current_user.id)
    if ad.nil?
      client = get_client
      if client.profile(:fields => [:main_address]).main_address.nil?
        return
      else
          Address.create(
            address: client.profile(:fields => [:main_address]).main_address,
            user_id: current_user.id)  
      end
    else
      ad
    end

  end

end

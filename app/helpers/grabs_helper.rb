module GrabsHelper
  
  def find_grab(grab)
    grab = Grab.find(grab)
    return grab
  end
  
end

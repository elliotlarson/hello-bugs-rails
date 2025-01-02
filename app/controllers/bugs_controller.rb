class BugsController < ApplicationController
  def index
    @bugs = Bug.all.order(:hashid)
  end

  def show
    @bug = Bug.find_by!(hashid: params[:id])

    bug_hashids = Bug.all.order(:hashid).pluck(:hashid)
    current_index = bug_hashids.find_index(@bug.hashid)
    prev_index = current_index == 0 ? bug_hashids.size - 1 : current_index - 1
    next_index = current_index == bug_hashids.size - 1 ? 0 : current_index + 1
    @prev_bug_hashid = bug_hashids[prev_index]
    @next_bug_hashid = bug_hashids[next_index]
  end
end

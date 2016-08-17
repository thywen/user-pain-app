class BugsController < ApplicationController
  def index
    @bugs = Bug.all
  end

  def new
    @bug = Bug.new
    @options_for_priority = options_for_priorities
    @options_for_type = options_for_type
    @options_for_likelyhood = options_for_likelyhood
  end

  def create
    params = add_score(bug_params)
    @bug = Bug.new(params)
    if @bug.save
      flash[:succes] = 'Bug was created'
      redirect_to bug_path(@bug)
    else
      render :new
    end
  end

  def show
    @bug = Bug.find(params[:id])
  end

  private

  def bug_params
    params.require(:bug).permit(:ticket_number, :bug_title, :priority, :bug_type, :likelyhood)
  end

  def add_score(params)
    params[:score] = (params[:priority].to_i + params[:bug_type].to_i + params[:likelyhood].to_i) *
                     100 / number_of_options
    params
  end

  def number_of_options
    options_for_priorities.size +
      options_for_type.size +
      options_for_likelyhood.size
  end

  def options_for_priorities
    [
      ['5: Blocking further progress on the daily build.', 5],
      ['4: A User can not use the page', 4],
      ['3: A User would have problems using the page', 3],
      ['2: A Pain – users won’t like this once they notice it', 2],
      ['1: Nuisance – not a big deal but noticeable.', 1]
    ]
  end

  def options_for_type
    [
      ['7: Crash: Bug causes crash or data loss.', 7],
      ['6: Major usability: Impairs usability in key scenarios.', 6],
      ['5: Minor usability: Impairs usability in secondary scenarios.', 5],
      ['4: Balancing: Enables degenerate usage strategies that harm the experience.', 4],
      ['3: Visual and Sound Polish: Aesthetic issues', 3],
      ['2: Localization', 2],
      ['1: Documentation: A documentation issue', 1]
    ]
  end

  def options_for_likelyhood
    [
      ['5: Will affect all users.', 5],
      ['4: Will affect most users.', 4],
      ['3: Will affect average number of users.', 3],
      ['2: Will only affect a few users.', 2],
      ['1: Will affect almost no one.', 1]
    ]
  end
end

class BugController < ApplicationController
  def index
    @bugs = Bug.all
  end

  def new
    @options_for_priority = options_for_priorities
    @options_for_type = options_for_type
    @options_for_likelyhood = options_for_likelyhood
  end

  private

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

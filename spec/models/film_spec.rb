require 'spec_helper'

describe Film do
  before(:each) do
    @valid_attrs={
      :title=>"Kaczor Donald",
      :genre=>"Film animowany",
      :director=>"Goofy",
      :cast => "Myszka Miki, Kaczor Donald",
      :plot=>"Fabuła ...",
      :run_time => "1.30 min",
      :release => Date.today,
      :version3d => true,
      :limitation => "od 12 lat"
    }
    @film = Film.new(@valid_attrs)
  end

  it "Powinien być poprPowinien być poprawny z podanymi atrybutami" do
    @film.should be_valid
    @film.save.should be_true
  end

  it "Powinien mieć tytuł" do
    @film.title = nil
    @film.should be_invalid
    @film.save.should be_false
  end

  it "Powinien mieć reżysera" do
    @film.director = nil
    @film.should be_invalid
    @film.save.should be_false
  end

  it "Powinien mieć aktorów" do
    @film.cast = nil
    @film.should be_invalid
    @film.save.should be_false
  end

  it "Powinien posiadać opis" do
    @film.plot = nil
    @film.should be_invalid
    @film.save.should be_false
  end

  it "Powinien mieć gatunek" do
    @film.genre = nil
    @film.should be_invalid
    @film.save.should be_false
  end

  it "Powinien mieć czas trwania" do
    @film.run_time = nil
    @film.should be_invalid
    @film.save.should be_false
  end

  it "Może nie musi posiadać ograniczenia wiekowe, date premiery i wersje 3d" do
    @film.release = nil
    @film.version3d = nil
    @film.limitation = nil
    @film.should be_valid
    @film.save.should be_true
  end
end

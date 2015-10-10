require File.expand_path("code/music_parser")

describe MusicParser do
  describe ".parse" do
    subject { MusicParser.parse(File.expand_path("data/music.yaml")) }

    it "allows accessing via []" do
      expect(subject["genres"].last["artists"].first["albums"].first["tracks"].last).to eq "But Not For Me"
    end

    it "allows accessing via []" do
      expect(subject["genres"].first["artists"].first["albums"].last["tracks"].last.first["name"]).to eq "Whole Lotta Love I"
    end

    it "allows accessing via method calls" do
      expect(subject.genres.last.artists.first.albums.first.tracks.last).to eq "But Not For Me"
    end

    it "allows accessing via method calls" do
      expect(subject.genres.first.artists.first.albums.last.tracks.last.first.name).to eq "Whole Lotta Love I"
    end
  end
end
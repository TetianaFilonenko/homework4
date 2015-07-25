require './library/library.rb'

    describe Library::PublishedBook do
     
      let!(:publisher1) { Library::PublishedBook.new "", "", "", "", "" }
      let!(:publisher2) { Library::PublishedBook.new "", "", "", "", "" }
      let!(:publisher3) { Library::PublishedBook.new "", "", "", "", "" }
      let!(:publisher4) { Library::PublishedBook.new "", "", "", "", "" }
      let!(:publisher5) { Library::PublishedBook.new "", "", "", "", "" }
     
      it 'should return good id of object' do
        expect(publisher3.identifier).to eq 3
        expect(Library::PublishedBook.group_identifier).to eq 5
        expect(publisher3.eql?(publisher4)).to eq false
        expect(publisher2.eql?(publisher2)).to eq true
        expect(publisher3 == publisher4).to eq false
        expect(publisher2 == publisher2).to eq true
     
      end
     
    end
    describe Library::Reader do
     
      let!(:reader1) { Library::Reader.new "", "" }
      let!(:reader2) { Library::Reader.new "", "" }
      let!(:reader3) { Library::Reader.new "", "" }
      let!(:reader4) { Library::Reader.new "", "" }
      let!(:reader5) { Library::Reader.new "", "" }
     
     
      it 'should return good id of object' do
        expect(reader4.identifier).to eq 9
        expect(Library::Reader.group_identifier).to eq 5
        expect(reader4.eql?(reader5)).to eq false
        expect(reader2.eql?(reader2)).to eq true
        expect(reader3 == reader4).to eq false
        expect(reader2 == reader2).to eq true
      end
    end


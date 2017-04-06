require('spec_helper')

describe(Train) do

    describe("#initialize") do
        it("is initialized with a name") do
            train = Train.new({:name => "CX220", :id => nil})
            expect(train).to(be_an_instance_of(Train))
        end

        it("can be initialized with its database ID") do
            train = Train.new({:name => "CX221", :id => 1})
            expect(train).to(be_an_instance_of(Train))
        end
    end

    describe(".all") do
        it("starts off with no trains") do
            expect(Train.all()).to(eq([]))
        end
    end

    describe(".find") do
        it("returns a train by its ID number") do
            test_train = Train.new({:name => "CS220", :id => nil})
            test_train.save()
            test_train2 = Train.new({:name => "TT220", :id => nil})
            test_train2.save()
            expect(Train.find(test_train2.id())).to(eq(test_train2))
        end
    end

    describe("#==") do
        it("is the same train if it has the same name and id") do
            train = Train.new({:name => "CS200", :id => nil})
            train2 = Train.new({:name => "CS200", :id => nil})
            expect(train).to(eq(train2))
        end
    end

    describe("#update") do
        it("lets you update trains in the database") do
            train = Train.new({:name => "CS2001", :id => nil})
            train.save()
            train.update({:name => "CS2002"})
            expect(train.name()).to(eq("CS2002"))
        end
        it("lets you add a town to a train") do
            town = Town.new({:name => "Mong Kok", :id => nil})
            town.save()
            train = Train.new({:name => "CS2001", :id => nil})
            train.save()
            train.update({:town_ids => [town.id()]})
            expect(train.towns()).to(eq([town]))
        end
    end

    describe("#delete") do
        it("lets you delete a train from the database") do
            train = Train.new({:name => "CC003", :id => nil})
            train.save()
            train2 = Train.new({:name => "CX888", :id => nil})
            train2.save()
            train.delete()
            expect(Train.all()).to(eq([train2]))
        end

        # it("deletes a train's towns from the database") do
        #     train = Train.new({:name => "CC003", :id => nil})
        #     train.save()
        #     towns = Town.new({:name => "Jordan", :train_id => train.id()})
        #     towns.save()
        #     towns2 = Town.new({:name => "Causeway Bay", :train_id => train.id()})
        #     towns2.save()
        #     train.delete()
        #     expect(Town.all()).to(eq([]))
        # end
    end

    describe("#towns") do
        it("returns all of the towns a particular train will be visiting") do
            town = Town.new(:name => "Shatin", :id => nil)
            town.save()
            town2 = Town.new(:name => "Tai Po", :id => nil)
            town2.save()
            train = Train.new(:name => "CS100", :id => nil)
            train.save()
            train.update(:town_ids => [town.id()])
            train.update(:town_ids => [town2.id()])
            expect(train.towns()).to(eq([town, town2]))
        end
    end

    describe("#name") do
        it("tells you its name") do
            train = Train.new({:name => "CSN1234", :id => nil})
            expect(train.name()).to(eq("CSN1234"))
        end
    end

    describe("#id") do
        it("sets its ID when you save it") do
            train = Train.new({:name => "CSN1234", :id => nil})
            train.save()
            expect(train.id()).to(be_an_instance_of(Fixnum))
        end
    end

    describe("#save") do
        it("lets you save trains to the database") do
            train = Train.new({:name => "CSN1234", :id => nil})
            train.save()
            expect(Train.all()).to(eq([train]))
        end
    end
end

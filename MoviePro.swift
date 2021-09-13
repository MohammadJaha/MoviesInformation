/*
Movie Project
Written By Mohammad Jaha
2021/9/6
*/

/*
Using ::
Dictionaries
Condition
Loop
Functions

Index ::
Name :String
Type :String Array
Rate :Double

Req ::
Add
remove
edit ==> Name - Rate - Types
search ==>
   Movie Name :information about the Movie
   Type :All Movies from the same Types
   Rate :All Movies Inside the given Range
*/

//Variables
var MNames=[String:[String]]() //(MName:MTypes)
var MRating=[String:Double]() //(MName:MRating)
var MTypes=[String:[String]]() //(MType:MName)


//Add New Movie
func Add(_ Name:String,_ Rate:Double,_ Type:[String]){
    print("Adding:")
    let exist=MNames[Name] != nil
    if exist == true{
        print("Movie (\(Name)) Already Exist")
    }
    else{
        var N=[String]()
        for TName in Type{
            let e2=MTypes[TName] != nil
            N.append(TName)
            if e2 == true{
                var N2=[String]()
                N2=MTypes[TName]!
                N2.append(Name)
                MTypes.updateValue(N2,forKey:TName)
            }
            else {
                MTypes[TName]=[Name]
            }
        }
        MNames[Name]=N
        MRating[Name]=Rate
        print("New Movie\nName: \(Name)   Rate: \(MRating[Name]!)   Types: \(MNames[Name]!)\nWas Added Successfuly")
    }
}


//Removing Movies
func Delete(_ Name:String){
    print("Deleting:")
    let exist=MNames[Name] != nil
    if exist == false{
        print("Movie (\(Name)) not Exist")
    }
    else{
        print("Movie\nName: \(Name)   Rate: \(MRating[Name]!)   Types: \(MNames[Name]!)\nWas Deleted Successfuly")
        var N=[String]()
        N=MNames[Name]!
        for TName in N{
            var N2=[String]()
            N2=MTypes[TName]!
            var N3=Int()
            for (index,e) in N2.enumerated(){
                if e == Name{
                    N3=index
                }
            }
            N2.remove(at:N3)
            MTypes.updateValue(N2,forKey:TName)
        }
        MNames[Name]=nil
        MRating[Name]=nil
    }

}


//Editing Movies Name
func Edit(_ Name:String,_ NewName:String,_ Rate:Double,_ Type:[String]){
    print("Editing:")
    let exist=MNames[Name] != nil
    let NewExist=MNames[NewName] != nil
    if exist == false{
        print("Movie (\(Name)) not Exist")
    }
    else if NewExist == true{
        print("Movie (\(NewName)) Already Exist")
    }
    else{ 
        Delete(Name)
        Add(NewName,Rate,Type)
        print("Finish Editing")
    }
}


//Serching For Movies Name
func SearchName(_ Name:String){
    print("Searching for Movie Name:")
    let exist=MNames[Name] != nil
    if exist == true{
        print("Name: \(Name)   Rate: \(MRating[Name]!)   Types: \(MNames[Name]!)")
    }
    else{
        print("Movie \(Name) Not Exist")
    }
    print("End Of Searching")
}


//Searching For Rating Inside Range
func SearchRate(_ Mini:Double,_ Max:Double){
    print("Searching for Movie Rate Between \(Mini) and \(Max):")
    var count=Int()
    for Mnames in MRating.keys{
        if MRating[Mnames]!>=Mini && MRating[Mnames]!<=Max{
            print("Movie\nName: \(Mnames)   Rating: \(MRating[Mnames]!)")
            count+=1
        }
    }
    if count == 0{
        print("No Movie Between Range Exist")
    }
    print("End Of Searching")
}


//Searching For Movie Type
func SearchingType(_ Type:String){
    print("Searching for Movies Name From Type \(Type):")
    let exist=MTypes[Type] != nil
    if exist == true{
        print("Movies: \(MTypes[Type]!)")
    }
    else{
        print("Type \(Type) Not Exist")
    }
    print("End Of Searching")
}

var con = -1
while con != 0{
    print("""
    Enter
    1 : To Add New Movie
    2 : To Delete a Movie
    3 : To Edit a Movie
    4 : To Search For a Movie
    or 0 to Exit\n
    """)
    let x=(Int(readLine()!))
    con=x!
    if x! == 1{
        print("Enter Movie's Name")
        let xname=(readLine()!)
        print("Enter Movie's Rate")
        let xrate=(Double(readLine()!))
        var artype=[String]()
        let nu=1
        while nu != 0{
            print("Enter Movie's Type or E to Finish")
            let xttype=(readLine()!)
            if xttype == "E"{
                break
            }
            if xttype != ""{
                artype+=[xttype]   
            }
        }
        Add(xname,xrate!,artype)
        print("\n\n")
    }

    else if x! == 2{
        print("Enter Movie's Name")
        let xname=(readLine()!)
        Delete(xname)
        print("\n\n")
    }

    else if x! == 3{
        print("Enter Old Movie's Name")
        let xoldname=(readLine()!)
        print("Enter New Movie's Name")
        let xname=(readLine()!)
        print("Enter New Movie's Rate")
        let xrate=(Double(readLine()!))
        var artype=[String]()
        let nu=1
        while nu != 0{
            print("Enter New Movie's Type or E to Finish")
            let xttype=(readLine()!)
            if xttype == "E"{
                break
            }
            if xttype != ""{
                artype+=[xttype]
            }
        }
        Edit(xoldname,xname,xrate!,artype)
        print("\n\n")
    }

    else if x! == 4{
        var con1 = -1
        while con1 != 0{
            print("""
            Enter
            1 : To Search By Name
            2 : To Search By Rate
            3 : To Searsh By Type
            or 0 to Exit
            """)
            let xx=(Int(readLine()!))
            con1=xx!
            if xx! == 1{
                print("Enter Movie's Name")
                let exname=(readLine()!)
                SearchName(exname)
                con1=0
            }
            else if xx! == 2{
                print("Enter Starting Rate")
                let xsrate=(Double(readLine()!))
                print("Enter Finish Rate")
                let xfrate=(Double(readLine()!))
                SearchRate(xsrate!,xfrate!)
                con1=0
            }
            else if xx! == 3{
                print("Enter Type to Search")
                let xtypee=(readLine()!)
                SearchingType(xtypee)
                con1=0
            }
            else{
                if con1 != 0{
                    print("Wrong Input\n\n")
                }
            }
        }
        print("\n\n")
    }

    else{
        if con != 0{
            print("Wrong Input\n\n")
        }
    }
}

/*
//Test 1
print("Test1")
Add("Ali",2.3,["Action","scary"])
Add("Jack",10,["Adventure","scary"])
print("\n\n")

//Test 2
print("Test2")
Add("Ali",2.3,["Action","scary"])
Add("Mike",8.3,["Action","Adventure"])
print("\n\n")

//Test 3
print("Test3")
Delete("Olai")
Delete("Jack")
Delete("Ali")
print("\n\n")

//Test 4
print("Test4")
Add("Olai",1.3,["Action","scary"])
Edit("Jack","Kosa",7.4,["scary","Adventure"])
Edit("Olai","Mike",5.9,["Action","Adventure"])
Edit("Mike","Jack",9.9,["scary","Action","Adventure"])
print("\n\n")

//Test 5
print("Test5")
SearchName("Ali")
SearchName("Jack")
print("\n\n")

//Test 6
print("Test6")
SearchRate(1.1,10)
SearchRate(0,1)
print("\n\n")

//Test 7
print("Test7")
SearchingType("Action")
SearchingType("Horror")
print("\n\n")
*/

print(MNames,MRating,MTypes)

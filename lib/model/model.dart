import '../util/utils.dart';

class Doc
{
    int id;
    String title;
    String expiration;
    
    int fqYear;
    int fqHalfYear;
    int fqQuarter;
    int fqMonth;
//so Doc class contains this and they must be provided when Doc is being set up
    Doc(this.title, this.expiration, this.fqYear,
        this.fqHalfYear, this.fqQuarter, this.fqMonth);
//Doc version withId(this is set up with an id supplied. big difference from Doc
//so Doc.withId(parameters) will get you a Doc class as well)
    Doc.withId(this.id, this.title, this.expiration, this.fqYear,
        this.fqHalfYear, this.fqQuarter, this.fqMonth);

    Map<String, dynamic> toMap() {
// set the mapping format to what it should be set to according to the typed method
//toMap is from the form filled and it generates a map object from them by assigning
//the filled answers to its imminent returned map element. (map['title'] is set to the supplied this.title)
        var map = Map<String, dynamic>();

        map["title"] = this.title;
        map["expiration"] = this.expiration;
        map["fqYear"] = this.fqYear;
        map["fqHalfYear"] = this.fqHalfYear;
        map["fqQuarter"] = this.fqQuarter;
        map["fqMonth"] = this.fqMonth;
//for those without id, map["id"] is set to  id
        if (id != null) {
          map["id"] = id;
        }   
        return map;
    }

// to get form elements from a dynamic object(most likely from the database). 
// This is for the forms to be filled out by the database, a form of reverse of what was done earlier. 
    Doc.fromObject(dynamic o) {
        this.id = o["id"];
        this.title = o["title"];
        this.expiration = DateUtils.TrimDate(o["expiration"]);
        this.fqYear = o["fqYear"];
        this.fqHalfYear = o["fqHalfYear"];
        this.fqQuarter = o["fqQuarter"];
        this.fqMonth = o["fqMonth"];
    }
}
class Times {
  String status;
  String copyright;
  String section;
  String lastUpdated;
  int numResults;
  List<dynamic> results;
  Times(
      {this.status,
      this.copyright,
      this.section,
      this.lastUpdated,
      this.numResults,
      this.results});

  factory Times.fromJson(Map<String, dynamic> json) {
    return Times(
      status: json['status'],
      copyright: json['copyright'],
      section: json['section'],
      lastUpdated: json['last_updated'],
      numResults: json['num_results'],
      results: json['results'],
    );
  }
}

//
class Results {
  String section;
  String subsection;
  String title;
  String abstract;
  String url;
  String uri;
  String byline;
  String itemType;
  String updatedDate;
  String createdDate;
  String publishedDate;
  String materialTypeFacet;
  String kicker;
  String shortUrl;
  List<dynamic> desFacet;
  List<dynamic> orgFacet;
  List<dynamic> perFacet;
  List<dynamic> geoFacet;
  List<dynamic> multiMedia;
  Results({
    this.section,
    this.title,
    this.url,
    this.abstract,
    this.byline,
    this.createdDate,
    this.desFacet,
    this.geoFacet,
    this.itemType,
    this.kicker,
    this.materialTypeFacet,
    this.multiMedia,
    this.orgFacet,
    this.perFacet,
    this.publishedDate,
    this.shortUrl,
    this.subsection,
    this.updatedDate,
    this.uri,
  });
  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      section: json['section'] as String,
      subsection: json['subsection'] as String,
      title: json['title'] as String,
      abstract: json['abstract'] as String,
      url: json['url'] as String,
      uri: json['uri'] as String,
      byline: json['byline'] as String,
      itemType: json['item_type'] as String,
      updatedDate: json['updated_date'] as String,
      createdDate: json['created_date'] as String,
      publishedDate: json['published_date'] as String,
      materialTypeFacet: json['material_type_facet'] as String,
      kicker: json['kicker'] as String,
      shortUrl: json['short_url'] as String,
      geoFacet: json['geo_facet'] as List<dynamic>,
      desFacet: json['des_facet'] as List<dynamic>,
      orgFacet: json['org_facet'] as List<dynamic>,
      multiMedia: json['multimedia'] as List<dynamic>,
      perFacet: json['per_facet'] as List<dynamic>,
    );
  }
}

//"results": [
// {
// "section": "technology",
// "subsection": "",
// "title": "Hundreds of Google Employees Unionize, Culminating Years of Activism",
// "abstract": "The creation of the uniandle the change.",
// "url": "https://www.nytimes.com/2021/01/04/technology/google-employees-union.html",
// "uri": "nyt://article/17654f45-8243-538c-9948-54d87606948d",
// "byline": "By Kate Conger",
// "item_type": "Article",
// "updated_date": "2021-01-04T08:31:06-05:00",
// "created_date": "2021-01-04T06:00:08-05:00",
// "published_date": "2021-01-04T06:00:08-05:00",
// "material_type_facet": "",
// "kicker": "",
// "des_facet": [7 items],
// "org_facet": [3 items],
// "per_facet": [1 item],
// "geo_facet": [],
// "multimedia": [5 items],
// "short_url": "https://nyti.ms/3pFY3Jg"
// },
//****************************************************//
//"status": "OK",
// "copyright": "Copyright (c) 2021 The New York Times Company. All Rights Reserved.",
// "section": "Business",
// "last_updated": "2021-01-04T06:54:28-05:00",
// "num_results": 33,
// "results":

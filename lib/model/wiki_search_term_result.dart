class WikiSearchTermResult {
  bool? batchcomplete;
  Query? query;

  WikiSearchTermResult({this.batchcomplete, this.query});

  WikiSearchTermResult.fromJson(Map<String, dynamic> json) {
    batchcomplete = json['batchcomplete'];
//continue = json['continue'] != null ? new Continue.fromJson(json['continue']) : null;
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batchcomplete'] = batchcomplete;

    if (query != null) {
      data['query'] = query!.toJson();
    }
    return data;
  }
}

class Query {
  List<Redirects>? redirects;
  List<Pages>? pages;

  Query({this.redirects, this.pages});

  Query.fromJson(Map<String, dynamic> json) {
    if (json['redirects'] != null) {
      redirects = <Redirects>[];
      json['redirects'].forEach((v) {
        redirects!.add(new Redirects.fromJson(v));
      });
    }
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(new Pages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (redirects != null) {
      data['redirects'] = redirects!.map((v) => v.toJson()).toList();
    }
    if (pages != null) {
      data['pages'] = pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Redirects {
  int? index;
  String? from;
  String? to;

  Redirects({this.index, this.from, this.to});

  Redirects.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = index;
    data['from'] = from;
    data['to'] = to;
    return data;
  }
}

class Pages {
  int? pageid;
  int? ns;
  String? title;
  int? index;
  Thumbnail? thumbnail;
  Terms? terms;

  Pages(
      {this.pageid,
      this.ns,
      this.title,
      this.index,
      this.thumbnail,
      this.terms});

  Pages.fromJson(Map<String, dynamic> json) {
    pageid = json['pageid'];
    ns = json['ns'];
    title = json['title'];
    index = json['index'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    terms = json['terms'] != null ? new Terms.fromJson(json['terms']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageid'] = pageid;
    data['ns'] = ns;
    data['title'] = title;
    data['index'] = index;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    if (terms != null) {
      data['terms'] = terms!.toJson();
    }
    return data;
  }
}

class Thumbnail {
  String? source;
  int? width;
  int? height;

  Thumbnail({this.source, this.width, this.height});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = source;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

class Terms {
  List<String>? description;

  Terms({this.description});

  Terms.fromJson(Map<String, dynamic> json) {
    description = json['description'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = description;
    return data;
  }
}

class User {
  int id;
  String login;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;
  double score;

  User(
      {this.id,
      this.login,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin,
      this.score});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
    score = json['score'];
  }

  User.fromJsonSub(Map<String, dynamic> json) {
    id = json['items']['id'];
    login = json['items']['login'];
    nodeId = json['items']['node_id'];
    avatarUrl = json['items']['avatar_url'];
    gravatarId = json['items']['gravatar_id'];
    url = json['items']['url'];
    htmlUrl = json['items']['html_url'];
    followersUrl = json['items']['followers_url'];
    followingUrl = json['items']['following_url'];
    gistsUrl = json['items']['gists_url'];
    starredUrl = json['items']['starred_url'];
    subscriptionsUrl = json['items']['subscriptions_url'];
    organizationsUrl = json['items']['organizations_url'];
    reposUrl = json['items']['repos_url'];
    eventsUrl = json['items']['events_url'];
    receivedEventsUrl = json['items']['received_events_url'];
    type = json['items']['type'];
    siteAdmin = json['items']['site_admin'];
    score = json['items']['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['avatar_url'] = this.avatarUrl;
    data['gravatar_id'] = this.gravatarId;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['followers_url'] = this.followersUrl;
    data['following_url'] = this.followingUrl;
    data['gists_url'] = this.gistsUrl;
    data['starred_url'] = this.starredUrl;
    data['subscriptions_url'] = this.subscriptionsUrl;
    data['organizations_url'] = this.organizationsUrl;
    data['repos_url'] = this.reposUrl;
    data['events_url'] = this.eventsUrl;
    data['received_events_url'] = this.receivedEventsUrl;
    data['type'] = this.type;
    data['site_admin'] = this.siteAdmin;
    data['score'] = this.score;
    return data;
  }
}

class Author
  include CouchRest::Model::Embeddable

  property :name,     String
  property :twitter,  String
  property :url,      String
  property :bio,      String
end

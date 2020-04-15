//
//	ArticleResult.swift

import Foundation

class ArticleResult : Codable {

	let abstractField : String?
	let adxKeywords : String?
	let assetId : Int?
	let byline : String?
	let desFacet : [String]?
	let etaId : Int?
	let id : Int?
	let media : [ArticleMedia]?
	let nytdsection : String?
	let perFacet : [String]?
	let publishedDate : String?
	let section : String?
	let source : String?
	let subsection : String?
	let title : String?
	let type : String?
	let updated : String?
	let uri : String?
	let url : String?


	enum CodingKeys: String, CodingKey {
		case abstractField = "abstract"
		case adxKeywords = "adx_keywords"
		case assetId = "asset_id"
		case byline = "byline"
		case desFacet = "des_facet"
		case etaId = "eta_id"
		case id = "id"
		case media = "media"
		case nytdsection = "nytdsection"
		case perFacet = "per_facet"
		case publishedDate = "published_date"
		case section = "section"
		case source = "source"
		case subsection = "subsection"
		case title = "title"
		case type = "type"
		case updated = "updated"
		case uri = "uri"
		case url = "url"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		abstractField = try values.decodeIfPresent(String.self, forKey: .abstractField) ?? String()
		adxKeywords = try values.decodeIfPresent(String.self, forKey: .adxKeywords) ?? String()
		assetId = try values.decodeIfPresent(Int.self, forKey: .assetId) ?? Int()
		byline = try values.decodeIfPresent(String.self, forKey: .byline) ?? String()
		desFacet = try values.decodeIfPresent([String].self, forKey: .desFacet) ?? [String]()
		etaId = try values.decodeIfPresent(Int.self, forKey: .etaId) ?? Int()
		id = try values.decodeIfPresent(Int.self, forKey: .id) ?? Int()
		media = try values.decodeIfPresent([ArticleMedia].self, forKey: .media) ?? [ArticleMedia]()
		nytdsection = try values.decodeIfPresent(String.self, forKey: .nytdsection) ?? String()
		perFacet = try values.decodeIfPresent([String].self, forKey: .perFacet) ?? [String]()
		publishedDate = try values.decodeIfPresent(String.self, forKey: .publishedDate) ?? String()
		section = try values.decodeIfPresent(String.self, forKey: .section) ?? String()
		source = try values.decodeIfPresent(String.self, forKey: .source) ?? String()
		subsection = try values.decodeIfPresent(String.self, forKey: .subsection) ?? String()
		title = try values.decodeIfPresent(String.self, forKey: .title) ?? String()
		type = try values.decodeIfPresent(String.self, forKey: .type) ?? String()
		updated = try values.decodeIfPresent(String.self, forKey: .updated) ?? String()
		uri = try values.decodeIfPresent(String.self, forKey: .uri) ?? String()
		url = try values.decodeIfPresent(String.self, forKey: .url) ?? String()
	}

}

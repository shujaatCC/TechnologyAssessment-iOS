//
//	ArticleMedia.swift

import Foundation

class ArticleMedia : Codable {

	let approvedForSyndication : Int?
	let caption : String?
	let copyright : String?
	let mediametadata : [ArticleMediaMetadata]?
	let subtype : String?
	let type : String?


	enum CodingKeys: String, CodingKey {
		case approvedForSyndication = "approved_for_syndication"
		case caption = "caption"
		case copyright = "copyright"
		case mediametadata = "media-metadata"
		case subtype = "subtype"
		case type = "type"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		approvedForSyndication = try values.decodeIfPresent(Int.self, forKey: .approvedForSyndication) ?? Int()
		caption = try values.decodeIfPresent(String.self, forKey: .caption) ?? String()
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright) ?? String()
		mediametadata = try values.decodeIfPresent([ArticleMediaMetadata].self, forKey: .mediametadata) ?? [ArticleMediaMetadata]()
		subtype = try values.decodeIfPresent(String.self, forKey: .subtype) ?? String()
		type = try values.decodeIfPresent(String.self, forKey: .type) ?? String()
	}


}

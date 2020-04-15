//
//	ArticleMedia-metadata.swift

import Foundation

class ArticleMediaMetadata : Codable {

	let format : String?
	let height : Int?
	let url : String?
	let width : Int?


	enum CodingKeys: String, CodingKey {
		case format = "format"
		case height = "height"
		case url = "url"
		case width = "width"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		format = try values.decodeIfPresent(String.self, forKey: .format) ?? String()
		height = try values.decodeIfPresent(Int.self, forKey: .height) ?? Int()
		url = try values.decodeIfPresent(String.self, forKey: .url) ?? String()
		width = try values.decodeIfPresent(Int.self, forKey: .width) ?? Int()
	}


}

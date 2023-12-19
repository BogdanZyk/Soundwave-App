// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

class GetRoomByKeyQuery: GraphQLQuery {
  static let operationName: String = "GetRoomByKey"
  static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetRoomByKey($key: String!) { GetRoomByKey(Key: $key) { __typename ...RoomAttrs } }"#,
      fragments: [RoomAttrs.self, MediaInfoAttrs.self, SourceAttrs.self]
    ))

  public var key: String

  public init(key: String) {
    self.key = key
  }

  public var __variables: Variables? { ["key": key] }

  struct Data: SchemaAPI.SelectionSet {
    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { SchemaAPI.Objects.RootQueryType }
    static var __selections: [ApolloAPI.Selection] { [
      .field("GetRoomByKey", GetRoomByKey?.self, arguments: ["Key": .variable("key")]),
    ] }

    var getRoomByKey: GetRoomByKey? { __data["GetRoomByKey"] }

    init(
      getRoomByKey: GetRoomByKey? = nil
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": SchemaAPI.Objects.RootQueryType.typename,
          "GetRoomByKey": getRoomByKey._fieldData,
        ],
        fulfilledFragments: [
          ObjectIdentifier(GetRoomByKeyQuery.Data.self)
        ]
      ))
    }

    /// GetRoomByKey
    ///
    /// Parent Type: `Room`
    struct GetRoomByKey: SchemaAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { SchemaAPI.Objects.Room }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(RoomAttrs.self),
      ] }

      var mediaInfo: MediaInfo? { __data["MediaInfo"] }
      var id: String? { __data["Id"] }
      var likes: Int? { __data["Likes"] }
      var `private`: Bool? { __data["Private"] }
      var image: String? { __data["Image"] }
      var key: String? { __data["Key"] }
      var name: String? { __data["Name"] }
      var owner: RoomAttrs.Owner? { __data["Owner"] }

      struct Fragments: FragmentContainer {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        var roomAttrs: RoomAttrs { _toFragment() }
      }

      init(
        mediaInfo: MediaInfo? = nil,
        id: String? = nil,
        likes: Int? = nil,
        `private`: Bool? = nil,
        image: String? = nil,
        key: String? = nil,
        name: String? = nil,
        owner: RoomAttrs.Owner? = nil
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": SchemaAPI.Objects.Room.typename,
            "MediaInfo": mediaInfo._fieldData,
            "Id": id,
            "Likes": likes,
            "Private": `private`,
            "Image": image,
            "Key": key,
            "Name": name,
            "Owner": owner._fieldData,
          ],
          fulfilledFragments: [
            ObjectIdentifier(GetRoomByKeyQuery.Data.GetRoomByKey.self),
            ObjectIdentifier(RoomAttrs.self)
          ]
        ))
      }

      /// GetRoomByKey.MediaInfo
      ///
      /// Parent Type: `MediaInfo`
      struct MediaInfo: SchemaAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { SchemaAPI.Objects.MediaInfo }

        var currentTimeSeconds: Double? { __data["CurrentTimeSeconds"] }
        var durationSeconds: Double? { __data["DurationSeconds"] }
        var source: Source? { __data["Source"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var mediaInfoAttrs: MediaInfoAttrs { _toFragment() }
        }

        init(
          currentTimeSeconds: Double? = nil,
          durationSeconds: Double? = nil,
          source: Source? = nil
        ) {
          self.init(_dataDict: DataDict(
            data: [
              "__typename": SchemaAPI.Objects.MediaInfo.typename,
              "CurrentTimeSeconds": currentTimeSeconds,
              "DurationSeconds": durationSeconds,
              "Source": source._fieldData,
            ],
            fulfilledFragments: [
              ObjectIdentifier(GetRoomByKeyQuery.Data.GetRoomByKey.MediaInfo.self),
              ObjectIdentifier(MediaInfoAttrs.self),
              ObjectIdentifier(RoomAttrs.MediaInfo.self)
            ]
          ))
        }

        /// GetRoomByKey.MediaInfo.Source
        ///
        /// Parent Type: `Source`
        struct Source: SchemaAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { SchemaAPI.Objects.Source }

          var id: String { __data["Id"] }
          var cover: String { __data["Cover"] }
          var name: String { __data["Name"] }

          struct Fragments: FragmentContainer {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            var sourceAttrs: SourceAttrs { _toFragment() }
          }

          init(
            id: String,
            cover: String,
            name: String
          ) {
            self.init(_dataDict: DataDict(
              data: [
                "__typename": SchemaAPI.Objects.Source.typename,
                "Id": id,
                "Cover": cover,
                "Name": name,
              ],
              fulfilledFragments: [
                ObjectIdentifier(GetRoomByKeyQuery.Data.GetRoomByKey.MediaInfo.Source.self),
                ObjectIdentifier(SourceAttrs.self),
                ObjectIdentifier(MediaInfoAttrs.Source.self)
              ]
            ))
          }
        }
      }
    }
  }
}

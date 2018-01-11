/// Generated by the Protocol Buffers 3.4.0 compiler.  DO NOT EDIT!
/// Protobuf-swift version: 3.0.22
/// Source file "source_context.proto"
/// Syntax "Proto3"

import Foundation

public extension Google.Protobuf{}

public extension Google.Protobuf {
    public struct SourceContextRoot {
        public static let `default` = SourceContextRoot()
        public var extensionRegistry:ExtensionRegistry

        init() {
            extensionRegistry = ExtensionRegistry()
            registerAllExtensions(registry: extensionRegistry)
            Google.Protobuf.SwiftDescriptorRoot.default.registerAllExtensions(registry: extensionRegistry)
        }
        public func registerAllExtensions(registry: ExtensionRegistry) {
        }
    }

    /// `SourceContext` represents information about the source of a
    /// protobuf element, like the file in which it is defined.
    final public class SourceContext : GeneratedMessage {
        public typealias BuilderType = Google.Protobuf.SourceContext.Builder

        public static func == (lhs: Google.Protobuf.SourceContext, rhs: Google.Protobuf.SourceContext) -> Bool {
            if lhs === rhs {
                return true
            }
            var fieldCheck:Bool = (lhs.hashValue == rhs.hashValue)
            fieldCheck = fieldCheck && (lhs.hasFileName == rhs.hasFileName) && (!lhs.hasFileName || lhs.fileName == rhs.fileName)
            fieldCheck = (fieldCheck && (lhs.unknownFields == rhs.unknownFields))
            return fieldCheck
        }

        /// The path-qualified name of the .proto file that contained the associated
        /// protobuf element.  For example: `"google/protobuf/source.proto"`.
        public fileprivate(set) var fileName:String! = nil
        public fileprivate(set) var hasFileName:Bool = false

        required public init() {
            super.init()
        }
        override public func isInitialized() -> Bool {
            return true
        }
        override public func writeTo(codedOutputStream: CodedOutputStream) throws {
            if hasFileName {
                try codedOutputStream.writeString(fieldNumber: 1, value:fileName)
            }
            try unknownFields.writeTo(codedOutputStream: codedOutputStream)
        }
        override public func serializedSize() -> Int32 {
            var serialize_size:Int32 = memoizedSerializedSize
            if serialize_size != -1 {
             return serialize_size
            }

            serialize_size = 0
            if hasFileName {
                serialize_size += fileName.computeStringSize(fieldNumber: 1)
            }
            serialize_size += unknownFields.serializedSize()
            memoizedSerializedSize = serialize_size
            return serialize_size
        }
        public class func getBuilder() -> Google.Protobuf.SourceContext.Builder {
            return Google.Protobuf.SourceContext.classBuilder() as! Google.Protobuf.SourceContext.Builder
        }
        public func getBuilder() -> Google.Protobuf.SourceContext.Builder {
            return classBuilder() as! Google.Protobuf.SourceContext.Builder
        }
        override public class func classBuilder() -> ProtocolBuffersMessageBuilder {
            return Google.Protobuf.SourceContext.Builder()
        }
        override public func classBuilder() -> ProtocolBuffersMessageBuilder {
            return Google.Protobuf.SourceContext.Builder()
        }
        public func toBuilder() throws -> Google.Protobuf.SourceContext.Builder {
            return try Google.Protobuf.SourceContext.builderWithPrototype(prototype:self)
        }
        public class func builderWithPrototype(prototype:Google.Protobuf.SourceContext) throws -> Google.Protobuf.SourceContext.Builder {
            return try Google.Protobuf.SourceContext.Builder().mergeFrom(other:prototype)
        }
        override public func encode() throws -> Dictionary<String,Any> {
            guard isInitialized() else {
                throw ProtocolBuffersError.invalidProtocolBuffer("Uninitialized Message")
            }

            var jsonMap:Dictionary<String,Any> = Dictionary<String,Any>()
            if hasFileName {
                jsonMap["fileName"] = fileName
            }
            return jsonMap
        }
        override class public func decode(jsonMap:Dictionary<String,Any>) throws -> Google.Protobuf.SourceContext {
            return try Google.Protobuf.SourceContext.Builder.decodeToBuilder(jsonMap:jsonMap).build()
        }
        override class public func fromJSON(data:Data) throws -> Google.Protobuf.SourceContext {
            return try Google.Protobuf.SourceContext.Builder.fromJSONToBuilder(data:data).build()
        }
        override public func getDescription(indent:String) throws -> String {
            var output = ""
            if hasFileName {
                output += "\(indent) fileName: \(fileName) \n"
            }
            output += unknownFields.getDescription(indent: indent)
            return output
        }
        override public var hashValue:Int {
            get {
                var hashCode:Int = 7
                if hasFileName {
                    hashCode = (hashCode &* 31) &+ fileName.hashValue
                }
                hashCode = (hashCode &* 31) &+  unknownFields.hashValue
                return hashCode
            }
        }


        //Meta information declaration start

        override public class func className() -> String {
            return "Google.Protobuf.SourceContext"
        }
        override public func className() -> String {
            return "Google.Protobuf.SourceContext"
        }
        //Meta information declaration end

        final public class Builder : GeneratedMessageBuilder {
            fileprivate var builderResult:Google.Protobuf.SourceContext = Google.Protobuf.SourceContext()
            public func getMessage() -> Google.Protobuf.SourceContext {
                return builderResult
            }

            required override public init () {
                super.init()
            }
            /// The path-qualified name of the .proto file that contained the associated
            /// protobuf element.  For example: `"google/protobuf/source.proto"`.
            public var fileName:String {
                get {
                    return builderResult.fileName
                }
                set (value) {
                    builderResult.hasFileName = true
                    builderResult.fileName = value
                }
            }
            public var hasFileName:Bool {
                get {
                    return builderResult.hasFileName
                }
            }
            @discardableResult
            public func setFileName(_ value:String) -> Google.Protobuf.SourceContext.Builder {
                self.fileName = value
                return self
            }
            @discardableResult
            public func clearFileName() -> Google.Protobuf.SourceContext.Builder{
                builderResult.hasFileName = false
                builderResult.fileName = nil
                return self
            }
            override public var internalGetResult:GeneratedMessage {
                get {
                    return builderResult
                }
            }
            @discardableResult
            override public func clear() -> Google.Protobuf.SourceContext.Builder {
                builderResult = Google.Protobuf.SourceContext()
                return self
            }
            override public func clone() throws -> Google.Protobuf.SourceContext.Builder {
                return try Google.Protobuf.SourceContext.builderWithPrototype(prototype:builderResult)
            }
            override public func build() throws -> Google.Protobuf.SourceContext {
                try checkInitialized()
                return buildPartial()
            }
            public func buildPartial() -> Google.Protobuf.SourceContext {
                let returnMe:Google.Protobuf.SourceContext = builderResult
                return returnMe
            }
            @discardableResult
            public func mergeFrom(other:Google.Protobuf.SourceContext) throws -> Google.Protobuf.SourceContext.Builder {
                if other == Google.Protobuf.SourceContext() {
                    return self
                }
                if other.hasFileName {
                    fileName = other.fileName
                }
                try merge(unknownField: other.unknownFields)
                return self
            }
            @discardableResult
            override public func mergeFrom(codedInputStream: CodedInputStream) throws -> Google.Protobuf.SourceContext.Builder {
                return try mergeFrom(codedInputStream: codedInputStream, extensionRegistry:ExtensionRegistry())
            }
            @discardableResult
            override public func mergeFrom(codedInputStream: CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> Google.Protobuf.SourceContext.Builder {
                let unknownFieldsBuilder:UnknownFieldSet.Builder = try UnknownFieldSet.builderWithUnknownFields(copyFrom:self.unknownFields)
                while (true) {
                    let protobufTag = try codedInputStream.readTag()
                    switch protobufTag {
                    case 0: 
                        self.unknownFields = try unknownFieldsBuilder.build()
                        return self

                    case 10:
                        fileName = try codedInputStream.readString()

                    default:
                        if (!(try parse(codedInputStream:codedInputStream, unknownFields:unknownFieldsBuilder, extensionRegistry:extensionRegistry, tag:protobufTag))) {
                            unknownFields = try unknownFieldsBuilder.build()
                            return self
                        }
                    }
                }
            }
            class override public func decodeToBuilder(jsonMap:Dictionary<String,Any>) throws -> Google.Protobuf.SourceContext.Builder {
                let resultDecodedBuilder = Google.Protobuf.SourceContext.Builder()
                if let jsonValueFileName = jsonMap["fileName"] as? String {
                    resultDecodedBuilder.fileName = jsonValueFileName
                }
                return resultDecodedBuilder
            }
            override class public func fromJSONToBuilder(data:Data) throws -> Google.Protobuf.SourceContext.Builder {
                let jsonData = try JSONSerialization.jsonObject(with:data, options: JSONSerialization.ReadingOptions(rawValue: 0))
                guard let jsDataCast = jsonData as? Dictionary<String,Any> else {
                  throw ProtocolBuffersError.invalidProtocolBuffer("Invalid JSON data")
                }
                return try Google.Protobuf.SourceContext.Builder.decodeToBuilder(jsonMap:jsDataCast)
            }
        }

    }

}
extension Google.Protobuf.SourceContext: GeneratedMessageProtocol {
    public class func parseArrayDelimitedFrom(inputStream: InputStream) throws -> Array<Google.Protobuf.SourceContext> {
        var mergedArray = Array<Google.Protobuf.SourceContext>()
        while let value = try parseDelimitedFrom(inputStream: inputStream) {
          mergedArray.append(value)
        }
        return mergedArray
    }
    public class func parseDelimitedFrom(inputStream: InputStream) throws -> Google.Protobuf.SourceContext? {
        return try Google.Protobuf.SourceContext.Builder().mergeDelimitedFrom(inputStream: inputStream)?.build()
    }
    public class func parseFrom(data: Data) throws -> Google.Protobuf.SourceContext {
        return try Google.Protobuf.SourceContext.Builder().mergeFrom(data: data, extensionRegistry:Google.Protobuf.SourceContextRoot.default.extensionRegistry).build()
    }
    public class func parseFrom(data: Data, extensionRegistry:ExtensionRegistry) throws -> Google.Protobuf.SourceContext {
        return try Google.Protobuf.SourceContext.Builder().mergeFrom(data: data, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFrom(inputStream: InputStream) throws -> Google.Protobuf.SourceContext {
        return try Google.Protobuf.SourceContext.Builder().mergeFrom(inputStream: inputStream).build()
    }
    public class func parseFrom(inputStream: InputStream, extensionRegistry:ExtensionRegistry) throws -> Google.Protobuf.SourceContext {
        return try Google.Protobuf.SourceContext.Builder().mergeFrom(inputStream: inputStream, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFrom(codedInputStream: CodedInputStream) throws -> Google.Protobuf.SourceContext {
        return try Google.Protobuf.SourceContext.Builder().mergeFrom(codedInputStream: codedInputStream).build()
    }
    public class func parseFrom(codedInputStream: CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> Google.Protobuf.SourceContext {
        return try Google.Protobuf.SourceContext.Builder().mergeFrom(codedInputStream: codedInputStream, extensionRegistry:extensionRegistry).build()
    }
    public subscript(key: String) -> Any? {
        switch key {
        case "fileName": return self.fileName
        default: return nil
        }
    }
}
extension Google.Protobuf.SourceContext.Builder: GeneratedMessageBuilderProtocol {
    public typealias GeneratedMessageType = Google.Protobuf.SourceContext
    public subscript(key: String) -> Any? {
        get { 
            switch key {
            case "fileName": return self.fileName
            default: return nil
            }
        }
        set (newSubscriptValue) { 
            switch key {
            case "fileName":
                guard let newSubscriptValue = newSubscriptValue as? String else {
                    return
                }
                self.fileName = newSubscriptValue
            default: return
            }
        }
    }
}

// @@protoc_insertion_point(global_scope)

/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ChatRoom type in your schema. */
@immutable
class ChatRoom extends Model {
  static const classType = const _ChatRoomModelType();
  final String id;
  final String? _user1;
  final String? _user2;
  final List<Message>? _messages;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get user1 {
    try {
      return _user1!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get user2 {
    try {
      return _user2!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Message>? get messages {
    return _messages;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ChatRoom._internal({required this.id, required user1, required user2, messages, createdAt, updatedAt}): _user1 = user1, _user2 = user2, _messages = messages, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ChatRoom({String? id, required String user1, required String user2, List<Message>? messages}) {
    return ChatRoom._internal(
      id: id == null ? UUID.getUUID() : id,
      user1: user1,
      user2: user2,
      messages: messages != null ? List<Message>.unmodifiable(messages) : messages);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatRoom &&
      id == other.id &&
      _user1 == other._user1 &&
      _user2 == other._user2 &&
      DeepCollectionEquality().equals(_messages, other._messages);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ChatRoom {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("user1=" + "$_user1" + ", ");
    buffer.write("user2=" + "$_user2" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ChatRoom copyWith({String? id, String? user1, String? user2, List<Message>? messages}) {
    return ChatRoom._internal(
      id: id ?? this.id,
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      messages: messages ?? this.messages);
  }
  
  ChatRoom.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _user1 = json['user1'],
      _user2 = json['user2'],
      _messages = json['messages'] is List
        ? (json['messages'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Message.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'user1': _user1, 'user2': _user2, 'messages': _messages?.map((Message? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "chatRoom.id");
  static final QueryField USER1 = QueryField(fieldName: "user1");
  static final QueryField USER2 = QueryField(fieldName: "user2");
  static final QueryField MESSAGES = QueryField(
    fieldName: "messages",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Message).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ChatRoom";
    modelSchemaDefinition.pluralName = "ChatRooms";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ChatRoom.USER1,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ChatRoom.USER2,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: ChatRoom.MESSAGES,
      isRequired: false,
      ofModelName: (Message).toString(),
      associatedKey: Message.CHATROOM
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ChatRoomModelType extends ModelType<ChatRoom> {
  const _ChatRoomModelType();
  
  @override
  ChatRoom fromJson(Map<String, dynamic> jsonData) {
    return ChatRoom.fromJson(jsonData);
  }
}
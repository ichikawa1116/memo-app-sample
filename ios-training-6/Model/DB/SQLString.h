//
//  SQLString.h
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#ifndef SQLString_h
#define SQLString_h


#endif /* SQLString_h */

static NSString * const SQLCreate =@""
"CREATE TABLE IF NOT EXISTS t_memo ("
 "memo_id "
"INTEGER PRIMARY KEY AUTOINCREMENT,"
 "memo_title TEXT,"
 "memo_date DATE,"
 "memo_text TEXT"
");";

static NSString * const SQLSelect = @""
"SELECT "
 "* "
"FROM "
 "t_memo "
"ORDER BY "
 "memo_date "
"DESC;";

static NSString * const SQLInsert = @""
"INSERT INTO "
 "t_memo (memo_title, memo_date, memo_text) "
"VALUES "
 "(?,?,?);";

static NSString * const SQLUpdate = @""
"UPDATE "
 "t_memo "
"SET "
 "memo_title = ?, memo_date = ?, memo_text = ? "
"WHERE "
 "memo_id = ?;";

static NSString * const SQLDelete = @""
"DELETE FROM "
 "t_memo "
"WHERE "
 "memo_id = ?;";

static NSString * const SQLDeleteAll = @""
"DELETE FROM "
 "t_memo;";

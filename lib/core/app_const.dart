const kAppTile = 'memstuff';
const kAppDetailTitle = 'objeto emprestado';

const kDatabaseName = 'memstuff.db';
const kDatabaseVersion = 1;

const kStuffTableName = 'stuffs';
const kCreateTableStuffSql =
    'CREATE TABLE $kStuffTableName(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, contactName TEXT, date TEXT, photoPath TEXT, phone TEXT);';

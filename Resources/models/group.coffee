models.Group = new joli.model({
  table: 'group_',
  columns: {
    id: 'INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE',
    name: 'TEXT NOT NULL',
  }
})

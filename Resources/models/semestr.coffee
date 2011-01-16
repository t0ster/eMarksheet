models.Semestr = new joli.model({
  table: 'semestr',
  columns: {
    id: 'INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE',
    start_date: 'DATE NOT NULL',
    end_date: 'DATE NOT NULL',
    starts_from_first_week: 'BOOLEAN NOT NULL  DEFAULT "1"',
  }
})

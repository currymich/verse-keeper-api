# verse-keeper-api
Rails backend for verse-keeper

## ERD

- Book
   - Has one summary
   - Has many chapters
       - Has many verses
       
- User
   - Has many saved-verses
   - Has many notes
   
   
### Schemas   
```
Verse
  t.string "text"
  t.integer "chapter"
  t.integer "verse"
  t.integer "book_id"
```
   
```
User
  t.string "username"
  t.string "email"
  t.string "password_digest"
```

```
Notes 
   t.string "text"
   t.integer "verse_id"
   t.integer "user_id"
```

## Wireframes

#### [Homepage](https://wireframe.cc/Ij14Ul)
#### [Saved Verses](https://wireframe.cc/rVu4jn)

## Technology Used

#### Bible API: http://www.esvapi.org/
Example verse search: http://www.esvapi.org/v2/rest/passageQuery?key=IP&passage=Gen+11+11-15&include-headings=false


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
Book {
  name: String;
  chapters: [Integer],
  summary: String
}
```

```
Chapter {
  verses: [{
    text: String,
    number: Integer
  }]
}
```
   
```
User {
  username: String,
  email: String,
  password_digest: String
}
```

```
Notes {
   text: String,
   verse_id: Integer,
   user_id: Integer
}
```

## Wireframes

#### [Homepage](https://wireframe.cc/Ij14Ul)
#### [Saved Verses](https://wireframe.cc/rVu4jn)

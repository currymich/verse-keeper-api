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
  
}
```
  

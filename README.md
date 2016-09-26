# Rails Baseball API
*Estimated time: 4-5 hours*

### Goal
Create an API in a Rails app that tracks baseball scores for a team and players.

_Each level gets harder and builds on the previous code. Please don’t spend more than 5 hours._

#### Level 1
- Create an API in a Rails app. You can use [Rails::API](https://github.com/rails-api/rails-api), [Rails v5.0.0.rc1](https://github.com/rails/rails/tree/v5.0.0.rc1), [Grape-Ruby API](https://github.com/ruby-grape/grape), or roll your own.
- The app should have models for baseball players, their teams, games, and any other models you deem necessary to track scoring.

```
Made with Rails 5 --api
```

#### Level 2
- The API should be RESTful to GET, POST, PUT, and DELETE data for the models. A user of the API should also be able to:
  - Get top scoring players
  - Get a ranked list of teams
  - Get a list of games with their scores

```
For simplicity, simple run tracking was used to determine the top players/teams
```


#### Level 3
- The API should cache responses, keep response data accurate and up to date, and keep response times minimal (under 150ms).

```
I have added some low level caching code. At this point however, its kinda a premature optimization
```

#### Level 4
- The API should paginate results for any list of objects. For example, a user of the API should be able to get a list of players at a path like `/api/players`, passing in params `per_page` and `page`, and get results paginated in the response body and pagination metadata in the response headers.

```
paginated with kaminari, app controller has code to respond with correct headers
```

#### Level 5
- Each player should have a robust "player card". Players should have a photo and multiple videos associated with their profile.
- An API user should be able to "upload" photo and videos through the API for the player.

```
player#show for card
paperclip for attachments
```

**Report:**
- Where did you find difficulty in building a solution?
```Not ```
- Which parts were fun and inspirational to you?
```I enjoyed all parts, many standard rails things here...```
- If you had more time, what would you do next?
```
Write More tests for the attachments, caching, and pagination functions.
Write model tests for the buissness logic (validations... etc)
Dry up controllers regarding cache calls
Revisit the way Im modeling the score data.... this was a first shot... could probably find something a little more elegant
```

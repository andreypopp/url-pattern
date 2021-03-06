# url-pattern

[![Build Status](https://travis-ci.org/snd/url-pattern.png)](https://travis-ci.org/snd/url-pattern)

url-pattern matches urls with patterns and extracts named url segments

if you are looking for simple composable routing that builds on top of url-pattern - [check out passage](https://github.com/snd/passage)

### install

```
npm install url-pattern
```

**or**

put this line in the dependencies section of your `package.json`:

```
"url-pattern": "0.3.1"
```

then run:

```
npm install
```

### use

##### require

```javascript
var newUrlPattern = require('url-pattern');
```

##### make pattern from string

```javascript
var pattern = newUrlPattern('/users/:id');
```

##### make pattern from regex

```javascript
var regexPattern = newUrlPattern(/\/foo\/(.*)/);
```

##### match pattern against url

```javascript
pattern.match('/projects/5'); // => null
pattern.match('/users/5'); // => {id: '5'}
pattern.match('/users/foo'); // => {id: 'foo'}
```

match returns the extracted parameters or `null` if there was no match

##### match regex pattern against url

```javascript
regexPattern.match('/users/foo'); // => null
regexPattern.match('/foo/'); // => ['']
regexPattern.match('/foo/bar'); // => ['bar']
```

if the pattern was created from a regex an array of the captured groups is returned on match.

### pattern examples

`/users` will match exactly `/users`

`/projects/:projectId/supporters/:supporterId` will match any url where the first
segment is `projects`, the second segment is not empty, the third segment is
`supporters` and the fourth segment is not empty. the second and fourth segments will be bound
to `projectId` and `supporterId`

`/projects/*` will match any url which begins with `/projects/`

`*/projects` will match any url which ends with `/projects`

`/users/*/projects` will match any url which starts with `/users/` and ends with `/projects`

### license: MIT

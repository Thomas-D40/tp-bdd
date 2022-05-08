SELECT comments.contents, photos.url, users.username, photos.user_id as posterId, comments.user_id as commenterId FROM comments
JOIN users ON comments.user_id = users.id
JOIN photos ON comments.photo_id = photos.id;

SELECT comments.contents, photos.url, users.username, photos.user_id as posterId, comments.user_id as commenterId FROM comments
JOIN users ON comments.user_id = users.id
JOIN photos ON comments.photo_id = photos.id
WHERE users.id = photos.user_id = comments.user_id;

SELECT comments.contents, photos.url, users.username, photos.user_id as posterId, comments.user_id as commenterId FROM comments
JOIN users ON comments.user_id = users.id
JOIN photos ON comments.photo_id = photos.id
WHERE photos.user_id = comments.user_id;
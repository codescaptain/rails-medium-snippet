

# Medium Snippet API

The Medium Snippet API allows users to retrieve and display the latest 10 Medium articles for a given username. Users can add these articles to their GitHub profiles by providing the `username` and `index` parameters.

### NOTE: Only available for  Dark Mode. - ~~Right now The snippets are not responsive.~~ (I am working on it 🫡)


### Examples

[![My Medium story](https://medium-snippet-dc633c4f39a0.herokuapp.com/api/article.svg?username=@codescaptain&index=0)](#)

## Getting Started

### Installation
No installation is required. Simply use the following link to access the API:

### Usage
The gem finds articles from username with this links:

```html
https://medium-snippet-dc633c4f39a0.herokuapp.com
```

- username: your medium username/profile
- index : your recent article index. e.g: 0 means your latest article.

### Example Medium

#### Code:

```html
https://medium-snippet-dc633c4f39a0.herokuapp.com/api/article.svg?username=@codescaptain&index=1

https://medium-snippet-dc633c4f39a0.herokuapp.com/api/article.svg?username=@codescaptain&index=0
```
#### Output:
[![My Medium story](https://medium-snippet-dc633c4f39a0.herokuapp.com/api/article.svg?username=@codescaptain&index=1)](#)
[![My Medium story](https://medium-snippet-dc633c4f39a0.herokuapp.com/api/article.svg?username=@codescaptain&index=0)](#)



## Contact

For inquiries, you can reach out through my [GitHub Profile](https://github.com/codescaptain).

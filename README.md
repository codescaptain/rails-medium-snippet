

# Medium Snippet API

The Medium Snippet API allows users to retrieve and display the latest 10 **Medium** or **Dev.to** articles for a given username. Users can add these articles to their GitHub profiles by providing the `username` and `index` parameters.

### NOTE: Only available for  Dark Mode. (I am working on it 🫡)


### Examples

[![My Medium story](https://medium-snippet-dc633c4f39a0.herokuapp.com/api/article.svg?username=@codescaptain&index=0&source=medium)](#)
[![My Medium story](https://medium-snippet-dc633c4f39a0.herokuapp.com/api/article.svg?username=@codescaptain&index=0&source=dev_to)](#)

## Getting Started

### Installation
No installation is required. Simply use the following link to access the API:

### Usage
The API finds articles from username with this link:

```html
https://medium-snippet-dc633c4f39a0.herokuapp.com
```

- username: your **medium** or **dev.to** username/profile
- index: your recent article index. e.g.: 0 means your latest article.

### Example Medium

#### Code:

```html
https://medium-snippet-dc633c4f39a0.herokuapp.com/api/article.svg?username=@codescaptain&index=1&source=medium

https://medium-snippet-dc633c4f39a0.herokuapp.com/api/article.svg?username=@codescaptain&index=0&source=dev_to
```
#### Output:
[![My Medium story](https://medium-snippet-dc633c4f39a0.herokuapp.com/api/article.svg?username=@codescaptain&index=1)](#)
[![My Medium story](https://medium-snippet-dc633c4f39a0.herokuapp.com/api/article.svg?username=@codescaptain&index=0)](#)



## Contact

For inquiries, you can reach out through my [GitHub Profile](https://github.com/codescaptain).

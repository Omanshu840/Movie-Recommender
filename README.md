# Movie-Recommender

### Dataset 
[Facial Emotion Recognition (FER) 2013 Challenge Dataset](https://www.kaggle.com/msambare/fer2013) was used for this project. The data consists of 48x48 pixel grayscale images of faces. The faces have been automatically registered so that the face is more or less centred and occupies about the same amount of space in each image. The task is to categorize each face based on the emotion shown in the facial expression into one of seven categories (0=Angry, 1=Disgust, 2=Fear, 3=Happy, 4=Sad, 5=Surprise, 6=Neutral).


### Demo
[https://www.youtube.com/watch?v=n9FIgEeSloE&t=1s](https://www.youtube.com/watch?v=n9FIgEeSloE&t=1s)

## Install components
```bash
sudo apt-get update
sudo apt-get install python-pip 
```

### Setting up Virtual Environment and Install Requirements
- Install `virtualenv`
  ```bash
  sudo pip install virtualenv
  ```
- Create a Virtual Environment with Name `movie-recommender`
  ```bash
  python3 -m venv movie-recommender
  ```
- Activate the Environment
  ```bash
  source movie-recommender/bin/activate
  ```
- Execute the following command from root directory
  ```bash
  pip install -r requirements.txt
  ```

### Setting Up Database
- Create a database named `moviedb` from Terminal
  ```shell
  mysqladmin create moviedb
  ```
- Reload Database from `dump.sql`
  ```shell
  mysql moviedb < dump.sql
  ```
- Alternatively, it can be done through [`mysql CLI`](https://dev.mysql.com/doc/refman/8.0/en/reloading-sql-format-dumps.html)
 
 ### Running Website Locally
 - Run the following Command from Root
 ```shell
 python main.py
 ```

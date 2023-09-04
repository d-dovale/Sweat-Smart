<!-- ABOUT THE PROJECT -->
# Sweat Smart

## Introduction

* Hello there! I'm Daniel Dovale, one of the creators behind the mobile workout app, "Sweat Smart." Currently I am a third-year university student at the University of Florida majoring in Computer Science.

* Hey! I'm Jacob Hoppenstedt, co-creator of "Sweat Smart". I'm a second-year studying Computer Science at the University of Florida. 

We are on a mission to revolutionize the fitness world through AI by bringing you a personalized workout experience like no other. We're thrilled to share it with the public soon on the App Store and Play Store.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## About The Project

"Sweat Smart" is an innovative mobile workout app that leverages the power of ChatGPT's API to generate custom workout routines tailored just for you. We believe that every fitness journey is unique, so why settle for generic workouts found online when you can have personalized fitness guidance? Here's a glimpse of what Sweat Smart has to offer:

* **Personalization**: When you join Sweat Smart, we get to know you on a personal level. We gather information such as your name, age, gender, height, body weight, experience level, ideal physique, and how many days you want to work out on our information screen. With this data, we create workouts that align perfectly with your fitness goals and preferences.

* **Workout Generator**: Our advanced workout generator creates daily exercise routines that keep you motivated and challenged. Whether you're looking to build muscle, lose weight, or stay fit, Sweat Smart has you covered.

* **Home Screen**: Access the Workout of the Day (WOD) and valuable fitness tips right from the home screen. We're here to inspire and guide you every step of the way.

* **Calendar**: Stay on track with our workout calendar. We help you schedule your workouts and monitor your progress over time. Never miss a session again!

* **Settings**: Customize the app to your liking with our intuitive settings screen. Tailor your experience to match your unique fitness journey.



### Built With

* ![Dart]
* ![Flutter]

### Our Database

This app utilizes **Shared Preferences**, which serves as a lightweight and efficient way to store key-value pairs. This allows us to persist user preferences and settings seamlessly, eliminating the need to reconfigure settings each time they launch the app. 

```dart
   SharedPreferences prefs = await SharedPreferences.getInstance();
   ```
After initializing Shared Preferences, it can be used throughout the app to both store data:
```dart
   prefs!.setString('myString') ?? '',
   prefs!.setBool('myBool', true),
   //Any data type can be stored
   ```
and retrieve data:
```dart
   prefs!.getString('myString') ?? '',
   prefs!.getBool('myBool') ?? false,
   //Any data type can be retrieved
   ```
allowing for the user's information to be readily available, even after closing and restarting the app.
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started


### Prerequisites

Install Flutter

* https://docs.flutter.dev/get-started/install

### Installation

_Below is an example of how you can instruct your audience on installing and setting up your app. This template doesn't rely on any external dependencies or services._

1. Get a free ChatGPT API Key
* _Navigate to https://platform.openai.com, select your account in the top right, and press View API Keys. On the API keys tab, select Create new secret key and copy this key._
2. Clone the repo
   ```sh
   git clone https://github.com/d-dovale/Sweat-Smart.git
   ```
3. Install Flutter
   
   https://www.liquidweb.com/kb/how-to-install-and-configure-flutter-sdk-windows-10/

4. Create a file called `constants.dart` and enter your API key here in this format
   ```dart
   String BASE_URL = "https://api.openai.com/v1/chat";
   String API_KEY = "YOUR_API_KEY";
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage





_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Daniel Dovale - ddovale2004@gmail.com - (786) 603-7263

Jacob Hoppenstedt - jacobhoppenstedt@gmail.com - (727) 688-7566

Project Link: [https://github.com/d-dovale/Sweat-Smart](https://github.com/d-dovale/Sweat-Smart)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Img Shields](https://shields.io)
* [React Icons](https://react-icons.github.io/react-icons/search)
* [The Skinny Survivor](https://www.instagram.com/theskinnysurvivor/)
* [Bebas Neue Font](https://fonts.google.com/specimen/Bebas+Neue)
* [Lato Font](https://fonts.google.com/specimen/Lato)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png

[Dart]: https://img.shields.io/badge/Dart-B74093?style=for-the-badge&logo=dart&logoColor=white
[Flutter]: https://img.shields.io/badge/Flutter-0000FF?style=for-the-badge&logo=flutter&logoColor=white
[Pic]: https://prnt.sc/bwrutkYt-VzM

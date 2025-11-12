const Map<String, dynamic> portfolioData = {
  "name": "Akshay Patgar",
  "tagline": "Building the future with Flutter.",
  "careerObjective":
      "To leverage my Flutter expertise and 3 years of experience in building scalable, cross-platform mobile apps to contribute to impactful, high-quality software solutions.",
  "professionalSummary":
      "Results-driven Software Engineer with over 3 years of experience, focused on building cross-platform mobile applications using Flutter and Dart, with a strong command of Bloc, Provider and GetX architectures with best practices like exponential backoff, debouncing and throttling.", // Confirmed
  "contact": {
    "email": "a.k.patgar831@gmail.com",
    "phone": "+919620079788",
    "resume":
        "https://drive.google.com/file/d/13BvokJg8Ms2x1PWsiXA6hAWHHWsJdaAK/view?usp=drivesdk",
    "linkedin": "https://www.linkedin.com/in/akshay-patgar-321210253",
    "location": "Bangalore, Karnataka-560054",
    "dob": "24/02/1996",
  },
  "skills": {
    "languages": ["Flutter", "Dart", "Java"],
    "versionControl": ["Git", "GitHub"],
    "ide": ["Visual Studio Code", "IntelliJ IDEA"],
    "operatingSystems": ["Windows", "macOS", "Linux", "Android", "iOS"],
    "databases": ["Hive Database", "MySQL"],
    "api": ["Rest", "GraphQL", "MQTT", "WebSocket", "Subscription"],
    "stateManagement": ["GetX", "Provider", "BLOC", "MVC", "MVVM"],
    "tools": ["Android Studio", "Xcode"],
    "communication": ["MQTT", "WebSocket", "Subscription"],
  },
  "workExperience": [
    {
      "company": "Mobil80 Solutions and Services Pvt Ltd",
      "role": "Software Engineer (Flutter Developer)",
      "duration": "Aug 2022 – Present",
      "responsibilities": [
        "Built and maintained cross-platform mobile apps using Flutter, improving performance by 20% through improved UI and state management with Bloc.",
        "Incorporated Firebase and AWS Amplify for secure authentication and user management across platforms.",
        "Worked with RESTful and GraphQL APIs to enable efficient, real-time data handling in mobile apps.",
        "Implemented local storage and push notifications.",
        "Collaborated with senior developers and designers to integrate UI/UX designs and third-party libraries.",
      ],
    },
  ],
  "projects": [
    {
      "name": "Sportzlytics",
      "description":
          "A mobile app for improving your technique by sports video annotation",
      "details": [
        "Engineered a unique annotation feature in Flutter using CustomPaint, enabling users to draw and calculate angles on sports videos for enhanced analysis.",
        "Created a real-time one-on-one chat module with subscription for seamless, low-latency user communication.",
        "Integrated file upload functionality using Amplify Storage enabling seamless and secure file management.", // Added from resume
        "Implemented role-based access to ensure secure and personalized experience across the application.",
        "Implemented GetX for robust state management.",
        "Incorporated Shake Detector and Screenshot features for enhanced interactivity.",
      ],
      "links": [
        {
          "type": "Play Store",
          "url":
              "https://play.google.com/store/apps/details?id=com.sportzlytics.userapp",
        },
        {
          "type": "App Store",
          "url": "https://apps.apple.com/in/app/sportzlytics/id6740204880",
        },
      ],
    },
    {
      "name": "Cardiocognetics",
      "description":
          "Integration of Apple Watch heartbeat data into Flutter app",
      "details": [
        "Merged Apple Watch heartbeat data into a Flutter app using HealthKit and platform channels, enabling seamless communication with native iOS features.",
        "Built real-time heart rate monitoring features by receiving live data from Apple Watch sensors and displaying it in the Flutter UI.",
        "Implemented dynamic PDF generation in Flutter to allow users to export health data and analysis reports, supporting share and print functionality.",
        "Utilized Dart isolates to offload heavy computation and background processing, ensuring smooth UI performance and responsiveness.",
      ],
      "links": [],
    },
    {
      "name": "MyPrezence",
      "description":
          "A mobile app that tracks and verifies attendance in real time using GPS and facial recognition",
      "details": [
        "Migrated the application from native platforms to Flutter, consolidating iOS and Android codebases for faster development and easier maintenance.",
        "Applied Google ML Kit for real-time face scanning and recognition for profile picture approval.",
        "Built location-based attendance tracking using device GPS, ensuring accurate and tamper-proof check-ins.",
        "Added security checks to detect developer mode and prevent app usage on devices with mock location enabled.",
        "Architected the app using Bloc pattern for efficient state management, routing, and dependency injection.",
      ],
      "links": [
        {
          "type": "Play Store",
          "url":
              "https://play.google.com/store/apps/details?id=com.mobil80.prezencemember",
        },
        {
          "type": "App Store",
          "url": "https://apps.apple.com/in/app/myprezence/id1554453373",
        },
      ],
    },
    {
      "name": "Photoflix",
      "description": "Cross-platform Flutter app for Android mobile and TV",
      "details": [
        "Deployed a cross-platform Flutter app for both Android mobile and Android TV, tailoring UIs for touchscreens and remote control navigation.",
        "Customized platform-specific interfaces for mobile and TV.",
        "Leveraged MQTT protocol to enable real-time content broadcasting and notifications.",
        "Incorporated FL Chart in Flutter to visualize user statistics through interactive line, bar, and pie charts.",
      ],
      "links": [],
    },
  ],
  "education": [
    {
      "school": "M S Ramaiah Institute of Technology",
      "degree": "Bachelors of Engineering",
      "duration": "2014-2018",
      "cgpa": "8.55",
    },
    {
      "school": "Dr A V Baliga College of Arts and Science",
      "degree": "Pre University",
      "duration": "2012-2014",
      "percentage": "92",
    },
    {
      "school": "Konkan Education Trust Kumta",
      "degree": "Secondary School Leaving Certificate",
      "duration": "2019-2012",
    },
  ],
};

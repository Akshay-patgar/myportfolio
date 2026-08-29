const Map<String, dynamic> portfolioData = {
  "name": "Akshay Patgar",
  "title": "Software Developer",
  "tagline": "Building the future with Flutter.",
  "roles": [
    "Flutter Developer",
    "Software Engineer",
    "Cross-Platform Craftsman",
    "Offline-First Architect",
  ],
  "careerObjective":
      "To leverage my 4+ years of experience in building scalable, cross-platform mobile apps to contribute to impactful, high-quality software solutions.",
  "professionalSummary":
      "Results-driven Software Engineer with over 4 years of experience, focused on building cross-platform mobile applications using Flutter and Dart, with a strong command of Bloc, Provider and GetX architectures and best practices like exponential backoff, debouncing and throttling.",
  "contact": {
    "email": "a.k.patgar831@gmail.com",
    "phone": "+919620079788",
    "resume":
        "https://drive.google.com/file/d/1UN2LGi_lHYX8UKDOPq_vl6L622-efanK/view?usp=drive_link",
    "linkedin": "https://www.linkedin.com/in/akshay-patgar-321210253",
    "location": "Bangalore, Karnataka, India",
    "dob": "24/02/1996",
  },
  "skills": {
    "languages": ["Dart", "Java", "NestJS"],
    "flutter": ["Flutter", "Bloc", "Provider", "GetX", "MVC", "MVVM"],
    "apis_realtime": ["REST", "GraphQL", "MQTT", "WebSocket", "Subscriptions"],
    "backend_cloud": ["Firebase", "AWS Amplify", "HealthKit", "ML Kit"],
    "databases": ["Hive", "MySQL", "Dynamodb"],
    "tools_vcs": [
      "Git",
      "GitHub",
      "VS Code",
      "Android Studio",
      "Xcode",
      "IntelliJ IDEA",
    ],
    "platforms": ["Android", "iOS", "Android TV", "Windows", "macOS", "Linux"],
    "practices": [
      "Offline-first architecture",
      "Isolates & background sync",
      "Debouncing & throttling",
      "Exponential backoff",
    ],
  },
  "skillCategoryLabels": {
    "languages": "// languages",
    "flutter": "// flutter_stack",
    "apis_realtime": "// apis_&_realtime",
    "backend_cloud": "// backend_&_cloud",
    "databases": "// databases",
    "tools_vcs": "// tools_&_vcs",
    "platforms": "// platforms",
    "practices": "// best_practices",
  },
  "certifications": [
    {
      "name": "Java Programming for Complete Beginners",
      "platform": "Udemy",
      "url":
          "https://drive.google.com/file/d/14338ofLspMEtuRZbv46nJCwAi6wxNlVD/view?usp=sharing",
    },
  ],
  "workExperience": [
    {
      "company": "GeekyAnts India Pvt Ltd",
      "role": "Software Engineer (Flutter Developer)",
      "duration": "Feb 2026 – Present",
      "current": true,
      "color": "cyan",
      "highlights": [
        "Engineered a Form.io-powered dynamic form renderer supporting advanced input types with auto-calculation and cross-field calculations.",
        "Optimised application performance using isolates for background services, ValueNotifier to cut widget rebuilds, debouncing and keyed list items.",
        "Built an offline-first field inspection app using Hive and a queue-based background sync engine featuring timed triggers and retry logic — zero data loss for offline inspections in low-connectivity environments.",
        "Triaged and resolved production crashes via Firebase Crashlytics; migrated images from temp to persistent storage to prevent silent upload failures.",
      ],
    },
    {
      "company": "Mobil80 Solutions and Services Pvt Ltd",
      "role": "Software Engineer (Flutter Developer)",
      "duration": "Aug 2022 – Feb 2026",
      "current": false,
      "color": "violet",
      "highlights": [
        "Built and maintained cross-platform apps with Flutter, improving performance by 20% through UI and state management refinements with Bloc.",
        "Incorporated Firebase and AWS Amplify for secure authentication and user management across platforms.",
        "Worked with RESTful and GraphQL APIs to enable efficient, real-time data handling in mobile apps.",
        "Implemented local storage, push notifications and role-based access across client projects.",
      ],
    },
    {
      "company": "Brigade Enterprises Ltd",
      "role": "Engineer QC — Construction",
      "duration": "2018 – 2020",
      "current": false,
      "color": "amber",
      "highlights": [
        "Worked as Engineer QC in the Brigade Woods project, overseeing quality from foundation to structural completion of 333 apartments.",
        "Enforced structural quality standards and coordinated with site teams to keep construction on schedule.",
        "Led me toward software — transitioned into mobile development after this role.",
      ],
    },
  ],
  "projects": [
    {
      "name": "Sportzlytics",
      "description":
          "A mobile app for improving your technique through sports video annotation — draw, measure angles and analyse performance frame by frame.",
      "tech": [
        "Flutter",
        "GetX",
        "CustomPaint",
        "AWS Amplify",
        "Subscriptions",
      ],
      "details": [
        "Engineered a unique annotation feature using CustomPaint, letting users draw and calculate angles on sports videos.",
        "Built a real-time one-on-one chat module with subscriptions for seamless, low-latency communication.",
        "Integrated secure file uploads via Amplify Storage and role-based access control.",
        "Added shake detector and screenshot capture for enhanced interactivity.",
      ],
      "links": [],
    },
    {
      "name": "MyPrezence",
      "description":
          "Attendance tracking verified in real time using GPS and facial recognition — tamper-proof check-ins for modern workforces.",
      "tech": ["Flutter", "Bloc", "Google ML Kit", "GPS", "Platform Channels"],
      "details": [
        "Migrated the product from native iOS/Android to Flutter, consolidating codebases for faster development.",
        "Applied Google ML Kit for real-time face scanning and recognition for profile picture approval.",
        "Built location-based attendance tracking with GPS, ensuring accurate and tamper-proof check-ins.",
        "Hardened security with developer-mode detection and mock-location prevention.",
      ],
      "links": [],
    },
    {
      "name": "Cardiocognetics",
      "description":
          "Apple Watch heart-rate data streamed into a Flutter app with dynamic PDF health reports — real-time monitoring meets clinical reporting.",
      "tech": ["Flutter", "HealthKit", "Isolates", "PDF Generation", "iOS"],
      "details": [
        "Merged Apple Watch heartbeat data into Flutter using HealthKit and platform channels for native iOS communication.",
        "Displayed live heart-rate telemetry from Apple Watch sensors directly in the Flutter UI.",
        "Implemented dynamic PDF generation so users can export, share and print health reports.",
        "Offloaded heavy parsing to Dart isolates, keeping the UI perfectly smooth.",
      ],
      "links": [],
    },
    {
      "name": "Photoflix",
      "description":
          "A cross-platform Flutter experience running on both Android phones and Android TV — one codebase, two interaction models.",
      "tech": ["Flutter", "Android TV", "MQTT", "FL Chart"],
      "details": [
        "Deployed a single Flutter codebase to Android mobile and Android TV with tailored touch and D-pad navigation.",
        "Leveraged MQTT for real-time content broadcasting and notifications.",
        "Visualised user statistics with interactive line, bar and pie charts via FL Chart.",
      ],
      "links": [],
    },
  ],
  "education": [
    {
      "school": "M S Ramaiah Institute of Technology",
      "degree": "Bachelor of Engineering — Civil Engineering",
      "duration": "2014 – 2018",
      "score": "CGPA 8.55",
    },
    {
      "school": "Dr A V Baliga College of Arts and Science",
      "degree": "Pre University — PCMB",
      "duration": "2012 – 2014",
      "score": "92%",
    },
  ],
};

//Attendee
import 'package:nowingoogle/data/models/speaker_model.dart';
import 'package:nowingoogle/data/models/user_model.dart';
import 'package:nowingoogle/data/models/volunteer_model.dart';
import 'package:nowingoogle/domain/enums/social_platforms.dart';
import 'package:nowingoogle/domain/enums/user_roles.dart';

const attendeeState = UserModel(
    firstName: "Manas",
    lastName: "Malla",
    username: "manasmalla",
    avatar:
        "https://lh3.googleusercontent.com/a-/AD_cMMRCMJY__VrfIfVCEK97uQajGP0zqKaglxHWtOF0zw",
    career: "student",
    gender: "male",
    bio:
        "Life is too short and beautiful!\nKeep making miracles and let’s enjoy what life throws at us, the lows and the highs with the same enthusiastic spirit and a bright smile 😃 !",
    email: "me@manasmalla.dev",
    phone: "9059145216",
    organization: "GITAM University",
    place: "Visakhapatnam");

//Volunteer
const volunteerState = VolunteerModel(
  firstName: "Manas",
  lastName: "Malla",
  username: "manasmalla",
  avatar:
      "https://github.com/ManasMalla/WhatsApp/blob/main/app/src/main/res/drawable/manas_malla.png?raw=true",
  isPOC: true,
  career: "intern",
  gender: "male",
  handles: {SocialPlatform.instagram: "ManasMalla-Dev"},
  bio:
      "Life is too short and beautiful!\nKeep making miracles and let’s enjoy what life throws at us, the lows and the highs with the same enthusiastic spirit and a bright smile 😃 !",
  email: "manas@spotmies.com",
  phone: "9100162652",
  organization: "Spotmies LLP",
  place: "Visakhapatnam",
  teams: [
    "registration",
  ],
);
const umaPrathima = VolunteerModel(
  firstName: "Uma Prathima",
  lastName: "Tammana",
  username: "umaprathima",
  avatar:
      "https://media.licdn.com/dms/image/C5603AQEFZVniEKnE1A/profile-displayphoto-shrink_800_800/0/1635233448177?e=1702512000&v=beta&t=AfYbPF4lIUhBXfcG4f5KT_5oa0xvE_8si6AZPRjDccU",
  isPOC: true,
  career: "professional",
  gender: "female",
  handles: {SocialPlatform.linkedIn: "umaprathima"},
  bio:
      "Software Developer | MBA | Internshala Student Partner | GDG/WTM Vizag Core Volunteer",
  email: "manas@spotmies.com",
  phone: "9100162652",
  organization: "Prodigit",
  place: "Visakhapatnam",
  teams: [
    "icebreakers",
  ],
);

//Organizer
const organizerState = VolunteerModel(
  userRole: UserRole.organizer,
  firstName: "Aarogya",
  lastName: "Tatineni",
  username: "aarogyatatineni",
  avatar:
      "https://github.com/ManasMalla/WhatsApp/blob/main/app/src/main/res/drawable/mrs_manas_malla.png?raw=true",
  career: "doctor",
  gender: "female",
  handles: {
    SocialPlatform.twitter: "AarogyaTatineni",
  },
  bio:
      "May God protect us. Let’s all be content together as our content lies in our family, #VasudaivaKutumbam 🦚 🐚☀. Let’s try to help each other. Let our lives be full of divine energy. May we feel no enmity or jealousy towards others.\nLet there be peace. ✌️!✌️!",
  email: "me@aarogya.dev",
  phone: "9492939115",
  organization: "AUM College",
  place: "Visakhapatnam",
  teams: [],
  isPOC: true,
);

//Speaker
const speakerState = SpeakerModel(
    firstName: "Manas",
    lastName: "Malla",
    username: "manasmalla",
    avatar:
        "https://play-lh.googleusercontent.com/LTFNtvRVpXyvFW6NuWG453hxxv_kDrvMuf7BU-jr2fyM5Ylktsib3lxId__ragB-ydI4",
    career: "Camp Leader",
    gender: "male",
    handles: {
      SocialPlatform.linkedIn: "ManasMalla",
    },
    bio:
        "Composing experiences for everyone for a range of screens. Navigated via Layout Lakes, hiked the Performance Peaks, migrated across the Migration Meadows, while Testing trails and camped at Material Tents. Best of Stargazing at State!\nSee you on the Compose Trail!",
    talkTime: 30,
    talkTitle: "the all new, Android Studio: Bot",
    email: "speaker@manasmalla.dev",
    phone: "9059145216",
    organization: "GDG Vizag",
    place: "Visakhapatnam");
const ushaMaam = SpeakerModel(
    firstName: "Usha Ramani",
    lastName: "Vemuru",
    username: "vusharamani",
    avatar:
        "https://images.yourstory.com/cs/images/people/1598772609574-1634725257316.jpg",
    career: "Organizer",
    gender: "female",
    handles: {
      SocialPlatform.linkedIn: "vusharamani",
    },
    bio:
        "Co-Founder@GURUJADA | Helping online teachers create engaging courses | Guiding students and professionals with LearningPaths podcast | GDG/WTM ambassador | #Iamremarkable facilitator",
    talkTime: 30,
    talkTitle: "Leveraging Communities",
    email: "usha@gurujada.com",
    phone: "1234567890",
    organization: "GDG Vizag",
    place: "Visakhapatnam");
const gurumoorthy = SpeakerModel(
    firstName: "Cdr. Gurumoorthy",
    lastName: "Gangadharan",
    username: "cdr.gurumoorthy",
    avatar:
        "https://cdn.theorg.com/4f111565-cc61-4eb6-93f8-3aabe6817453_medium.jpg",
    career: "Associate Dean",
    gender: "male",
    handles: {
      SocialPlatform.linkedIn: "gurumoorthygangadharan",
    },
    bio:
        "Associate Dean - Career Services & External Relations; Head – GCGC, GITAM University | Empowering students shape their future",
    talkTime: 10,
    talkTitle: "Welcome to GITAM",
    email: "ggangad@gitam.edu",
    phone: "1234567890",
    organization: "CGC, GITAM",
    place: "Visakhapatnam");
const krishna = SpeakerModel(
    firstName: "Krishna Mohan",
    lastName: "Chivukula",
    username: "cvkmohan",
    avatar:
        "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_200,q_auto:good,w_200/v1/gcs/platform-data-goog/events/IMG_20220208_130837.jpeg",
    career: "CTO",
    gender: "male",
    handles: {
      SocialPlatform.twitter: "cvkmohan",
    },
    bio: "Elixir Programmer. India. Telugu",
    talkTime: 30,
    talkTitle: "Machine Learning Demystified",
    email: "cvkmohan@gurujada.com",
    phone: "1234567890",
    organization: "Gurujada",
    place: "Visakhapatnam");
var userStates = [attendeeState, volunteerState, organizerState, speakerState];

/// login page
const txtBack = "Back";
const txtLogin = "Login";
const hintUserName = "Enter Username/Email";
const hintPassword = "Enter Password";
const txtNoAccount = "No account? ";
const txtRegisterHere = "Register here";

/// register page
const txtRegister = "Register";
const txtHaveAnAccount = "Have an account? ";
const txtLoginHere = "Login here";
const hintEmail = "Enter Email";
const hintCreateUserName = "Create Username";
const hintCreatePassword = "Create Password";
const hintConfirmPassword = "Confirm Password";

/// profile
const txtAbout = "About";
const txtAboutDescription = "Add in your your to help others know you better";
const txtInterest = "Interest";
const txtInterestDescription = "Add in your interest to find a better match";
const txtSaveAndUpdate = "Save & Update";
const txtAddImage = "Add Image";
const txtDisplayName = "Display name:";
const hintTxtDisplayName = "Enter name";
const txtGender = "Gender:";
const hintTxtGender = "Select Gender";
const txtBirthday = "Birthday:";
const hintTxtBirthday = "DD MM YYYY";
const txtHoroscope = "Horoscope:";
const hintTxtHoroscope = "--";
const txtZodiac = "Zodiac:";
const hintTxtZodiac = "--";
const txtHeight = "Height:";
const hintTxtHeight = "Add height";
const txtWeight = "Weight:";
const hintTxtWeight = "Add weight";

/// interest page
const txtSave = "Save";
const txtTellAboutYourself = "Tell everyone about yourself";
const txtWhatInterest = "What interest you?";
const hintTxtWhatInterest = "Enter your interest";

/// horoscope sign
final List<Map<String, dynamic>> chineseZodiacDates = [
  {
    'start': DateTime(2023, 1, 22),
    'end': DateTime(2024, 2, 9),
    'sign': 'Rabbit'
  },
  {
    'start': DateTime(2022, 2, 1),
    'end': DateTime(2023, 1, 21),
    'sign': 'Tiger'
  },
  {'start': DateTime(2021, 2, 12), 'end': DateTime(2022, 1, 31), 'sign': 'Ox'},
  {'start': DateTime(2020, 1, 25), 'end': DateTime(2021, 2, 11), 'sign': 'Rat'},
  {'start': DateTime(2019, 2, 5), 'end': DateTime(2020, 1, 24), 'sign': 'Pig'},
  {'start': DateTime(2018, 2, 16), 'end': DateTime(2019, 2, 4), 'sign': 'Dog'},
  {
    'start': DateTime(2017, 1, 28),
    'end': DateTime(2018, 2, 15),
    'sign': 'Rooster'
  },
  {
    'start': DateTime(2016, 2, 8),
    'end': DateTime(2017, 1, 27),
    'sign': 'Monkey'
  },
  {'start': DateTime(2015, 2, 19), 'end': DateTime(2016, 2, 7), 'sign': 'Goat'},
  {
    'start': DateTime(2014, 1, 31),
    'end': DateTime(2015, 2, 18),
    'sign': 'Horse'
  },
  {
    'start': DateTime(2013, 2, 10),
    'end': DateTime(2014, 1, 30),
    'sign': 'Snake'
  },
  {
    'start': DateTime(2012, 1, 23),
    'end': DateTime(2013, 2, 9),
    'sign': 'Dragon'
  },
  {
    'start': DateTime(2011, 2, 3),
    'end': DateTime(2012, 1, 22),
    'sign': 'Rabbit'
  },
  {
    'start': DateTime(2010, 2, 14),
    'end': DateTime(2011, 2, 2),
    'sign': 'Tiger'
  },
  {'start': DateTime(2009, 1, 26), 'end': DateTime(2010, 2, 13), 'sign': 'Ox'},
  {'start': DateTime(2008, 2, 7), 'end': DateTime(2009, 1, 25), 'sign': 'Rat'},
  {'start': DateTime(2007, 2, 18), 'end': DateTime(2008, 2, 6), 'sign': 'Boar'},
  {'start': DateTime(2006, 1, 29), 'end': DateTime(2007, 2, 17), 'sign': 'Dog'},
  {
    'start': DateTime(2005, 2, 9),
    'end': DateTime(2006, 1, 28),
    'sign': 'Rooster'
  },
  {
    'start': DateTime(2004, 1, 22),
    'end': DateTime(2005, 2, 8),
    'sign': 'Monkey'
  },
  {'start': DateTime(2003, 2, 1), 'end': DateTime(2004, 1, 21), 'sign': 'Goat'},
  {
    'start': DateTime(2002, 2, 12),
    'end': DateTime(2003, 1, 31),
    'sign': 'Horse'
  },
  {
    'start': DateTime(2001, 1, 24),
    'end': DateTime(2002, 2, 11),
    'sign': 'Snake'
  },
  {
    'start': DateTime(2000, 2, 5),
    'end': DateTime(2001, 1, 23),
    'sign': 'Dragon'
  },
  {
    'start': DateTime(1999, 2, 16),
    'end': DateTime(2000, 2, 4),
    'sign': 'Rabbit'
  },
  {
    'start': DateTime(1998, 1, 28),
    'end': DateTime(1999, 2, 15),
    'sign': 'Tiger'
  },
  {'start': DateTime(1997, 2, 7), 'end': DateTime(1998, 1, 27), 'sign': 'Ox'},
  {'start': DateTime(1996, 2, 19), 'end': DateTime(1997, 2, 6), 'sign': 'Rat'},
  {
    'start': DateTime(1995, 1, 31),
    'end': DateTime(1996, 2, 18),
    'sign': 'Boar'
  },
  {'start': DateTime(1994, 2, 10), 'end': DateTime(1995, 1, 30), 'sign': 'Dog'},
  {
    'start': DateTime(1993, 1, 23),
    'end': DateTime(1994, 2, 9),
    'sign': 'Rooster'
  },
  {
    'start': DateTime(1992, 2, 4),
    'end': DateTime(1993, 1, 22),
    'sign': 'Monkey'
  },
  {'start': DateTime(1991, 2, 15), 'end': DateTime(1992, 2, 3), 'sign': 'Goat'},
  {
    'start': DateTime(1990, 1, 27),
    'end': DateTime(1991, 2, 14),
    'sign': 'Horse'
  },
  {
    'start': DateTime(1989, 2, 6),
    'end': DateTime(1990, 1, 26),
    'sign': 'Snake'
  },
  {
    'start': DateTime(1988, 2, 17),
    'end': DateTime(1989, 2, 5),
    'sign': 'Dragon'
  },
  {
    'start': DateTime(1987, 1, 29),
    'end': DateTime(1988, 2, 16),
    'sign': 'Rabbit'
  },
  {
    'start': DateTime(1986, 2, 9),
    'end': DateTime(1987, 1, 28),
    'sign': 'Tiger'
  },
  {'start': DateTime(1985, 2, 20), 'end': DateTime(1986, 2, 8), 'sign': 'Ox'},
  {'start': DateTime(1984, 2, 2), 'end': DateTime(1985, 2, 19), 'sign': 'Rat'},
  {'start': DateTime(1983, 2, 13), 'end': DateTime(1984, 2, 1), 'sign': 'Boar'},
  {'start': DateTime(1982, 1, 25), 'end': DateTime(1983, 2, 12), 'sign': 'Dog'},
  {
    'start': DateTime(1981, 2, 5),
    'end': DateTime(1982, 1, 24),
    'sign': 'Rooster'
  },
  {
    'start': DateTime(1980, 2, 16),
    'end': DateTime(1981, 2, 4),
    'sign': 'Monkey'
  },
  {
    'start': DateTime(1979, 1, 28),
    'end': DateTime(1980, 2, 15),
    'sign': 'Goat'
  },
  {
    'start': DateTime(1978, 2, 7),
    'end': DateTime(1979, 1, 27),
    'sign': 'Horse'
  },
  {
    'start': DateTime(1977, 2, 18),
    'end': DateTime(1978, 2, 6),
    'sign': 'Snake'
  },
  {
    'start': DateTime(1976, 1, 31),
    'end': DateTime(1977, 2, 17),
    'sign': 'Dragon'
  },
  {
    'start': DateTime(1975, 2, 11),
    'end': DateTime(1976, 1, 30),
    'sign': 'Rabbit'
  },
  {
    'start': DateTime(1974, 1, 23),
    'end': DateTime(1975, 2, 10),
    'sign': 'Tiger'
  },
  {'start': DateTime(1973, 2, 3), 'end': DateTime(1974, 1, 22), 'sign': 'Ox'},
  {'start': DateTime(1972, 1, 16), 'end': DateTime(1973, 2, 2), 'sign': 'Rat'},
  {
    'start': DateTime(1971, 1, 27),
    'end': DateTime(1972, 1, 15),
    'sign': 'Boar'
  },
  {'start': DateTime(1970, 2, 6), 'end': DateTime(1971, 1, 26), 'sign': 'Dog'},
  {
    'start': DateTime(1969, 2, 17),
    'end': DateTime(1970, 2, 5),
    'sign': 'Rooster'
  },
  {
    'start': DateTime(1968, 1, 30),
    'end': DateTime(1969, 2, 16),
    'sign': 'Monkey'
  },
  {'start': DateTime(1967, 2, 9), 'end': DateTime(1968, 1, 29), 'sign': 'Goat'},
  {
    'start': DateTime(1966, 1, 21),
    'end': DateTime(1967, 2, 8),
    'sign': 'Horse'
  },
  {
    'start': DateTime(1965, 2, 2),
    'end': DateTime(1966, 1, 20),
    'sign': 'Snake'
  },
  {
    'start': DateTime(1964, 2, 13),
    'end': DateTime(1965, 2, 1),
    'sign': 'Dragon'
  },
  {
    'start': DateTime(1963, 1, 25),
    'end': DateTime(1964, 2, 12),
    'sign': 'Rabbit'
  },
  {
    'start': DateTime(1962, 2, 5),
    'end': DateTime(1963, 1, 24),
    'sign': 'Tiger'
  },
  {'start': DateTime(1961, 2, 15), 'end': DateTime(1962, 2, 4), 'sign': 'Ox'},
  {'start': DateTime(1960, 1, 28), 'end': DateTime(1961, 2, 14), 'sign': 'Rat'},
  {'start': DateTime(1959, 2, 8), 'end': DateTime(1960, 1, 27), 'sign': 'Boar'},
  {'start': DateTime(1958, 2, 18), 'end': DateTime(1959, 2, 7), 'sign': 'Dog'},
  {
    'start': DateTime(1957, 1, 31),
    'end': DateTime(1958, 2, 17),
    'sign': 'Rooster'
  },
  {
    'start': DateTime(1956, 2, 12),
    'end': DateTime(1957, 1, 30),
    'sign': 'Monkey'
  },
  {
    'start': DateTime(1955, 1, 24),
    'end': DateTime(1956, 2, 11),
    'sign': 'Goat'
  },
  {
    'start': DateTime(1954, 2, 3),
    'end': DateTime(1955, 1, 23),
    'sign': 'Horse'
  },
  {
    'start': DateTime(1953, 2, 14),
    'end': DateTime(1954, 2, 2),
    'sign': 'Snake'
  },
  {
    'start': DateTime(1952, 1, 27),
    'end': DateTime(1953, 2, 13),
    'sign': 'Dragon'
  },
  {
    'start': DateTime(1951, 2, 6),
    'end': DateTime(1952, 1, 26),
    'sign': 'Rabbit'
  },
  {
    'start': DateTime(1950, 2, 17),
    'end': DateTime(1951, 2, 5),
    'sign': 'Tiger'
  },
  {'start': DateTime(1949, 1, 29), 'end': DateTime(1950, 2, 16), 'sign': 'Ox'},
  {'start': DateTime(1948, 2, 10), 'end': DateTime(1949, 1, 28), 'sign': 'Rat'},
  {'start': DateTime(1947, 1, 22), 'end': DateTime(1948, 2, 9), 'sign': 'Boar'},
  {'start': DateTime(1946, 2, 2), 'end': DateTime(1947, 1, 21), 'sign': 'Dog'},
  {
    'start': DateTime(1945, 2, 13),
    'end': DateTime(1946, 2, 1),
    'sign': 'Rooster'
  },
  {
    'start': DateTime(1944, 1, 25),
    'end': DateTime(1945, 2, 12),
    'sign': 'Monkey'
  },
  {'start': DateTime(1943, 2, 5), 'end': DateTime(1944, 1, 24), 'sign': 'Goat'},
  {
    'start': DateTime(1942, 2, 15),
    'end': DateTime(1943, 2, 4),
    'sign': 'Horse'
  },
  {
    'start': DateTime(1941, 1, 27),
    'end': DateTime(1942, 2, 14),
    'sign': 'Snake'
  },
  {
    'start': DateTime(1940, 2, 8),
    'end': DateTime(1941, 1, 26),
    'sign': 'Dragon'
  },
  {
    'start': DateTime(1939, 2, 19),
    'end': DateTime(1940, 2, 7),
    'sign': 'Rabbit'
  },
  {
    'start': DateTime(1938, 1, 31),
    'end': DateTime(1939, 2, 18),
    'sign': 'Tiger'
  },
  {'start': DateTime(1937, 2, 11), 'end': DateTime(1938, 1, 30), 'sign': 'Ox'},
  {'start': DateTime(1936, 1, 24), 'end': DateTime(1937, 2, 10), 'sign': 'Rat'},
  {'start': DateTime(1935, 2, 4), 'end': DateTime(1936, 1, 23), 'sign': 'Boar'},
  {'start': DateTime(1934, 2, 14), 'end': DateTime(1935, 2, 3), 'sign': 'Dog'},
  {
    'start': DateTime(1933, 1, 26),
    'end': DateTime(1934, 2, 13),
    'sign': 'Rooster'
  },
  {
    'start': DateTime(1932, 2, 6),
    'end': DateTime(1933, 1, 25),
    'sign': 'Monkey'
  },
  {'start': DateTime(1931, 2, 17), 'end': DateTime(1932, 2, 5), 'sign': 'Goat'},
  {
    'start': DateTime(1930, 1, 30),
    'end': DateTime(1931, 2, 16),
    'sign': 'Horse'
  },
  {
    'start': DateTime(1929, 2, 10),
    'end': DateTime(1930, 1, 29),
    'sign': 'Snake'
  },
  {
    'start': DateTime(1928, 1, 23),
    'end': DateTime(1929, 2, 9),
    'sign': 'Dragon'
  },
  {
    'start': DateTime(1927, 2, 2),
    'end': DateTime(1928, 1, 22),
    'sign': 'Rabbit'
  },
  {
    'start': DateTime(1926, 2, 13),
    'end': DateTime(1927, 2, 1),
    'sign': 'Tiger'
  },
  {'start': DateTime(1925, 1, 25), 'end': DateTime(1926, 2, 12), 'sign': 'Ox'},
  {'start': DateTime(1924, 2, 5), 'end': DateTime(1925, 1, 24), 'sign': 'Rat'},
  {'start': DateTime(1923, 2, 16), 'end': DateTime(1924, 2, 4), 'sign': 'Boar'},
  {'start': DateTime(1922, 1, 28), 'end': DateTime(1923, 2, 15), 'sign': 'Dog'},
  {
    'start': DateTime(1921, 2, 8),
    'end': DateTime(1922, 1, 27),
    'sign': 'Rooster'
  },
  {
    'start': DateTime(1920, 2, 20),
    'end': DateTime(1921, 2, 7),
    'sign': 'Monkey'
  },
  {'start': DateTime(1919, 2, 1), 'end': DateTime(1920, 2, 19), 'sign': 'Goat'},
  {
    'start': DateTime(1918, 2, 11),
    'end': DateTime(1919, 1, 31),
    'sign': 'Horse'
  },
  {
    'start': DateTime(1917, 1, 23),
    'end': DateTime(1918, 2, 10),
    'sign': 'Snake'
  },
  {
    'start': DateTime(1916, 2, 3),
    'end': DateTime(1917, 1, 22),
    'sign': 'Dragon'
  },
  {
    'start': DateTime(1915, 2, 14),
    'end': DateTime(1916, 2, 2),
    'sign': 'Rabbit'
  },
  {
    'start': DateTime(1914, 1, 26),
    'end': DateTime(1915, 2, 13),
    'sign': 'Tiger'
  },
  {'start': DateTime(1913, 2, 6), 'end': DateTime(1914, 1, 25), 'sign': 'Ox'},
  {'start': DateTime(1912, 2, 18), 'end': DateTime(1913, 2, 5), 'sign': 'Rat'}
];

/// keys for widget identifier
const keyLoginButton = "key_login_button";
const keyUserName = "key_username_text_field";
const keyPassword = "key_password_text_field";
const keyHomePage = "key_home_page";

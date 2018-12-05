require 'yaml'

books = [{
    "author": [{"author": "Michael Crichton"}, {"author": "Richard Preston"}],
    "link": "https://en.wikipedia.org/wiki/Micro_(novel)\n",
    "pages": 560,
    "title": "Micro: A Novel",
    "publication_year": 212
  },
  {
      "author": [{"author": "Douglas Preston"}, {"author": "Lincoln Child"}],
      "link": "https://en.wikipedia.org/wiki/Riptide_(novel)\n",
      "pages": 496,
      "title": "Riptide",
      "publication_year": 1999
    },
  {
    "author": "Chinua Achebe",
    "link": "https://en.wikipedia.org/wiki/Things_Fall_Apart\n",
    "pages": 209,
    "title": "Things Fall Apart",
    "publication_year": 1958
  },
  {
    "author": "Hans Christian Andersen",
    "link": "https://en.wikipedia.org/wiki/Fairy_Tales_Told_for_Children._First_Collection.\n",
    "pages": 784,
    "title": "Fairy tales",
    "publication_year": 1836
  },
  {
    "author": "Dante Alighieri",
    "link": "https://en.wikipedia.org/wiki/Divine_Comedy\n",
    "pages": 928,
    "title": "The Divine Comedy",
    "publication_year": 1315
  },
  {
    "author": "Unknown",
    "link": "https://en.wikipedia.org/wiki/One_Thousand_and_One_Nights\n",
    "pages": 288,
    "title": "One Thousand and One Nights",
    "publication_year": 1200
  },
  {
    "author": "Unknown",
    "link": "https://en.wikipedia.org/wiki/Nj%C3%A1ls_saga\n",
    "pages": 384,
    "title": "Nj\u00e1l's Saga",
    "publication_year": 1350
  },
  {
    "author": "Jane Austen",
    "link": "https://en.wikipedia.org/wiki/Pride_and_Prejudice\n",
    "pages": 226,
    "title": "Pride and Prejudice",
    "publication_year": 1813
  },
  {
    "author": "Honor\u00e9 de Balzac",
    "link": "https://en.wikipedia.org/wiki/Le_P%C3%A8re_Goriot\n",
    "pages": 443,
    "title": "Le P\u00e8re Goriot",
    "publication_year": 1835
  },
  {
    "author": "Samuel Beckett",
    "link": "https://en.wikipedia.org/wiki/Molloy_(novel)\n",
    "pages": 256,
    "title": "Molloy, Malone Dies, The Unnamable, the trilogy",
    "publication_year": 1952
  },
  {
    "author": "Giovanni Boccaccio",
    "link": "https://en.wikipedia.org/wiki/The_Decameron\n",
    "pages": 1024,
    "title": "The Decameron",
    "publication_year": 1351
  },
  {
    "author": "Jorge Luis Borges",
    "link": "https://en.wikipedia.org/wiki/Ficciones\n",
    "pages": 224,
    "title": "Ficciones",
    "publication_year": 1965
  },
  {
    "author": "Emily Bront\u00eb",
    "link": "https://en.wikipedia.org/wiki/Wuthering_Heights\n",
    "pages": 342,
    "title": "Wuthering Heights",
    "publication_year": 1847
  },
  {
    "author": "Albert Camus",
    "link": "https://en.wikipedia.org/wiki/The_Stranger_(novel)\n",
    "pages": 185,
    "title": "The Stranger",
    "publication_year": 1942
  },
  {
    "author": "Paul Celan",
    "link": "\n",
    "pages": 320,
    "title": "Poems by Paul Celan",
    "publication_year": 1952
  },
  {
    "author": "Louis-Ferdinand C\u00e9line",
    "link": "https://en.wikipedia.org/wiki/Journey_to_the_End_of_the_Night\n",
    "pages": 505,
    "title": "Journey to the End of the Night",
    "publication_year": 1932
  },
  {
    "author": "Miguel de Cervantes",
    "link": "https://en.wikipedia.org/wiki/Don_Quixote\n",
    "pages": 1056,
    "title": "Don Quijote De La Mancha",
    "publication_year": 1610
  },
  {
    "author": "Geoffrey Chaucer",
    "link": "https://en.wikipedia.org/wiki/The_Canterbury_Tales\n",
    "pages": 544,
    "title": "The Canterbury Tales",
    "publication_year": 1450
  },
  {
    "author": "Anton Chekhov",
    "link": "https://en.wikipedia.org/wiki/List_of_short_stories_by_Anton_Chekhov\n",
    "pages": 194,
    "title": "Stories by Anton Chekhov",
    "publication_year": 1886
  },
  {
    "author": "Joseph Conrad",
    "link": "https://en.wikipedia.org/wiki/Nostromo\n",
    "pages": 320,
    "title": "Nostromo",
    "publication_year": 1904
  },
  {
    "author": "Charles Dickens",
    "link": "https://en.wikipedia.org/wiki/Great_Expectations\n",
    "pages": 194,
    "title": "Great Expectations",
    "publication_year": 1861
  },
  {
    "author": "Denis Diderot",
    "link": "https://en.wikipedia.org/wiki/Jacques_the_Fatalist\n",
    "pages": 596,
    "title": "Jacques the Fatalist",
    "publication_year": 1796
  },
  {
    "author": "Alfred D\u00f6blin",
    "link": "https://en.wikipedia.org/wiki/Berlin_Alexanderplatz\n",
    "pages": 600,
    "title": "Berlin Alexanderplatz",
    "publication_year": 1929
  },
  {
    "author": "Fyodor Dostoevsky",
    "link": "https://en.wikipedia.org/wiki/Crime_and_Punishment\n",
    "pages": 551,
    "title": "Crime and Punishment",
    "publication_year": 1866
  },
  {
    "author": "Fyodor Dostoevsky",
    "link": "https://en.wikipedia.org/wiki/The_Idiot\n",
    "pages": 656,
    "title": "The Idiot",
    "publication_year": 1869
  },
  {
    "author": "Fyodor Dostoevsky",
    "link": "https://en.wikipedia.org/wiki/Demons_(Dostoyevsky_novel)\n",
    "pages": 768,
    "title": "The Possessed",
    "publication_year": 1872
  },
  {
    "author": "Fyodor Dostoevsky",
    "link": "https://en.wikipedia.org/wiki/The_Brothers_Karamazov\n",
    "pages": 824,
    "title": "The Brothers Karamazov",
    "publication_year": 1880
  },
  {
    "author": "George Eliot",
    "link": "https://en.wikipedia.org/wiki/Middlemarch\n",
    "pages": 800,
    "title": "Middlemarch",
    "publication_year": 1871
  },
  {
    "author": "Ralph Ellison",
    "link": "https://en.wikipedia.org/wiki/Invisible_Man\n",
    "pages": 581,
    "title": "Invisible Man",
    "publication_year": 1952
  },
  {
    "author": "William Faulkner",
    "link": "https://en.wikipedia.org/wiki/Absalom,_Absalom!\n",
    "pages": 313,
    "title": "Absalom, Absalom!",
    "publication_year": 1936
  },
  {
    "author": "William Faulkner",
    "link": "https://en.wikipedia.org/wiki/The_Sound_and_the_Fury\n",
    "pages": 326,
    "title": "The Sound and the Fury",
    "publication_year": 1929
  },
  {
    "author": "Gustave Flaubert",
    "link": "https://en.wikipedia.org/wiki/Madame_Bovary\n",
    "pages": 528,
    "title": "Madame Bovary",
    "publication_year": 1857
  },
  {
    "author": "Gustave Flaubert",
    "link": "https://en.wikipedia.org/wiki/Sentimental_Education\n",
    "pages": 606,
    "title": "Sentimental Education",
    "publication_year": 1869
  },
  {
    "author": "Federico Garc\u00eda Lorca",
    "link": "https://en.wikipedia.org/wiki/Gypsy_Ballads\n",
    "pages": 218,
    "title": "Gypsy Ballads",
    "publication_year": 1928
  },
  {
    "author": "Gabriel Garc\u00eda M\u00e1rquez",
    "link": "https://en.wikipedia.org/wiki/One_Hundred_Years_of_Solitude\n",
    "pages": 417,
    "title": "One Hundred Years of Solitude",
    "publication_year": 1967
  },
  {
    "author": "Gabriel Garc\u00eda M\u00e1rquez",
    "link": "https://en.wikipedia.org/wiki/Love_in_the_Time_of_Cholera\n",
    "pages": 368,
    "title": "Love in the Time of Cholera",
    "publication_year": 1985
  },
  {
    "author": "Johann Wolfgang von Goethe",
    "link": "https://en.wikipedia.org/wiki/Goethe%27s_Faust\n",
    "pages": 158,
    "title": "Faust",
    "publication_year": 1832
  },
  {
    "author": "Nikolai Gogol",
    "link": "https://en.wikipedia.org/wiki/Dead_Souls\n",
    "pages": 432,
    "title": "Dead Souls",
    "publication_year": 1842
  },
  {
    "author": "G\u00fcnter Grass",
    "link": "https://en.wikipedia.org/wiki/The_Tin_Drum\n",
    "pages": 600,
    "title": "The Tin Drum",
    "publication_year": 1959
  },
  {
    "author": "Jo\u00e3o Guimar\u00e3es Rosa",
    "link": "https://en.wikipedia.org/wiki/The_Devil_to_Pay_in_the_Backlands\n",
    "pages": 494,
    "title": "The Devil to Pay in the Backlands",
    "publication_year": 1956
  },
  {
    "author": "Knut Hamsun",
    "link": "https://en.wikipedia.org/wiki/Hunger_(Hamsun_novel)\n",
    "pages": 176,
    "title": "Hunger",
    "publication_year": 1890
  },
  {
    "author": "Ernest Hemingway",
    "link": "https://en.wikipedia.org/wiki/The_Old_Man_and_the_Sea\n",
    "pages": 128,
    "title": "The Old Man and the Sea",
    "publication_year": 1952
  },
  {
    "author": "Henrik Ibsen",
    "link": "https://en.wikipedia.org/wiki/A_Doll%27s_House\n",
    "pages": 68,
    "title": "A Doll's House",
    "publication_year": 1879
  },
  {
    "author": "James Joyce",
    "link": "https://en.wikipedia.org/wiki/Ulysses_(novel)\n",
    "pages": 228,
    "title": "Ulysses",
    "publication_year": 1922
  },
  {
    "author": "Franz Kafka",
    "link": "https://en.wikipedia.org/wiki/Franz_Kafka_bibliography#Short_stories\n",
    "pages": 488,
    "title": "Stories by Franz Kafka",
    "publication_year": 1924
  },
  {
    "author": "Franz Kafka",
    "link": "https://en.wikipedia.org/wiki/The_Trial\n",
    "pages": 160,
    "title": "The Trial",
    "publication_year": 1925
  },
  {
    "author": "Franz Kafka",
    "link": "https://en.wikipedia.org/wiki/The_Castle_(novel)\n",
    "pages": 352,
    "title": "The Castle",
    "publication_year": 1926
  },
  {
    "author": "K\u0101lid\u0101sa",
    "link": "https://en.wikipedia.org/wiki/Abhij%C3%B1%C4%81na%C5%9B%C4%81kuntalam\n",
    "pages": 147,
    "title": "The recognition of Shakuntala",
    "publication_year": 150
  },
  {
    "author": "Yasunari Kawabata",
    "link": "https://en.wikipedia.org/wiki/The_Sound_of_the_Mountain\n",
    "pages": 288,
    "title": "The Sound of the Mountain",
    "publication_year": 1954
  },
  {
    "author": "Nikos Kazantzakis",
    "link": "https://en.wikipedia.org/wiki/Zorba_the_Greek\n",
    "pages": 368,
    "title": "Zorba the Greek",
    "publication_year": 1946
  },
  {
    "author": "D. H. Lawrence",
    "link": "https://en.wikipedia.org/wiki/Sons_and_Lovers\n",
    "pages": 432,
    "title": "Sons and Lovers",
    "publication_year": 1913
  },
  {
    "author": "Halld\u00f3r Laxness",
    "link": "https://en.wikipedia.org/wiki/Independent_People\n",
    "pages": 470,
    "title": "Independent People",
    "publication_year": 1934
  },
  {
    "author": "Giacomo Leopardi",
    "link": "\n",
    "pages": 184,
    "title": "Poems by Giacomo Leopardi",
    "publication_year": 1818
  },
  {
    "author": "Doris Lessing",
    "link": "https://en.wikipedia.org/wiki/The_Golden_Notebook\n",
    "pages": 688,
    "title": "The Golden Notebook",
    "publication_year": 1962
  },
  {
    "author": "Astrid Lindgren",
    "link": "https://en.wikipedia.org/wiki/Pippi_Longstocking\n",
    "pages": 160,
    "title": "Pippi Longstocking",
    "publication_year": 1945
  },
  {
    "author": "Lu Xun",
    "link": "https://en.wikipedia.org/wiki/A_Madman%27s_Diary\n",
    "pages": 389,
    "title": "Diary of a Madman",
    "publication_year": 1918
  },
  {
    "author": "Naguib Mahfouz",
    "link": "https://en.wikipedia.org/wiki/Children_of_Gebelawi\n",
    "pages": 355,
    "title": "Children of Gebelawi",
    "publication_year": 1959
  },
  {
    "author": "Thomas Mann",
    "link": "https://en.wikipedia.org/wiki/Buddenbrooks\n",
    "pages": 736,
    "title": "Buddenbrooks",
    "publication_year": 1901
  },
  {
    "author": "Thomas Mann",
    "link": "https://en.wikipedia.org/wiki/The_Magic_Mountain\n",
    "pages": 720,
    "title": "The Magic Mountain",
    "publication_year": 1924
  },
  {
    "author": "Herman Melville",
    "link": "https://en.wikipedia.org/wiki/Moby-Dick\n",
    "pages": 378,
    "title": "Moby Dick",
    "publication_year": 1851
  },
  {
    "author": "Michel de Montaigne",
    "link": "https://en.wikipedia.org/wiki/Essays_(Montaigne)\n",
    "pages": 404,
    "title": "Essays",
    "publication_year": 1595
  },
  {
    "author": "Elsa Morante",
    "link": "https://en.wikipedia.org/wiki/History_(novel)\n",
    "pages": 600,
    "title": "History",
    "publication_year": 1974
  },
  {
    "author": "Toni Morrison",
    "link": "https://en.wikipedia.org/wiki/Beloved_(novel)\n",
    "pages": 321,
    "title": "Beloved",
    "publication_year": 1987
  },
  {
    "author": "Murasaki Shikibu",
    "link": "https://en.wikipedia.org/wiki/The_Tale_of_Genji\n",
    "pages": 1360,
    "title": "The Tale of Genji",
    "publication_year": 1006
  },
  {
    "author": "Robert Musil",
    "link": "https://en.wikipedia.org/wiki/The_Man_Without_Qualities\n",
    "pages": 365,
    "title": "The Man Without Qualities",
    "publication_year": 1931
  },
  {
    "author": "Vladimir Nabokov",
    "link": "https://en.wikipedia.org/wiki/Lolita\n",
    "pages": 317,
    "title": "Lolita",
    "publication_year": 1955
  },
  {
    "author": "George Orwell",
    "link": "https://en.wikipedia.org/wiki/Nineteen_Eighty-Four\n",
    "pages": 272,
    "title": "Nineteen Eighty-Four",
    "publication_year": 1949
  },
  {
    "author": "Ovid",
    "link": "https://en.wikipedia.org/wiki/Metamorphoses\n",
    "pages": 576,
    "title": "Metamorphoses",
    "publication_year": 100
  },
  {
    "author": "Fernando Pessoa",
    "link": "https://en.wikipedia.org/wiki/The_Book_of_Disquiet\n",
    "pages": 272,
    "title": "The Book of Disquiet",
    "publication_year": 1928
  },
  {
    "author": "Edgar Allan Poe",
    "link": "https://en.wikipedia.org/wiki/Edgar_Allan_Poe_bibliography#Tales\n",
    "pages": 842,
    "title": "Tales",
    "publication_year": 1950
  },
  {
    "author": "Marcel Proust",
    "link": "https://en.wikipedia.org/wiki/In_Search_of_Lost_Time\n",
    "pages": 2408,
    "title": "In Search of Lost Time",
    "publication_year": 1920
  },
  {
    "author": "Fran\u00e7ois Rabelais",
    "link": "https://en.wikipedia.org/wiki/Gargantua_and_Pantagruel\n",
    "pages": 623,
    "title": "Gargantua and Pantagruel",
    "publication_year": 1533
  },
  {
    "author": "Juan Rulfo",
    "link": "https://en.wikipedia.org/wiki/Pedro_P%C3%A1ramo\n",
    "pages": 124,
    "title": "Pedro P\u00e1ramo",
    "publication_year": 1955
  },
  {
    "author": "Rumi",
    "link": "https://en.wikipedia.org/wiki/Masnavi\n",
    "pages": 438,
    "title": "The Masnavi",
    "publication_year": 1236
  },
  {
    "author": "Salman Rushdie",
    "link": "https://en.wikipedia.org/wiki/Midnight%27s_Children\n",
    "pages": 536,
    "title": "Midnight's Children",
    "publication_year": 1981
  },
  {
    "author": "Saadi",
    "link": "https://en.wikipedia.org/wiki/Bustan_(book)\n",
    "pages": 298,
    "title": "Bostan",
    "publication_year": 1257
  },
  {
    "author": "Tayeb Salih",
    "link": "https://en.wikipedia.org/wiki/Season_of_Migration_to_the_North\n",
    "pages": 139,
    "title": "Season of Migration to the North",
    "publication_year": 1966
  },
  {
    "author": "Jos\u00e9 Saramago",
    "link": "https://en.wikipedia.org/wiki/Blindness_(novel)\n",
    "pages": 352,
    "title": "Blindness",
    "publication_year": 1995
  },
  {
    "author": "William Shakespeare",
    "link": "https://en.wikipedia.org/wiki/Hamlet\n",
    "pages": 432,
    "title": "Hamlet",
    "publication_year": 1603
  },
  {
    "author": "William Shakespeare",
    "link": "https://en.wikipedia.org/wiki/King_Lear\n",
    "pages": 384,
    "title": "King Lear",
    "publication_year": 1608
  },
  {
    "author": "William Shakespeare",
    "link": "https://en.wikipedia.org/wiki/Othello\n",
    "pages": 314,
    "title": "Othello",
    "publication_year": 1609
  },
  {
    "author": "Stendhal",
    "link": "https://en.wikipedia.org/wiki/The_Red_and_the_Black\n",
    "pages": 576,
    "title": "The Red and the Black",
    "publication_year": 1830
  },
  {
    "author": "Laurence Sterne",
    "link": "https://en.wikipedia.org/wiki/The_Life_and_Opinions_of_Tristram_Shandy,_Gentleman\n",
    "pages": 640,
    "title": "The Life And Opinions of Tristram Shandy",
    "publication_year": 1760
  },
  {
    "author": "Italo Svevo",
    "link": "https://en.wikipedia.org/wiki/Zeno%27s_Conscience\n",
    "pages": 412,
    "title": "Confessions of Zeno",
    "publication_year": 1923
  },
  {
    "author": "Jonathan Swift",
    "link": "https://en.wikipedia.org/wiki/Gulliver%27s_Travels\n",
    "pages": 178,
    "title": "Gulliver's Travels",
    "publication_year": 1726
  },
  {
    "author": "Leo Tolstoy",
    "link": "https://en.wikipedia.org/wiki/War_and_Peace\n",
    "pages": 1296,
    "title": "War and Peace",
    "publication_year": 1867
  },
  {
    "author": "Leo Tolstoy",
    "link": "https://en.wikipedia.org/wiki/Anna_Karenina\n",
    "pages": 864,
    "title": "Anna Karenina",
    "publication_year": 1877
  },
  {
    "author": "Leo Tolstoy",
    "link": "https://en.wikipedia.org/wiki/The_Death_of_Ivan_Ilyich\n",
    "pages": 92,
    "title": "The Death of Ivan Ilyich",
    "publication_year": 1886
  },
  {
    "author": "Mark Twain",
    "link": "https://en.wikipedia.org/wiki/Adventures_of_Huckleberry_Finn\n",
    "pages": 224,
    "title": "The Adventures of Huckleberry Finn",
    "publication_year": 1884
  },
  {
    "author": "Walt Whitman",
    "link": "https://en.wikipedia.org/wiki/Leaves_of_Grass\n",
    "pages": 152,
    "title": "Leaves of Grass",
    "publication_year": 1855
  },
  {
    "author": "Virginia Woolf",
    "link": "https://en.wikipedia.org/wiki/Mrs_Dalloway\n",
    "pages": 216,
    "title": "Mrs Dalloway",
    "publication_year": 1925
  },
  {
    "author": "Virginia Woolf",
    "link": "https://en.wikipedia.org/wiki/To_the_Lighthouse\n",
    "pages": 209,
    "title": "To the Lighthouse",
    "publication_year": 1927
  },
  {
    "author": "Marguerite Yourcenar",
    "link": "https://en.wikipedia.org/wiki/Memoirs_of_Hadrian\n",
    "pages": 408,
    "title": "Memoirs of Hadrian",
    "publication_year": 1951
  }
]


File.open('lib/assets/books.yaml', 'w') { |fo| fo.puts books.to_yaml }

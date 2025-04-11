-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 11, 2025 lúc 03:04 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `music_website_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `albums`
--

INSERT INTO `albums` (`id`, `name`, `artist_id`, `image`, `date`) VALUES
(1, 'Secret', 9, NULL, '2024-10-30 12:36:03'),
(2, 'Secrets', 9, NULL, '2024-10-30 12:45:52'),
(3, 'Daylight', 1, NULL, '2024-10-31 18:51:05'),
(4, 'Flow in you', 12, NULL, '2024-12-29 08:34:17'),
(5, 'Faded', 13, NULL, '2025-03-28 08:15:43'),
(6, 'Rap God', 14, NULL, '2025-03-28 08:16:41'),
(7, 'Blinding Lights', 15, NULL, '2025-03-28 08:27:45'),
(8, 'Who Knows', 17, NULL, '2025-04-09 12:05:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `bio` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `artists`
--

INSERT INTO `artists` (`id`, `name`, `bio`, `user_id`, `image`) VALUES
(1, 'David Kushner', 'have hit hard song', 1, 'uploads/09.jpg'),
(3, 'Charlie Puth', 'Charles Otto \"Charlie\" Puth Jr (sinh ngày 2 tháng 12 năm 1991) là ca sĩ, nhạc sĩ, nhà sản xuất thu âm người Mỹ, anh nổi tiếng một cách nhanh chóng từ những video phát hành trên trang mạng YouTube.', 1, 'uploads/02.jpg'),
(4, 'Taylor Swift', 'Taylor Alison Swift (sinh ngày 13 tháng 12 năm 1989) là một nữ ca sĩ kiêm nhạc sĩ sáng tác bài hát người Mỹ. Nổi tiếng với phong cách sáng tác nhạc mang đậm chất tự sự, khả năng biến hóa không ngừng trong nghệ thuật và tầm ảnh hưởng văn hóa sâu rộng, Swift được đánh giá là một nhân vật tiêu biểu trong nền âm nhạc đại chúng và là tâm điểm thu hút mọi sự chú ý của công chúng.', 1, 'uploads/03.jpg'),
(5, 'Adele', 'Adele Laurie Blue Adkins sinh ngày 5 tháng 5 năm 1988) là một nữ ca sĩ, nhạc sĩ nổi tiếng người Anh.\r\n\r\nNăm 2006, Adele được đề nghị ký hợp đồng thu âm với hãng thu âm XL Recordings sau khi một người bạn của Adele đăng một bản demo của cô lên Myspace. Năm tiếp theo cô nhận giải \"Sự lựa chọn của Nhà phê bình\" trong lễ trao giải Brit Awards và đoạt giải Sound of 2008 của kênh BBC.', 1, 'uploads/05.jpg'),
(6, 'Linkin park', 'Linkin Park là một ban nhạc rock người Mỹ được thành lập tại Agoura Hills, California vào năm 1996. Đội hình hiện tại của ban nhạc bao gồm Mike Shinoda (giọng ca chính/guitar đệm/keyboard), Brad Delson (guitar chính), Joe Hahn (DJ/nghệ sĩ xoay bàn đĩa), Dave Farrell (bass), Emily Armstrong (đồng giọng ca chính) và Colin Brittain (trống). Đội hình trình làng bảy album phòng thu đầu tiên của ban nhạc còn bao gồm Chester Bennington (giọng ca chính) và Rob Bourdon (trống); sau cái chết của Bennington vào tháng 7 năm 2017, ban nhạc đã tạm ngừng hoạt động vô thời hạn. Đến tháng 9 năm 2024, Linkin Park thông báo tái hợp, cũng như chào đón thêm Armstrong và Brittain vào nhóm.', 1, 'uploads/08.jpg'),
(7, 'Justin Bieber', 'Justin Drew Bieber sinh ngày 1 tháng 3 năm 1994, là một nam ca sĩ kiêm sáng tác nhạc người Canada. Bieber nổi tiếng nhờ khả năng kết hợp đa dạng nhiều dòng nhạc và là nghệ sĩ đóng vai trò quan trọng trong nền âm nhạc đại chúng hiện nay. Anh được giám đốc điều hành thu âm người Mỹ Scooter Braun phát hiện và ký hợp đồng với RBMG Records vào năm 2008, sau đó gây chú ý với việc phát hành EP 7 ca khúc đầu tay My World (2009) và sớm trở thành một thần tượng tuổi teen.', 1, 'uploads/01.jpg'),
(8, 'Imagine Dragon', 'Imagine Dragons là nhóm nhạc alternative rock Mỹ đến từ Las Vegas, Nevada gồm 4 thành viên với Dan Reynolds hát chính, Wayne Sermon chơi ghi ta, Ben McKee đánh bass và Daniel Platzman chơi trống. Âm nhạc của họ thường được so sánh với The Killers và Arcade Fire, trong khi giai điệu và nội dung trữ tình đã thường được mô tả là tích cực và lạc quan.', 1, 'uploads/04.jpg'),
(9, 'OneRepublic', 'OneRepublic là một ban nhạc pop rock của Mỹ được thành lập tại Colorado Springs, Colorado vào năm 2002 bởi Ryan Tedder và Zack Filkins. Họ đã thu hút được sự chú ý và tạo nên tiếng vang lớn sau khi phát hành bài hit \"Apologize\" thông qua trang cộng đồng MySpace vào năm 2007. Single này đã bán được hơn 7 triệu bản trên toàn thế giới. \"Apologize\" là bài hát được download nhiều nhất trong lịch sử âm nhạc hiện đại Mỹ với kỉ lục 4,3 triệu lượt download chỉ tính riêng tại thị trường Mỹ. Bản hòa âm lại của ca khúc này được phát hành trong album Dreaming Out Loud của nhóm và album Shock Value của Timbaland đã đạt hơn 10 triệu lượt download trên toàn thế giới, đồng thời đem đến cho ban nhạc một đề cử Grammy vào năm 2009.', 1, 'uploads/07.jpg'),
(10, 'Vance Joy', 'James Gabriel Keogh (sinh ngày 1 tháng 12 năm 1987), được biết đến với nghệ danh Vance Joy, là một ca sĩ kiêm nhạc sĩ người Úc và cựu cầu thủ bóng đá người Úc. Anh được biết đến nhiều nhất với ca khúc hit năm 2013 \"Riptide\".', 1, 'uploads/10.jpg'),
(11, 'Flawed Mangoes', 'No information found', 1, 'uploads/logo1.jpg'),
(12, 'Yukira', 'qqqqqq', 1, 'uploads/adxLR3J.jpeg'),
(13, 'Alan Walker', 'Alan Olav Walker, thường được biết đến với nghệ danh Alan Walker, là một nam DJ, nhạc sĩ kiêm nhà sản xuất thu âm người Na Uy gốc Anh. Vào năm 2015, Alan bắt đầu trở nên nổi tiếng trên phạm vi quốc tế sau khi phát hành đĩa đơn \"Faded\" và nhận được chứng nhận bạch kim tại 14 quốc gia.', 1, 'uploads/ALang di bo.jpg'),
(14, 'Eminem', 'Marshall Bruce Mathers III, thường được biết đến với nghệ danh Eminem, là một nam rapper, nhạc sĩ, nhà sản xuất thu âm kiêm diễn viên người Mỹ.', 1, 'uploads/eminem.jpg'),
(15, 'The Weeknd', 'Abel Makkonen Tesfaye ( tiếng Amhara: አበል መኮነን ተስፋዬ?; sinh ngày 16 tháng 2 năm 1990), được biết đến với nghệ danh The Weeknd, là một ca sĩ, nhạc sĩ sáng tác bài hát và nhà sản xuất thu âm người Canada.Anh được nhiều người biết đến nhờ vào cách sản xuất âm nhạc độc đáo, những sáng tạo nghệ thuật và quãng giọng falsetto đặc trưng của anh.Các giải thưởng của The Weeknd gồm có 4 giải Grammy, 20 Giải thưởng Âm nhạc Billboard, 22 giải Juno, 6 giải thưởng Âm nhạc Mỹ, 2 giải Video âm nhạc của MTV, và 1 giải Grammy Latin, và 1 đề cử Giải Oscar và 1 giải Primetime Emmy.', 1, 'uploads/The_Weeknd_Portrait_by_Brian_Ziff.jpg'),
(17, 'Protoje', 'Oje Ken Ollivierre (sinh ngày 14 tháng 6 năm 1981), thường được gọi là Protoje , là một người Jamaica có di sản Afro-European , một ca sĩ và nhạc sĩ reggae đương đại . Mẹ anh là ca sĩ và luật sư người Jamaica Lorna Bennett , nổi tiếng nhất với bản trình bày năm 1972 của cô ấy về \"Breakfast in Bed\". Cha anh là một cựu ca sĩ calypso Mike Ollivierre đến từ quốc đảo Saint Vincent và Grenadines .', 1, 'uploads/Protoje.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(30) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `category`, `disabled`) VALUES
(1, 'Pop', 1),
(2, 'Rock', 1),
(3, 'Country', 0),
(4, 'Chillhop', 1),
(6, 'Piano', 1),
(7, 'EDM', 1),
(8, 'Rap', 0),
(9, 'Jazz', 0),
(10, 'RaR', 0),
(11, 'Reggae', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `song_id`, `user_name`, `comment`, `created_at`) VALUES
(12, 18, 'Nam', 'great', '2024-10-31 17:51:36'),
(13, 9, 'BaoThu', 'gs', '2024-10-31 17:52:13'),
(14, 9, 'Nam', 'zz', '2024-10-31 17:52:21'),
(15, 13, 'B', 'yay', '2024-11-01 14:15:23'),
(16, 17, 'v', 'gg', '2024-11-09 13:54:58'),
(17, 18, 'phu', 'gg', '2024-11-14 05:03:49'),
(18, 18, 'B', 'zzz', '2024-11-15 00:51:08'),
(19, 11, 'vi', 'zz', '2024-11-22 14:26:03'),
(20, 13, 'duong', 'gg', '2024-11-28 05:11:51'),
(21, 12, 'mm', 'll', '2024-11-28 05:57:50'),
(23, 4, 'trucs ngu', 'j97 mai dinh', '2024-12-05 02:28:38'),
(24, 18, 'eeee', 'eeeee', '2024-12-29 07:31:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `song_id`, `created_at`) VALUES
(53, 3, 17, '2024-11-28 06:52:30'),
(73, 3, 13, '2024-11-28 07:01:51'),
(102, 3, 7, '2024-11-28 08:53:37'),
(122, 1, 9, '2025-03-13 05:39:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `image` varchar(1024) NOT NULL,
  `file` varchar(1024) NOT NULL,
  `lyrics` text DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `views` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `album_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `songs`
--

INSERT INTO `songs` (`id`, `title`, `user_id`, `artist_id`, `image`, `file`, `lyrics`, `category_id`, `date`, `views`, `slug`, `album_id`) VALUES
(4, 'Hello', 1, 5, 'uploads/05.jpg', 'uploads/Adele - Hello (Lyrics).mp3', 'Hello, it\'s me\r\nI was wondering if after all these years you\'d like to meet\r\nTo go over everything\r\nThey say that time\'s supposed to heal ya, but I ain\'t done much healing\r\nHello, can you hear me?\r\nI\'m in California dreaming about who we used to be\r\nWhen we were younger and free\r\nI\'ve forgotten how it felt before the world fell at our feet\r\nThere\'s such a difference between us\r\nAnd a million miles\r\nHello from the other side\r\nI must\'ve called a thousand times\r\nTo tell you I\'m sorry for everything that I\'ve done\r\nBut when I call, you never seem to be home\r\nHello from the outside\r\nAt least I can say that I\'ve tried\r\nTo tell you I\'m sorry for breaking your heart\r\nBut it don\'t matter, it clearly doesn\'t tear you apart anymore\r\nHello, how are you?\r\nIt\'s so typical of me to talk about myself, I\'m sorry\r\nI hope that you\'re well\r\nDid you ever make it out of that town where nothing ever happened?\r\nIt\'s no secret that the both of us\r\nAre running out of time\r\nSo hello from the other side (other side)\r\nI must\'ve called a thousand times (thousand times)\r\nTo tell you I\'m sorry for everything that I\'ve done\r\nBut when I call, you never seem to be home\r\nHello from the outside (outside)\r\nAt least I can say that I\'ve tried (I\'ve tried)\r\nTo tell you I\'m sorry for breaking your heart\r\nBut it don\'t matter, it clearly doesn\'t tear you apart anymore\r\nOoh (lows, lows, lows, lows), anymore\r\n(Highs, highs, highs, highs)\r\nOoh (lows, lows, lows, lows), anymore\r\n(Highs, highs, highs, highs)\r\nOoh (lows, lows, lows, lows), anymore\r\n(Highs, highs, highs, highs)\r\nAnymore (lows, lows, lows, lows)\r\nHello from the other side (other side)\r\nI must\'ve called a thousand times (thousand times)\r\nTo tell you I\'m sorry for everything that I\'ve done\r\nBut when I call, you never seem to be home\r\nHello from the outside (outside)\r\nAt least I can say that I\'ve tried (I\'ve tried)\r\nTo tell you I\'m sorry for breaking your heart\r\nBut it don\'t matter, it clearly doesn\'t tear you apart anymore', 1, '2024-10-24 15:58:05', 53, 'hello', 0),
(5, 'See you again', 1, 3, 'uploads/02.jpg', 'uploads/Wiz Khalifa - See You Again ft. Charlie Puth (Lyrics).mp3', 'It\'s been a long day without you, my friend\nAnd I\'ll tell you all about it when I see you again\nWe\'ve come a long way from where we began\nOh, I\'ll tell you all about it when I see you again\nWhen I see you again\nDamn, who knew?\nAll the planes we flew, good things we been through\nThat I\'d be standin\' right here talkin\' to you\n\'Bout another path, I know we loved to hit the road and laugh\nBut somethin\' told me that it wouldn\'t last\nHad to switch up, look at things different, see the bigger picture\nThose were the days, hard work forever pays\nNow I see you in a better place (see you in a better place)\nUh\nHow can we not talk about family when family\'s all that we got?\nEverythin\' I went through, you were standin\' there by my side\nAnd now you gon\' be with me for the last ride\nIt\'s been a long day without you, my friend\nAnd I\'ll tell you all about it when I see you again (I\'ll see you again)\nWe\'ve come a long way (yeah, we came a long way)\nFrom where we began (you know where we started)\nOh, I\'ll tell you all about it when I see you again (let me tell you)\nWhen I see you again\nOh, oh\nOoh (yeah)\nFirst, you both go out your way and the vibe is feelin\' strong\nAnd what\'s small turned to a friendship, a friendship turned to a bond\nAnd that bond\'ll never be broken, the love will never get lost\n(The love never get lost)\nAnd when brotherhood come first, then the line\'ll never be crossed\nEstablished it on our own when that line had to be drawn\nAnd that line is what we reached, so remember me when I\'m gone\n(Remember me when I\'m gone)\nHow can we not talk about family when family\'s all that we got?\nEverythin\' I went through, you were standin\' there by my side\nAnd now you gon\' be with me for the last ride\nSo let the light guide your way, yeah\nHold every memory as you go\nAnd every road you take\nWill always lead you home, home\nIt\'s been a long day without you, my friend\nAnd I\'ll tell you all about it when I see you again\nWe\'ve come a long way from where we began\nOh, I\'ll tell you all about it when I see you again\nWhen I see you again\nOh (uh), oh (yeah-yeah, yeah)\nOoh (yo, yo, uh)\nWhen I see you again (see you again, yeah, yeah)\nOh (yeah), oh (yeah, yeah, oh-oh)\nOoh (uh-huh, yup)\nWhen I see you again', 1, '2024-10-24 15:58:41', 11, 'see-you-again', 0),
(6, 'Shake it of', 1, 4, 'uploads/03.jpg', 'uploads/Shake It Off (With Lyrics) - Taylor Swift.mp3', 'I stay out too late\nGot nothing in my brain\nThat\'s what people say, mm-mm\nThat\'s what people say, mm-mm\nI go on too many dates\nBut I can\'t make \'em stay\nAt least that\'s what people say, mm-mm\nThat\'s what people say, mm-mm\nBut I keep cruisin\'\nCan\'t stop, won\'t stop movin\'\nIt\'s like I got this music in my mind\nSayin\', \"It\'s gonna be alright\"\n\'Cause the players gonna play, play, play, play, play\nAnd the haters gonna hate, hate, hate, hate, hate\nBaby, I\'m just gonna shake, shake, shake, shake, shake\nI shake it off, I shake it off (whoo-hoo-hoo)\nHeartbreakers gonna break, break, break, break, break\nAnd the fakers gonna fake, fake, fake, fake, fake\nBaby, I\'m just gonna shake, shake, shake, shake, shake\nI shake it off, I shake it off (whoo-hoo-hoo)\nI never miss a beat\nI\'m lightnin\' on my feet\nAnd that\'s what they don\'t see, mm-mm\nThat\'s what they don\'t see, mm-mm\nI\'m dancin\' on my own (dancin\' on my own)\nI make the moves up as I go (moves up as I go)\nAnd that\'s what they don\'t know, mm-mm\nThat\'s what they don\'t know, mm-mm\nBut I keep cruisin\'\nCan\'t stop, won\'t stop groovin\'\nIt\'s like I got this music in my mind\nSayin\', \"It\'s gonna be alright\"\n\'Cause the players gonna play, play, play, play, play\nAnd the haters gonna hate, hate, hate, hate, hate\nBaby, I\'m just gonna shake, shake, shake, shake, shake\nI shake it off, I shake it off (whoo-hoo-hoo)\nHeartbreakers gonna break, break, break, break, break\nAnd the fakers gonna fake, fake, fake, fake, fake\nBaby, I\'m just gonna shake, shake, shake, shake, shake\nI shake it off, I shake it off (whoo-hoo-hoo)\nShake it off, I shake it off\nI, I, I shake it off, I shake it off\nI, I, I shake it off, I shake it off\nI, I, I shake it off, I shake it off (whoo-hoo-hoo)\nHey, hey, hey\nJust think, while you\'ve been gettin\' down and out about the liars\nAnd the dirty, dirty cheats of the world\nYou could\'ve been gettin\' down to this sick beat\nMy ex-man brought his new girlfriend\nShe\'s like, \"Oh my God!\" but I\'m just gonna shake\nAnd to the fella over there with the hella good hair\nWon\'t you come on over, baby? We can shake, shake, shake (yeah)\nYeah, oh, oh\n\'Cause the players gonna play, play, play, play, play\nAnd the haters gonna hate, hate, hate, hate, hate (haters gonna hate)\nBaby, I\'m just gonna shake, shake, shake, shake, shake\nI shake it off, I shake it off (whoo-hoo-hoo)\nHeartbreakers gonna break, break, break, break, break (mm)\nAnd the fakers gonna fake, fake, fake, fake, fake (and fake and fake and fake)\nBaby, I\'m just gonna shake, shake, shake, shake, shake\nI shake it off, I shake it off (whoo-hoo-hoo)\nShake it off, I shake it off\nI, I, I shake it off, I shake it off\nI, I, I shake it off, I shake it off\nI, I, I shake it off (yeah), I shake it off (whoo-hoo-hoo)\nShake it off, I shake it off\nI, I, I shake it off, I shake it off (you got to)\nI, I, I shake it off, I shake it off\nI, I, I shake it off, I shake it off', 1, '2024-10-24 16:13:40', 44, 'shake-it-of', 0),
(7, 'In the end', 1, 6, 'uploads/08.jpg', 'uploads/Linkin Park - In the End (Lyrics).mp3', 'It starts with one\nAll I know\nIt\'s so unreal\nWatch you go\nI tried so hard and got so far\nBut in the end, it doesn\'t even matter\nI had to fall to lose it all\nBut in the end, it doesn\'t even matter\nOne thing, I don\'t know why\nIt doesn\'t even matter how hard you try\nKeep that in mind, I designed this rhyme\nTo remind myself of a time when I tried so hard\nIn spite of the way you were mockin\' me\nActin\' like I was part of your property\nRemembering all the times you fought with me\nI\'m surprised it got so far\nThings aren\'t the way they were before\nYou wouldn\'t even recognize me anymore\nNot that you knew me back then\nBut it all comes back to me in the end\nYou kept everything inside\nAnd even though I tried, it all fell apart\nWhat it meant to me will eventually\nBe a memory of a time when I\nI tried so hard and got so far\nBut in the end, it doesn\'t even matter\nI had to fall to lose it all\nBut in the end, it doesn\'t even matter\nOne thing, I don\'t know why\nIt doesn\'t even matter how hard you try\nKeep that in mind\nI designed this rhyme to explain in due time\nAll I know\nTime is a valuable thing\nWatch it fly by as the pendulum swings\nWatch it count down to the end of the day\nThe clock ticks life away\nIt\'s so unreal\nYou didn\'t look out below\nWatch the time go right out the window\nTryin\' to hold on, they didn\'t even know\nI wasted it all just to watch you go\nI kept everything inside\nAnd even though I tried, it all fell apart\nWhat it meant to me will eventually be a memory\nOf a time when I tried so hard', 2, '2024-10-24 16:15:48', 85, 'in-the-end', 0),
(8, 'Eenie meenie', 1, 7, 'uploads/01.jpg', 'uploads/Sean Kingston, Justin Bieber - Eenie Meenie (Lyrics).mp3', '(Sean)\nEenie meenie miney mo\nCatch a bad chick by her toe\nIf she holla (if, if, if she holla) let her go\n\nShes indecisive\nShe cant decide\nShe keeps on lookin\nFrom left to right\n\nGirl, cmon get closer\nLook in my eyes\nSearchin is so wrong\nIm Mr. Right\n\nYou seem like the type\nTo love em and leave em\nAnd disappear right after this song.\nSo give me the night\nTo show you, hold you\nDont leave me out here dancin alone\n\nYou cant make up your mind, mind, mind, mind, mind\nPlease dont waste my time, time, time, time, time\nIm not tryin to rewind, wind, wind, wind, wind\nI wish our hearts could come together as one\n\nCause shorty is a eenie meenie miney mo lova\nShorty is a eenie meenie miney mo lova\nShorty is a eenie meenie miney mo lova\nShorty is a eenie meenie miney mo lova\n\n(Justin)\nLet me show you what your missin\nParadise\nWith me youre winning girl\nYou dont have to roll the dice\nJustin Bieber Eenie Meenie lyrics found on http://www.directlyrics.com.com/justin-bieber-eenie-meenie-lyrics.html\nTell me what youre really here for\nThem other guys?\nI can see right through ya\n\nYou seem like the type\nTo love em and leave em\nAnd disappear right after the song.\nSo give me the night\nTo show you, hold you\nDont leave me out here dancin alone\n\nCant make up your mind\nPlease dont waste my time\nNot tryin to rewind\nI wish our hearts could come together as one\n\nCause shorty is a eenie meenie miney mo lova\nShorty is a eenie meenie miney mo lova\nShorty is a eenie meenie miney mo lova\nShorty is a eenie meenie miney mo lova\n\n(Sean)\nEenie meenie miney moe\nCatch a bad chick by her toe\nIf she holla (if, if, if she holla) let her go\nEenie meenie miney moe\nCatch a bad chick by her toe\nIf she holla (if, if, if she holla) let her go\n\nShorty is a eenie meenie miney mo lova\nShorty is a eenie meenie miney mo lova\nShorty is a eenie meenie miney mo lova\nShorty is a eenie meenie miney mo lova\n\nCant make up your mind\nPlease dont waste my time\nNot tryin to rewind\nI wish our hearts could come together as one', 1, '2024-10-24 16:29:03', 27, 'eenie-meenie', 0),
(9, 'Thunder', 1, 8, 'uploads/04.jpg', 'uploads/Imagine Dragons - Thunder (Lyrics).mp3', 'Just a young gun with a quick fuse\r\nI was uptight, wanna let loose\r\nI was dreaming of bigger things\r\nAnd wanna leave my old life behind\r\nNot a yes-sir, not a follower\r\nFit the box, fit the mold\r\nHave a seat in the foyer, take a number\r\nI was lightning before the thunder\r\n\r\nThunder, thunder\r\nThunder, thun-, thunder\r\nThun-thun-thunder, thunder, thunder\r\nThunder, thun-, thunder\r\nThun-thun-thunder, thunder\r\n\r\nThunder, feel the thunder\r\nLightning then the thunder\r\nThunder, feel the thunder\r\nLightning then the thunder\r\nThunder, thunder\r\nThunder\r\n\r\nKids were laughing in my classes\r\nWhile I was scheming for the masses\r\nWho do you think you are?\r\nDreaming \'bout being a big star\r\nThey say you\'re basic, they say you\'re easy\r\nYou\'re always riding in the back seat\r\nNow I\'m smiling from the stage while\r\nYou were clapping in the nosebleeds\r\n\r\nThunder\r\nThunder, thun-, thunder\r\nThun-thun-thunder, thunder, thunder\r\nThunder, thun-, thunder\r\nThun-thun-thunder, thunder\r\n\r\nThunder, feel the thunder\r\nLightning then the thunder\r\nThunder, feel the thunder\r\nLightning then the thunder\r\nThunder\r\n\r\nThunder, feel the thunder\r\nLightning then the thunder, thunder\r\n\r\nThunder, feel the thunder\r\nLightning then the thunder, thunder\r\nThunder, feel the thunder\r\nLightning then the thunder, thunder\r\nThunder, feel the thunder\r\n(Never give up, never give up)\r\nLightning then the thunder, thunder\r\n(Never give up on your dreams)\r\nThunder, feel the thunder\r\n(Never give up, never give up)\r\nLightning then the thunder, thunder\r\n(Never give up on your dreams)\r\n\r\nThunder, thunder, thun-, thunder\r\nThun-thun-thunder, thunder\r\nThunder, thunder, thun-, thunder\r\nThun-thun-thunder, thunder\r\nThunder, thunder, thun-, thunder\r\nThun-thun-thunder, thunder\r\nThunder, thunder, thun-, thunder\r\nThun-thun-thunder, thunder', 2, '2024-10-24 16:51:22', 59, 'thunder', 0),
(11, 'Riptide', 1, 10, 'uploads/10.jpg', 'uploads/Vance Joy - \'Riptide\' Official Video.mp3', 'I was scared of dentists and the dark\nI was scared of pretty girls and starting conversations\nOh, all my friends are turnin\' green\nYou\'re the magician\'s assistant in their dream\nAh-ooh, ah-oh\nAnd they come unstuck\nLady, runnin\' down to the riptide\nTaken away to the dark side\nI wanna be your left-hand man\nI love you when you\'re singin\' that song\nAnd I got a lump in my throat \'cause\nYou\'re gonna sing the words wrong\nThere\'s this movie that I think you\'ll like\nThis guy decides to quit his job and heads to New York City\nThis cowboy\'s runnin\' from himself\nAnd she\'s been livin\' on the highest shelf\nAh-ooh, ah-oh\nAnd they come unstuck\nLady, runnin\' down to the riptide\nTaken away to the dark side\nI wanna be your left-hand man\nI love you when you\'re singin\' that song\nAnd I got a lump in my throat \'cause\nYou\'re gonna sing the words wrong\nI just wanna, I just wanna know\nIf you\'re gonna, if you\'re gonna stay\nI just gotta, I just gotta know\nI can\'t have it, I can\'t have it any other way\nI swear she\'s destined for the screen\nClosest thing to Michelle Pfeiffer that you\'ve ever seen, oh\nLady, runnin\' down to the riptide\nTaken away to the dark side\nI wanna be your left-hand man\nI love you when you\'re singin\' that song\nAnd I got a lump in my throat \'cause\nYou\'re gonna sing the words wrong\nOh lady, runnin\' down to the riptide\nTaken away to the dark side\nI wanna be your left-hand man\nI love you when you\'re singin\' that song\nAnd I got a lump in my throat \'cause\nYou\'re gonna sing the words wrong\nOh lady, runnin\' down to the riptide\nTaken away to the dark side\nI wanna be your left-hand man\nI love you when you\'re singin\' that song\nAnd I got a lump in my throat \'cause\nYou\'re gonna sing the words wrong, yeah\nI got a lump in my throat \'cause\nYou\'re gonna sing the words wrong', 3, '2024-10-24 17:02:40', 43, 'riptide', 0),
(12, 'Killswitch Lullaby', 1, 11, 'uploads/logo1.jpg', 'uploads/Flawed Mangoes - Killswitch Lullaby.mp3', NULL, 4, '2024-10-24 17:07:47', 38, 'killswitch-lullaby', 0),
(13, 'Nobody', 1, 9, 'uploads/07.jpg', 'uploads/OneRepublic - Nobody (from Kaiju No. 8) (Lyrics).mp3', '[Intro]\nNobody, nobody, nobody\nNobody, nobody, nobody\nYeah\n\n[Verse 1]\nI\'d take the fall\nI got you covered when there\'s no one at all\nOh, yeah, and I\'d stay through the night\nWhen you\'ve got demons tryna break through the walls\n\n[Pre-Chorus]\nThere ain\'t no, no kinda line\nThat I wouldn\'t cross if you need me to\nYou\'re out here searchin\' for signs\nSo I think it\'s finally time that you knew\n\n[Chorus]\nNobody got you the way I do (Ooh)\nWhatever demons you\'re fightin\' through\nWhen you need somebody to turn to\nNobody got you the way I do\nThe way I do\n\n[Post-Chorus]\nNobody, nobody, nobody (Ayo)\nGot you the way I do\nOh, nobody, nobody, nobody (Ayo)\nNobody got you the way I do\nThe way I do (Yeah, yeah)\nSee OneRepublic Live\nGet tickets as low as $57\n\nYou might also like\nSo Long, London\nTaylor Swift\nThe Tortured Poets Department\nTaylor Swift\nI Forgive You\nSia\n\n[Verse 2]\nWhen you go dark and the night gеts so cold\nI\'ll be on my way to you (Oh yeah)\nYou know I ain\'t tryna lose you, oh, no\nIf you\'rе in Hell, I\'ll go there too\n\n[Pre-Chorus]\nThere ain\'t no, no kinda line\nThat I wouldn\'t cross if you need me to\nYou\'re out here searchin\' for signs\nSo I think it\'s finally time that you knew\n\n[Chorus]\nNobody got you the way I do (Ooh)\nWhatever demons you\'re fightin\' through\nWhen you need somebody to turn to (Ooh)\nNobody got you the way I do\nThe way I do (The way I do)\n\n[Post-Chorus]\nNobody, nobody, nobody (Ayo)\nGot you the way I do\nOh, nobody, nobody, nobody (Ayo)\nNobody got you the way I do\nThe way, the way, the way I do\n\n\n[Bridge]\nThe way, the way, the way I do\nNobody got you the way I do (Woo)\n\n[Outro]\nNobody, nobody, nobody (Ayo)\nGot you the way I do (Yeah, yeah, yeah)\nNobody, nobody, nobody (Ayo)\nNobody got you the way I do\nThe way I do\nNobody, nobody, nobody (Ooh)\nNobody got you the way I do', 1, '2024-10-24 17:15:57', 158, 'nobody', 0),
(17, 'Secrets', 1, 9, 'uploads/07.jpg', 'uploads/One Republic - Secrets (Lyrics).mp3', '[Verse 1]\nI need another story\nSomething to get off my chest\nMy life gets kinda boring\nNeed something that I can confess\n\'Til all my sleeves are stained red\nFrom all the truth that I\'ve said\nCome by it honestly I swear\nThought you saw me wink, no\nI\'ve been on the brink, so\n\n[Chorus]\nTell me what you want to hear\nSomething that will light those ears\nI\'m sick of all the insincere\nSo I\'m gonna give all my secrets away\nThis time\nDon\'t need another perfect lie\nDon\'t care if critics ever jump in line\nI\'m gonna give all my secrets away\n\n[Verse 2]\nMy God, amazing how we got this far\nIt\'s like we\'re chasing all those stars\nWho\'s driving shiny big black cars\nAnd every day I see the news\nAll the problems that we could solve\nAnd when a situation rises\nJust write it into an album\nSend it straight to gold\nBut I don\'t really like my flow, no\nSee OneRepublic Live\nGet tickets as low as $57\n\nYou might also like\nSo Long, London\nTaylor Swift\nThe Tortured Poets Department\nTaylor Swift\nMy Boy Only Breaks His Favorite Toys\nTaylor Swift\n\n[Chorus]\nSo tell me what you want to hear\nSomething that will light those ears\nI\'m sick of all the insincere\nSo I\'m gonna give all my secrets away\nThis time\nDon\'t need another perfect lie\nDon\'t care if critics ever jump in line\nI\'m gonna give all my secrets away\n\n[Bridge]\nOoh\nGot no reason, got no shame\nGot no family I can blame\nJust don\'t let me disappear\nI\'ma tell you everything\n\n[Chorus]\nSo tell me what you want to hear\nSomething that\'ll light those ears\nI\'m sick of all the insincere\nSo I\'m gonna give all my secrets away\nThis time\nDon\'t need another perfect lie\nDon\'t care if critics ever jump in line\nI\'m gonna give all my secrets away\nSo tell me what you want to hear\nSomething that\'ll light those ears\nI\'m sick of all the insincere\nSo I\'m gonna give all my secrets away\nThis time\nDon\'t need another perfect lie\nDon\'t care if critics ever jump in line\nI\'m gonna give all my secrets away\n\n\n[Outro]\nAll my secrets away\nAll my secrets away', 1, '2024-10-30 12:51:56', 32, 'secrets', 1),
(18, 'Daylight', 1, 1, 'uploads/09.jpg', 'uploads/David Kushner - Daylight.mp3', '[Verse 1]\r\nTelling myself I won\'t go there\r\nOh, but I know that I won\'t care\r\nTryna wash away all the blood I\'ve spilt\r\nThis lust is a burden that we both share\r\nTwo sinners can\'t atone from a lone prayer\r\nSouls tied, intertwined by pride and guilt\r\n\r\n[Pre-Chorus]\r\n(Ooh) There\'s darkness in the distance\r\nFrom the way that I\'ve been livin\'\r\n(Ooh) But I know I can\'t resist it\r\n\r\n[Chorus]\r\nOh, I love it and I hate it at the same time\r\nYou and I drink the poison from the same vine\r\nOh, I love it and I hate it at the same time\r\nHidin\' all of our sins from the daylight\r\nFrom the daylight, runnin\' from thе daylight\r\nFrom the daylight, runnin\' from the daylight\r\nOh, I love it and I hatе it at the same time\r\n\r\n[Verse 2]\r\nTellin\' myself it\'s the last time\r\nCan you spare any mercy that you might find\r\nIf I\'m down on my knees again?\r\nDeep down, way down, Lord, I try\r\nTry to follow your light, but it\'s nighttime\r\nPlease don\'t leave me in the end\r\n\r\n[Pre-Chorus]\r\n(Ooh) There\'s darkness in the distance\r\nI\'m beggin\' for forgiveness\r\n(Ooh) But I know I might resist it, oh\r\n\r\n[Chorus]\r\nOh, I love it and I hate it at the same time\r\nYou and I drink the poison from the same vine\r\nOh, I love it and I hate it at the same time\r\nHidin\' all of our sins from the daylight\r\nFrom the daylight, runnin\' from the daylight\r\nFrom the daylight, runnin\' from the daylight\r\nOh, I love it and I hate it at the same time\r\nOh, I love it and I hate it at the same time\r\nYou and I drink the poison from the same vine\r\nOh, I love it and I hate it at the same time\r\nHidin\' all of our sins from the daylight\r\nFrom the daylight, runnin\' from the daylight\r\nFrom the daylight, runnin\' from the daylight\r\nOh, I love it and I hate it at the same time', 1, '2024-10-31 18:51:05', 373, 'daylight', 3),
(19, 'Flow in you', 1, 12, 'uploads/adxLR3J.jpeg', 'uploads/Yiruma - River Flows in You.mp3', '[Verse 1]\nNeoreul wihan giri hana itdamyeon\nGeugeon jigeum baro neo ane isseo\nGeureoke deo gyeondyeonael su itdamyeon\nIgose neoui modeun geol matgyeo bwa\n\n[Chorus]\nHolding you, holding you\nIt\'s in you; river flows in you\nCheoncheonhi deo cheoncheonhi\nNe mamsogen gangeun heureugo\nHolding you, holding you\nIt\'s in you; river flows in you\nGidarim geu gidarim\nKkeuteneun naega isseulkka\n\n[Interlude]\n\n[Verse 2]\nNeol hyanghae nae mameul deonjigo sipeo\nEonjena naega neol neukkil su itge\nGeureoke deo gyeondyeonael su itdamyeon\nIgose neoui modeun geol matgyeo bwa\n\n[Chorus]\nHolding you, holding you\nIt\'s in you; river flows in you\nCheoncheonhi deo cheoncheonhi\nNe mamsogen gangeun heureugo\nHolding you, holding you\nIt\'s in you; river flows in you\nGidarim geu gidarim\nKkeuteneun naega isseulkka\nSee upcoming pop shows\nGet tickets for your favorite artists\n\nYou might also like\nFamily Matters\nDrake\nDori (도리) - YOU AND I (English Translation)\nGenius English Translations\nI Can Do It With a Broken Heart\nTaylor Swift\n\nHolding you, holding you\nIt\'s in you; river flows in you\nCheoncheonhi deo cheoncheonhi\nNe mamsogen gangeun heureugo\nHolding you, holding you\nIt\'s in you; river flows in you\nGidarim geu gidarim\nKkeuteneun naega isseulkka\n\nOh\nOoh, oh\nOoh, river flows in you', 6, '2024-12-29 08:34:17', 6, 'flow-in-you', 4),
(20, 'Faded', 1, 13, 'uploads/Faded.jpg', 'uploads/y2mate.com - Alan Walker  Faded.mp3', '[Verse 1]\nYou were the shadow to my light\nDid you feel us?\nAnother star, you fade away\nAfraid our aim is out of sight\nWanna see us alight\n\n[Pre-Chorus 1]\nWhere are you now?\nWhere are you now?\nWhere are you now?\nWas it all in my fantasy?\nWhere are you now?\nWere you only imaginary?\n\n[Chorus]\nWhere are you now?\nAtlantis, under the sea, under the sea\nWhere are you now? Another dream\nThe monster\'s running wild inside of me\nI\'m faded, I\'m faded\nSo lost, I\'m faded, I\'m faded\nSo lost, I\'m faded\n\n[Verse 2]\nThese shallow waters never met what I needed\nI\'m letting go, a deeper dive\nEternal silence of the sea\nI\'m breathing, alive\n\n[Pre-Chorus 2]\nWhere are you now?\nWhere are you now?\nUnder the bright but faded lights\nYou set my heart on fire\nWhere are you now?\nWhere are you now?\n\n[Chorus]\nWhere are you now?\nAtlantis, under the sea, under the sea\nWhere are you now? Another dream\nThe monster\'s running wild inside of me\nI\'m faded, I\'m faded\nSo lost, I\'m faded, I\'m faded\nSo lost, I\'m faded', 7, '2025-03-28 08:15:43', 6, 'faded', 5),
(21, 'Rap God', 1, 14, 'uploads/Song_Rap_God.jpg', 'uploads/y2mate.com - Eminem  Rap God Explicit.mp3', 'Look, I was gonna go easy on you not to hurt your feelings\nBut I\'m only goin\' to get this one chance (six minutes, six minutes)\nSomething\'s wrong, I can feel it (six minutes, Slim Shady, you\'re on)\nJust a feelin\' I\'ve got, like something\'s about to happen, but I don\'t know what (six minutes, six, six minutes)\nIf that means what I think it means, we\'re in trouble, big trouble\nAnd if he is as bananas as you say, I\'m not takin\' any chances (you are just what the doc ordered)\nI\'m beginnin\' to feel like a Rap God, Rap God\nAll my people from the front to the back nod, back nod\nNow, who thinks their arms are long enough to slap box, slap box?\nThey said I rap like a robot, so call me Rap-bot\nBut for me to rap like a computer it must be in my genes, I got a laptop in my back pocket\nMy pen\'ll go off when I half-cock it, got a fat knot from that rap profit\nMade a livin\' and a killin\' off it, ever since Bill Clinton was still in office\nWith Monica Lewinsky feelin\' on his - sack\nI\'m an MC still as honest, but as rude and as indecent as all hell\nSyllables, skill-a-holic (kill \'em all with)\nThis flippity dippity-hippity hip-hop, you don\'t really wanna get into a pissin\' match\nWith this rappity brat, packin\' a MAC in the back of the Ac\', backpack rap crap, yap-yap, yackety-yack\nAnd at the exact same time, I attempt these lyrical acrobat stunts while I\'m practicin\' that\nI\'ll still be able to break a mother- table over the back of a couple of - and crack it in half\nOnly realized it was ironic, I was signed to Aftermath after the fact\nHow could I not blow? All I do is drop F-bombs, feel my wrath of attack\nRappers are havin\' a rough time period, here\'s a maxi pad\nIt\'s actually disastrously bad for the wack while I\'m masterfully constructin\' this masterpièce\n\'Cause I\'m beginnin\' to feel like a Rap God, Rap God\nAll my people from the front to the back nod, back nod\nNow, who thinks their arms are long enough to slap box, slap box?\nLet me show you maintainin\' this sh- ain\'t that hard, that hard\nEverybody want the key and the secret to rap immortality like Ι have got\nWell, to be truthful the blueprint\'s, simply rage and youthful exuberance\nEverybody loves to root for a nuisance, hit the Earth like an asteroid\nDid nothin\' but shoot for the Moon since (pew)\nMCs get taken to school with this music \'cause I use it as a vehicle to, \"Bus the rhyme\"\nNow I lead a new school full of students\nMe? I\'m a product of Rakim, Lakim Shabazz, 2Pac, N.W.A, Cube, hey Doc, Ren\nYella, Eazy, thank you, they got Slim\nInspired enough to one day grow up, blow up and be in a position\nTo meet Run–D.M.C., and induct them into the mother-\nRock and Roll Hall of Fame even though I\'ll walk in the church and burst in a ball of flames\nOnly Hall of Fame I\'ll be inducted in is the alcohol of fame on the wall of (shame)\nYou - think it\'s all a game \'til I walk a flock of flames\nOff a plank and, tell me what in the - are you thinkin\'?\nLittle g-lookin\' boy, so g- I can barely say it with a straight face, lookin\' boy (haha)\nYou\'re witnessin\' a mass-occur like you\'re watchin\' a church gatherin\' take place, lookin\' boy\n\"Oy vey, that boy\'s g-\", that\'s all they say, lookin\' boy\nYou get a thumbs up, pat on the back and a, \"Way to go\" from your label every day, lookin\' boy\nHey, lookin\' boy, what you say, lookin\' boy? I get a, \"Hell yeah\" from Dre, lookin\' boy\nI\'ma work for everythin\' I have, never asked nobody for s-, get outta my face, lookin\' boy\nBasically, boy, you\'re never gonna be capable of keepin\' up with the same pace, lookin\' boy, \'cause\nI\'m beginnin\' to feel like a Rap God, Rap God\nAll my people from the front to the back nod, back nod\nThe way I\'m racin\' around the track, call me NASCAR, NASCAR\nDale Earnhardt of the trailer park, the White Trash God\nKneel before General Zod, this planet\'s Krypton, no, Asgard, Asgard\nSo you\'ll be Thor, and I\'ll be Odin, you rodent, I\'m omnipotent\nLet off, then I\'m reloadin\', immediately with these bombs I\'m totin\'\nAnd I should not be woken\nI\'m the walkin\' dead, but I\'m just a talkin\' head, a zombie floatin\', but I got your mom deep-\nI\'m out my Ramen Noodle, we have nothin\' in common, poodle\nI\'m a Doberman, pinch yourself in the arm and pay homage, pupil\nIt\'s me, my honesty\'s brutal\nBut it\'s honestly futile if I don\'t utilize what I do though\nFor good, at least once in a while\nSo I wanna make sure somewhere in this chicken scratch I scribble and doodle enough rhymes\nTo maybe try to help get some people through tough times\nBut I gotta keep a few punchlines just in case \'cause even you unsigned\nRappers are hungry lookin\' at me like it\'s lunchtime\nI know there was a time where once I was king of the underground\nBut I still rap like I\'m on my Pharoahe Monch grind\nSo I crunch rhymes, but sometimes when you combine\nAppeal with the skin color of mine\nYou get too big and here they come tryin\' to censor you like that one line\nI said on, \"I\'m Back\" from The Mathers LP 1 when I tried to say I\'ll take seven k- from Columbine\nPut \'em all in a line, add an AK-47, a revolver and a .9\nSee if I get away with it now that I ain\'t as big as I was, but I\'m\nMorphin\' into an immortal, comin\' through the portal\nYou\'re stuck in a time warp from 2004 though\nAnd I don\'t know what the f- that you rhyme for\nYou\'re pointless as Rapunzel with -ckin\' cornrows\nYou write normal? F- bein\' normal\nAnd I just bought a new raygun from the future\nJust to come and shoot ya, like when Fabolous made Ray J mad\n\'Cause Fab said he looked like a - at Mayweather\'s pad singin\' to a man while he played piano\nMan, oh man, that was a 24-7 special on the cable channel\nSo Ray J went straight to the radio station, the very next day, \"Hey Fab, I\'ma kill you\"\nLyrics comin\' at you at supersonic speed (J.J. Fad)\nUh, summa-lumma, dooma-lumma, you assumin\' I\'m a human\nWhat I gotta do to get it through to you? I\'m superhuman\nInnovative and I\'m made of rubber so that anythin\' you say is ricochetin\' off of me, and it\'ll glue to you and\nI\'m devastatin\', more than ever demonstratin\', how to give a mother- audience a feelin\' like it\'s levitatin\'\nNever fadin\' and I know the haters are forever waitin\' for the day that they can say I fell off, they\'ll be celebratin\'\n\'Cause I know the way to get \'em motivated, I make elevatin\' music, you make elevator music\n\"Oh, he\'s too mainstream\", well, that\'s what they do when they get jealous, they confuse it\n\"It\'s not hip-hop, it\'s pop\" \'cause I found a hella way to fuse it\nWith rock, shock rap with Doc, throw on \"Lose Yourself\" and make \'em lose it\n\"I don\'t know how to make songs like that, I don\'t know what words to use\"\nLet me know when it occurs to you while I\'m rippin\' any one of these verses that versus you\nIt\'s curtains, I\'m inadvertently hurtin\' you, how many verses I gotta murder to\nProve that if you were half as nice, your songs, you could sacrifice virgins too?\nUgh, school flunky, pill junkie, but look at the accolades these skills brung me\nFull of myself, but still hungry\nI bully myself \'cause I make me do what I put my mind to\nAnd I\'m a million leagues above you, ill when I speak in tongues\nBut it\'s still tongue-in-cheek, f- you\nI\'m drunk, so, Satan, take the f- wheel, I\'ma sleep in the front seat\nBumpin\' Heavy D and the Boyz, still \"Chunky but Funky\"\nBut in my head there\'s somethin\' I can feel tuggin\' and strugglin\'\nAngels fight with devils and here\'s what they want from me\nThey\'re askin\' me to eliminate some of the women hate\nBut if you take into consideration the bitter hatred\nI have, then you may be a little patient, and more sympathetic to the situation\nAnd understand the discrimination\nBut -uck it, life\'s handin\' you lemons? Make lemonade then\nBut if I can\'t batter the women\nHow the fu- am I supposed to bake \'em a cake, then?\nDon\'t mistake him for Satan\nIt\'s a fatal mistake if you think I need to be overseas and take a vacation\nTo trip a broad, and make her fall on her face and\nDon\'t be a -ard, be a king? Think not, why be a king when you can be a God?', 8, '2025-03-28 08:16:41', 3, 'rap-god', 6),
(22, 'Blinding Lights', 1, 15, 'uploads/artworks-Eke4dWZTIrXCkXPW-hX2ihg-t1080x1080.jpg', 'uploads/y2mate.com - The Weeknd  Blinding Lights Official Video.mp3', 'Yeah\nI\'ve been tryna call\nI\'ve been on my own for long enough\nMaybe you can show me how to love, maybe\nI\'m goin\' through withdrawals\nYou don\'t even have to do too much\nYou can turn me on with just a touch, baby\nI look around and\nSin City\'s cold and empty (oh)\nNo one\'s around to judge me (oh)\nI can\'t see clearly when you\'re gone\nI said, ooh, I\'m blinded by the lights\nNo, I can\'t sleep until I feel your touch\nI said, ooh, I\'m drowning in the night\nOh, when I\'m like this, you\'re the one I trust\n(Hey, hey, hey)\nI\'m running out of time\n\'Cause I can see the sun light up the sky\nSo I hit the road in overdrive, baby, oh\nThe city\'s cold and empty (oh)\nNo one\'s around to judge me (oh)\nI can\'t see clearly when you\'re gone\nI said, ooh, I\'m blinded by the lights\nNo, I can\'t sleep until I feel your touch\nI said, ooh, I\'m drowning in the night\nOh, when I\'m like this, you\'re the one I trust\nI\'m just walking by to let you know (by to let you know)\nI could never say it on the phone (say it on the phone)\nWill never let you go this time (ooh)\nI said, ooh, I\'m blinded by the lights\nNo, I can\'t sleep until I feel your touch\n(Hey, hey, hey)\n(Hey, hey, hey)\nI said, ooh, I\'m blinded by the lights\nNo, I can\'t sleep until I feel your touch', 10, '2025-03-28 08:27:45', 4, 'blinding-lights', 7),
(23, 'Who Knows', 1, 17, 'uploads/Who_Knows_Image.jpg', 'uploads/y2mate.com - Protoje  Who Knows ft Chronixx Official Music Video.mp3', '[Intro: Protoje & Chronixx]\nAnd this a Protoje (yeah)\nChronixx a weh you say (yeah)\nOooookkk (oh well)\n\n[Chorus: Chronixx & Protoje]\nWho knows? Who knows, who knows, who knows?\nI just go where the trade wind blows\nSending love to my friends and foes\nAnd I suppose\n\nI\'m pleased\nTo be chilling in the West Indies (How you mean?)\nJah provide all my wants and needs\nI got the sunshine, rivers and trees\nGreen leaves\nOh yeah\n\n[Verse 1: Protoje]\nWhere me see Jah me see a way\nDrastically stray from hypocrisy I say (Yeah)\nEvery man to dem own a philosophy\nI live the proper way and then mi read a chapter daily\nMan deh in a city hungry and nuh eat\nAnd food deh down a country just a drop off a di trees dem (huh)\nYou see say poverty nuh real den\nIs what the reasoning revealing\nSee Protoje Live\nGet tickets as low as $58\n\nYou might also like\nloml\nTaylor Swift\nSo Long, London\nTaylor Swift\nRed Leather\nFuture, Metro Boomin & J. Cole\n\n[Chorus: Chronixx & Protoje]\nWho knows? Who knows, who knows, who knows?\nI just go where the trade wind blows\nSending love to my friends and foes (Hello)\nAnd I suppose (Hello)\n\nI\'m pleased\nTo be chilling in the West Indies\n(How you mean?)\nJah provide all my wants and needs\nI got the sunshine, rivers and trees\nGreen leaves\nOh yeah\n\n[Verse 2: Protoje]\nWhen the rain pitta pat pon the roof\nHerb just a steam pepper pot \'pon the stew\nLife is a dream if you got gratitude\nSo go tell the regime dem can\'t stop what we do now\nInformation you think on your own\nOr else you are a slave to the things that you know\nWhat do you know if you learn everyday\nSo be careful a things weh you say\n\n[Chorus: Chronixx & Protoje]\nWho knows? Who knows, who knows, who knows?\nI just go where the trade wind blows\nSending love to my friends and foes (Hello)\nAnd I suppose (Hello)\n\n\nI\'m pleased\nTo be chilling in the West Indies\n(How you mean?)\nJah provide all my wants and needs\nI got the sunshine rivers and trees\nGreen leaves\nOh yeah\n\n[Verse 3: Protoje]\nAfrica in a we soul but a Jah inna wi heart\nIt is of importance for I \'n\' I gather\nIf we cannot show now a balance at we yaad\nHow do we propose then to carry it abroad\nCannot go to I-thiopia and you nuh have a plan\nThe building of a nation a hand a help a hand\nEveryone a love a one, every man is just a man\nIt shall be a coronation when we land, land, land\n\n[Chorus: Chronixx & Protoje]\nWho knows? Who knows, who knows, who knows?\nI just go where the trade wind blows (Yeah, man)\nSending love to my friends and foes (Hello), and I suppose (Hello)\n\nI\'m pleased\nTo be chilling in the West Indies\n(How you mean?)\nJah provide all my wants and needs\nI got the sunshine rivers and trees\nGreen leaves\nYeah\n\n\n[Outro: Chronixx & Protoje]\nAnd I say we just don\'t know\nWho knows, who knows?\nYeah man\nWho knows? Yeah\n\nWe just move with Jah every time\nI\'m pleased (and give thanks)\nTo be chilling in the West Indies\nYou see that smile on me\nJah provide all my wants and needs\nOh yeah, yeah\n\n\n', 11, '2025-04-09 12:05:40', 1, 'who-knows', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `balance` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `date`, `balance`) VALUES
(1, 'admin', 'email@email.com', '$2y$10$hgqewJRgpHAT3olUSX0il..eWh0KA1GQKJfClPB76HMW8Yl8QDdUy', 'admin', '2024-10-17 20:03:22', 0.00),
(3, 'userone', 'user1@gmail.com', '$2y$10$wBikSZZPqoBigHWNQzmKDOO/i5wyfGjEQ6zpzEbTTv1uJF3U1Cpqa', 'user', '2024-10-18 18:14:13', 0.00),
(4, 'usertwo', 'user2@gmail.com', '$2y$10$I3unWdyWv6IUZqfLzLJsYeIoowff3Gu2m9z0Puo2sTrffmKAQKEpm', 'user', '2024-10-18 19:49:00', 0.00),
(6, 'user4', 'user4@gmail.com', '$2y$10$3cA0a6GBvss0Tx3svcZxa.4.0I/9BLc17kp38CP2DZeSmC15gOBa6', 'user', '2024-11-01 16:08:51', 0.00),
(7, 'userfive', 'userfive@gmail.com', '$2y$10$Ox4UggcuAroL7sGZh1KWwunqvmw3ArBLc6cSgjjgpgbEerkg9ojAe', 'user', '2024-12-02 08:36:15', 0.00),
(14, 'user06', 'user06@gmail.com', '$2y$10$Bac0nbnwnaWMhXwLfXMhPeurDMFLzAiWpteTmw8zUyMJVzzwOMdlS', 'user', '2025-04-09 20:07:16', 0.00);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Chỉ mục cho bảng `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `category` (`category`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `song_id` (`song_id`);

--
-- Chỉ mục cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `song_id` (`song_id`);

--
-- Chỉ mục cho bảng `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `date` (`date`),
  ADD KEY `views` (`views`),
  ADD KEY `title` (`title`),
  ADD KEY `slug` (`slug`);
ALTER TABLE `songs` ADD FULLTEXT KEY `ft_lyrics` (`lyrics`);
ALTER TABLE `songs` ADD FULLTEXT KEY `ft_search` (`title`,`lyrics`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `role` (`role`),
  ADD KEY `date` (`date`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT cho bảng `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`);

--
-- Các ràng buộc cho bảng `artists`
--
ALTER TABLE `artists`
  ADD CONSTRAINT `artists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`);

--
-- Các ràng buộc cho bảng `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

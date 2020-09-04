-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:8889
-- Время создания: Сен 04 2020 г., 21:47
-- Версия сервера: 5.7.26
-- Версия PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mlm`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cycle`
--

CREATE TABLE `cycle` (
  `id` int(11) NOT NULL,
  `user_status` int(11) NOT NULL,
  `user1_status` int(11) NOT NULL,
  `user2_status` int(11) NOT NULL,
  `user3_status` int(11) NOT NULL,
  `user4_status` int(11) NOT NULL,
  `user5_status` int(11) NOT NULL,
  `user6_status` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `plan11`
--

CREATE TABLE `plan11` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_oplaty` tinyint(1) NOT NULL DEFAULT '0',
  `left_user_id` int(11) NOT NULL,
  `status_left` tinyint(1) NOT NULL DEFAULT '0',
  `right_user_id` int(11) NOT NULL,
  `status_right` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `plan110`
--

CREATE TABLE `plan110` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_oplaty` tinyint(1) NOT NULL DEFAULT '0',
  `left_user_id` int(11) NOT NULL,
  `status_left` tinyint(1) NOT NULL DEFAULT '0',
  `right_user_id` int(11) NOT NULL,
  `status_right` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `pay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `subject`
--

INSERT INTO `subject` (`id`, `title`, `pay`) VALUES
(1, 'first_plan', 11),
(2, 'second_plan', 110);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password_hash` varchar(256) NOT NULL,
  `auth_key` varchar(256) NOT NULL,
  `verification_token` varchar(256) NOT NULL,
  `firstname` varchar(128) NOT NULL,
  `lastname` varchar(128) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `payer` varchar(35) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '10',
  `role` int(11) NOT NULL DEFAULT '10',
  `created_at` varchar(32) NOT NULL,
  `updated_at` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `verification_token`, `firstname`, `lastname`, `phone`, `payer`, `status`, `role`, `created_at`, `updated_at`) VALUES
(1, 'ciel', 'vl241095@gmail.com', '$2y$13$yywMHGLDwCr.YbPXoKp2Muu98dznkmxkuJh0pMDF/v6KvVzMMTBom', 'Bq8Gm5WUg_Yhm1Cy-vO0icLeHuGn7Cha', 'bVOvPEnK_Rcd2yHZHb7y5kg4O6m23IMM_1598898847', 'Vladislav', 'Gordin', '+7 (996) 323-3635', '', 10, 20, '1598898847', '1598898847'),
(3, 'User', 'mail@mail.ru', '$2y$13$ofIc8FcBgEj//peyACFrEOBecK.6Zp9MEYo4C/Pv3F38F7Y3/oCgW', 'VmA4IRfClzMCNM_77X_fTNiEcZtJgqos', 'IZ8BS4uu-ZtzOGRF0ZPedJGwRTVURDms_1599230684', 'user', 'User', '+7 (999) 999-9999', '999999999999999', 10, 10, '1599230684', '1599230684'),
(4, 'user1', 'user@mail.ru', '$2y$13$ceImrqFQgRJDv.Udk.RftOzfsV/LoGUoKGNDmKNaTKuqVAt2ijwye', 'UaoKgsSokKWkbYjGJt76fXAt01-2_aZl', 'c-eydNQ9qTCpN5HzwjdfmkYfAZKcyZ6-_1599230820', 'User1', 'User1', '+7 (999) 888-8888', '8888888888888', 10, 10, '1599230820', '1599230820'),
(5, 'user2', 'mail3@mail.ru', '$2y$13$q1qrurN6CFGBWJEDOl4ciOMcu7k6AEWfLsiUldN8QyQ0mhV3T07qi', '7RSlqTF6gi0_lei8C7e2Lm5J4v4yDm2a', '7gdVSidHYBuS_t7m25XwSS4bEmr1_29S_1599231527', 'user2', 'user2', '+7 (988) 876-5666', '999898678657654765', 10, 10, '1599231527', '1599231527');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cycle`
--
ALTER TABLE `cycle`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `plan11`
--
ALTER TABLE `plan11`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `plan110`
--
ALTER TABLE `plan110`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cycle`
--
ALTER TABLE `cycle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `plan11`
--
ALTER TABLE `plan11`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `plan110`
--
ALTER TABLE `plan110`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

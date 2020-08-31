-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:8889
-- Время создания: Сен 01 2020 г., 00:56
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
-- Структура таблицы `participant`
--

CREATE TABLE `participant` (
  `id` int(11) UNSIGNED NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` smallint(6) NOT NULL,
  `eligible_to_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rwd_basic`
--

CREATE TABLE `rwd_basic` (
  `id` int(10) UNSIGNED NOT NULL,
  `usr_rewarded_id` int(11) UNSIGNED NOT NULL,
  `subject_id` int(11) NOT NULL,
  `subject_type` varchar(128) NOT NULL,
  `value` decimal(10,4) NOT NULL,
  `level` int(11) NOT NULL,
  `status` varchar(64) NOT NULL DEFAULT 'pending',
  `status_reason` varchar(128) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `is_final` tinyint(1) NOT NULL DEFAULT '1',
  `approved_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

CREATE TABLE `subject` (
  `id` int(10) UNSIGNED NOT NULL,
  `participant_id` int(11) UNSIGNED DEFAULT NULL,
  `amount` float NOT NULL,
  `amount_vat` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `status` varchar(10) NOT NULL,
  `created_at` varchar(32) NOT NULL,
  `updated_at` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `verification_token`, `firstname`, `lastname`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ciel', 'vl241095@gmail.com', '$2y$13$yywMHGLDwCr.YbPXoKp2Muu98dznkmxkuJh0pMDF/v6KvVzMMTBom', 'Bq8Gm5WUg_Yhm1Cy-vO0icLeHuGn7Cha', 'bVOvPEnK_Rcd2yHZHb7y5kg4O6m23IMM_1598898847', 'Vladislav', 'Gordin', '+7 (996) 323-3635', '10', '1598898847', '1598898847');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rwd_basic`
--
ALTER TABLE `rwd_basic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usr_rewarded_id_UNIQUE` (`subject_id`,`subject_type`,`level`),
  ADD KEY `fk_rwd_basic_usr_identity1_idx` (`usr_rewarded_id`);

--
-- Индексы таблицы `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_participant_idx` (`participant_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rwd_basic`
--
ALTER TABLE `rwd_basic`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `rwd_basic`
--
ALTER TABLE `rwd_basic`
  ADD CONSTRAINT `fk_rwd_basic_usr_identity1` FOREIGN KEY (`usr_rewarded_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `fk_subject_participant` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

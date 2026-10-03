

-- 01
-- Supplied Material

INSERT INTO PieceOfMaterial (piece_of_material_id, material_type, material_name) VALUES
(1,  'Supplied_Material', 'SLAB69'),
(2,  'Supplied_Material', 'SLAB73'),
(3,  'Supplied_Material', 'SLAB68'),
(4,  'Supplied_Material', 'SLAB70'),
(5,  'Supplied_Material', 'SLAB74'),
(6,  'Supplied_Material', 'SLAB75'),
(7,  'Supplied_Material', 'PIPEP3'),
(8,  'Supplied_Material', 'PIPEP2'),
(9,  'Supplied_Material', 'IMPELI'),
(10, 'Supplied_Material', 'CASEC1'),
(11, 'Supplied_Material', 'PIPEP1'),
(12, 'Supplied_Material', 'PIPE205'),
(13, 'Supplied_Material', 'ELBO758'),
(14, 'Supplied_Material', 'COVKBR');

INSERT INTO Supplied_Material
    (piece_of_material_id, material_id, product_form, heat, grade, foundry, service_history, section_thickness)
VALUES
(1,  'SLAB69',  'Static Cast Slab',            '69',  'CF-3',  'ESCO',     'new',          76),
(2,  'SLAB73',  'Static Cast Slab',            '73',  'CF-8',  'ESCO',     'new',          76),
(3,  'SLAB68',  'Static Cast Slab',            '68',  'CF-8',  'ESCO',     'new',          76),
(4,  'SLAB70',  'Static Cast Slab',            '70',  'CF-8M', 'ESCO',     'new',          76),
(5,  'SLAB74',  'Static Cast Slab',            '74',  'CF-8M', 'ESCO',     'new',          76),
(6,  'SLAB75',  'Static Cast Slab',            '75',  'CF-8M', 'ESCO',     'new',          76),
(7,  'PIPEP3',  'Centrifugally Cast Pipes',    'P3',  'CF-3',  'SANDUSKY', 'new',          76),
(8,  'PIPEP2',  'Centrifugally Cast Pipes',    'P2',  'CF-3',  'FAM',      'new',          73),
(9,  'IMPELI',  'Static Cast Pump Impeller',   'I',   'CF-3',  'ESCO',     'new',          NULL),
(10, 'CASEC1',  'Static Cast Pump Casing',     'C1',  'CF-8',  'ESCO',     'new',          57),
(11, 'PIPEP1',  'Centrifugally Cast Pipes',    'P1',  'CF-8',  'ESCO',     'new',          63),
(12, 'PIPE205', 'Centrifugally Cast Pipes',    '205', 'CF-8M', NULL,       'new',          25),
(13, 'ELBO758', 'Static Cast Elbow',           '758', 'CF-8M', NULL,       'new',          30),
(14, 'COVKBR',  'Reactor Pump Cover Plate',    'KBR', 'CF-8',  'GF',       'service-aged', NULL);


-- 02
-- Characterized Material
INSERT INTO PieceOfMaterial (piece_of_material_id, material_type, material_name) VALUES
(15, 'Characterized_Material', 'SLAB69_C'),
(16, 'Characterized_Material', 'SLAB73_C'),
(17, 'Characterized_Material', 'SLAB68_C'),
(18, 'Characterized_Material', 'SLAB70_C'),
(19, 'Characterized_Material', 'SLAB74_C'),
(20, 'Characterized_Material', 'SLAB75_C'),
(21, 'Characterized_Material', 'PIPEP3_C'),
(22, 'Characterized_Material', 'PIPEP2_C'),
(23, 'Characterized_Material', 'IMPELI_C'),
(24, 'Characterized_Material', 'CASEC1_C'),
(25, 'Characterized_Material', 'PIPEP1_C'),
(26, 'Characterized_Material', 'PIPE205_C'),
(27, 'Characterized_Material', 'ELBO758_C'),
(28, 'Characterized_Material', 'COVKBR_C');

INSERT INTO Characterized_Material
    (piece_of_material_id, chemical_characterization_status, ferrite_characterization_status,
     hardness_characterization_status, grain_structure_characterization_status)
VALUES
(15, 'Complete', 'Complete', 'Complete', 'Complete'),   -- CHAR_SLAB69
(16, 'Complete', 'Complete', 'Complete', 'Complete'),   -- CHAR_SLAB73
(17, 'Complete', 'Complete', 'Complete', 'Complete'),   -- CHAR_SLAB68
(18, 'Complete', 'Complete', 'Complete', 'Complete'),   -- CHAR_SLAB70
(19, 'Complete', 'Complete', 'Complete', 'Complete'),   -- CHAR_SLAB74
(20, 'Complete', 'Complete', 'Complete', 'Complete'),   -- CHAR_SLAB75
(21, 'Complete', 'Complete', 'Complete', 'Complete'),   -- CHAR_PIPEP3
(22, 'Complete', 'Complete', 'Complete', 'Complete'),   -- CHAR_PIPEP2
(23, 'Complete', 'Complete', 'Complete', 'Complete'),   -- CHAR_IMPELI
(24, 'Complete', 'Complete', 'Complete', 'Complete'),   -- CHAR_CASEC1
(25, 'Complete', 'Complete', 'Complete', 'Complete'),   -- CHAR_PIPEP1
(26, 'Complete', 'Complete', 'Complete', 'Complete'),   -- CHAR_PIPE205
(27, 'Complete', 'Complete', 'Complete', 'Complete'),   -- CHAR_ELBO758
(28, 'Complete', 'Complete', 'Complete', 'Complete');   -- CHAR_COVKBR

-- verification query
SELECT
    cm.piece_of_material_id,
    pom.material_name,
    cm.chemical_characterization_status,
    cm.ferrite_characterization_status,
    cm.hardness_characterization_status,
    cm.grain_structure_characterization_status
FROM Characterized_Material cm
JOIN PieceOfMaterial pom
    ON pom.piece_of_material_id = cm.piece_of_material_id
ORDER BY cm.piece_of_material_id;

-- 03
-- Tensile Specimen
INSERT INTO PieceOfMaterial (piece_of_material_id, material_type, material_name) VALUES
(29, 'Tensile_Specimen', 'I1V–01'),
(30, 'Tensile_Specimen', 'I1V–02'),
(31, 'Tensile_Specimen', 'I2V–01'),
(32, 'Tensile_Specimen', 'I2V–02'),
(33, 'Tensile_Specimen', 'I3C–01'),
(34, 'Tensile_Specimen', 'I2V–23'),
(35, 'Tensile_Specimen', 'I3C–14'),
(36, 'Tensile_Specimen', 'I3V–38'),
(37, 'Tensile_Specimen', 'I3V–39'),
(38, 'Tensile_Specimen', 'I1V–26'),
(39, 'Tensile_Specimen', 'I1V–27'),
(40, 'Tensile_Specimen', 'I2V–19'),
(41, 'Tensile_Specimen', 'I2V–03'),
(42, 'Tensile_Specimen', 'I2V–06'),
(43, 'Tensile_Specimen', 'I3C–02'),
(44, 'Tensile_Specimen', 'I2V–24'),
(45, 'Tensile_Specimen', 'I3C–15'),
(46, 'Tensile_Specimen', 'I3V–40'),
(47, 'Tensile_Specimen', 'I1V–28'),
(48, 'Tensile_Specimen', 'I1V–29'),
(49, 'Tensile_Specimen', 'I2V–20'),
(50, 'Tensile_Specimen', 'P21T–01'),
(51, 'Tensile_Specimen', 'P23T–01'),
(52, 'Tensile_Specimen', 'P22A–01'),
(53, 'Tensile_Specimen', 'P23A–01'),
(54, 'Tensile_Specimen', 'P22T–16'),
(55, 'Tensile_Specimen', 'P21A–31'),
(56, 'Tensile_Specimen', 'P25A–28'),
(57, 'Tensile_Specimen', 'P21A–36'),
(58, 'Tensile_Specimen', 'P24T–14'),
(59, 'Tensile_Specimen', 'P25T–10'),
(60, 'Tensile_Specimen', 'P22A–36'),
(61, 'Tensile_Specimen', 'P21A–19'),
(62, 'Tensile_Specimen', 'P22T–04'),
(63, 'Tensile_Specimen', 'P23A–14'),
(64, 'Tensile_Specimen', 'P23A–26'),
(65, 'Tensile_Specimen', 'P22T–11'),
(66, 'Tensile_Specimen', 'P22A–13'),
(67, 'Tensile_Specimen', 'P24A–32'),
(68, 'Tensile_Specimen', 'P24T–05'),
(69, 'Tensile_Specimen', 'P24A–04'),
(70, 'Tensile_Specimen', 'P21T–02'),
(71, 'Tensile_Specimen', 'P23T–02'),
(72, 'Tensile_Specimen', 'P22A–02'),
(73, 'Tensile_Specimen', 'P23A–02'),
(74, 'Tensile_Specimen', 'P21A–32'),
(75, 'Tensile_Specimen', 'P21A–33'),
(76, 'Tensile_Specimen', 'P24T–16'),
(77, 'Tensile_Specimen', 'P21A–37'),
(78, 'Tensile_Specimen', 'P22T–17'),
(79, 'Tensile_Specimen', 'P21A–14'),
(80, 'Tensile_Specimen', 'P21A–15'),
(81, 'Tensile_Specimen', 'P21A–16'),
(82, 'Tensile_Specimen', 'P25T–12'),
(83, 'Tensile_Specimen', 'P21A–18'),
(84, 'Tensile_Specimen', 'P21T–08'),
(85, 'Tensile_Specimen', 'P22T–05'),
(86, 'Tensile_Specimen', 'P23A–15'),
(87, 'Tensile_Specimen', 'P23A–27'),
(88, 'Tensile_Specimen', 'P22T–12'),
(89, 'Tensile_Specimen', 'P24A–30'),
(90, 'Tensile_Specimen', 'P24A–33'),
(91, 'Tensile_Specimen', 'P24T–06'),
(92, 'Tensile_Specimen', 'P24A–05'),
(93, 'Tensile_Specimen', '693–40'),
(94, 'Tensile_Specimen', '693–41'),
(95, 'Tensile_Specimen', '694–30'),
(96, 'Tensile_Specimen', '694–31'),
(97, 'Tensile_Specimen', '69–135'),
(98, 'Tensile_Specimen', '694–21'),
(99, 'Tensile_Specimen', '694–25'),
(100, 'Tensile_Specimen', '692–40'),
(101, 'Tensile_Specimen', '692–41'),
(102, 'Tensile_Specimen', '69–245'),
(103, 'Tensile_Specimen', '691–28'),
(104, 'Tensile_Specimen', '691–29'),
(105, 'Tensile_Specimen', '69–230'),
(106, 'Tensile_Specimen', '692–25'),
(107, 'Tensile_Specimen', '692–26'),
(108, 'Tensile_Specimen', '694–06'),
(109, 'Tensile_Specimen', '694–07'),
(110, 'Tensile_Specimen', '694–08'),
(111, 'Tensile_Specimen', '69–119'),
(112, 'Tensile_Specimen', '693–12'),
(113, 'Tensile_Specimen', '693–13'),
(114, 'Tensile_Specimen', '69–130'),
(115, 'Tensile_Specimen', '692–16'),
(116, 'Tensile_Specimen', '692–17'),
(117, 'Tensile_Specimen', '692–15'),
(118, 'Tensile_Specimen', '692–22'),
(119, 'Tensile_Specimen', '692–23'),
(120, 'Tensile_Specimen', '69–109'),
(121, 'Tensile_Specimen', '691–04'),
(122, 'Tensile_Specimen', '691–05'),
(123, 'Tensile_Specimen', '693–42'),
(124, 'Tensile_Specimen', '694–40'),
(125, 'Tensile_Specimen', '694–32'),
(126, 'Tensile_Specimen', '694–33'),
(127, 'Tensile_Specimen', '69–236'),
(128, 'Tensile_Specimen', '694–26'),
(129, 'Tensile_Specimen', '694–27'),
(130, 'Tensile_Specimen', '692–42'),
(131, 'Tensile_Specimen', '694–39'),
(132, 'Tensile_Specimen', '69–246'),
(133, 'Tensile_Specimen', '692–28'),
(134, 'Tensile_Specimen', '692–29'),
(135, 'Tensile_Specimen', '69–130'),
(136, 'Tensile_Specimen', '692–27'),
(137, 'Tensile_Specimen', '694–09'),
(138, 'Tensile_Specimen', '69–120'),
(139, 'Tensile_Specimen', '693–14'),
(140, 'Tensile_Specimen', '693–15'),
(141, 'Tensile_Specimen', '69–270'),
(142, 'Tensile_Specimen', '692–18'),
(143, 'Tensile_Specimen', '692–24'),
(144, 'Tensile_Specimen', '69–110'),
(145, 'Tensile_Specimen', '691–06'),
(146, 'Tensile_Specimen', '692–09'),
(147, 'Tensile_Specimen', '18–11'),
(148, 'Tensile_Specimen', '18–12'),
(149, 'Tensile_Specimen', '18–22'),
(150, 'Tensile_Specimen', '13–12'),
(151, 'Tensile_Specimen', '13–21'),
(152, 'Tensile_Specimen', '13–22'),
(153, 'Tensile_Specimen', '15–11'),
(154, 'Tensile_Specimen', '15–12'),
(155, 'Tensile_Specimen', '15–21'),
(156, 'Tensile_Specimen', '15–22'),
(157, 'Tensile_Specimen', '16–21'),
(158, 'Tensile_Specimen', '17–21'),
(159, 'Tensile_Specimen', 'P13T–01'),
(160, 'Tensile_Specimen', 'P13T–03'),
(161, 'Tensile_Specimen', 'P11A–01'),
(162, 'Tensile_Specimen', 'P13A–01'),
(163, 'Tensile_Specimen', 'P14T–09'),
(164, 'Tensile_Specimen', 'P11A–25'),
(165, 'Tensile_Specimen', 'P14A–26'),
(166, 'Tensile_Specimen', 'P11A–28'),
(167, 'Tensile_Specimen', 'P11A–29'),
(168, 'Tensile_Specimen', 'P11A–10'),
(169, 'Tensile_Specimen', 'P11T–06'),
(170, 'Tensile_Specimen', 'P14T–08'),
(171, 'Tensile_Specimen', 'P11A–13'),
(172, 'Tensile_Specimen', 'P12A–25'),
(173, 'Tensile_Specimen', 'P12T–05'),
(174, 'Tensile_Specimen', 'P12T–06'),
(175, 'Tensile_Specimen', 'P12A–08'),
(176, 'Tensile_Specimen', 'P12A–09'),
(177, 'Tensile_Specimen', 'P12T–11'),
(178, 'Tensile_Specimen', 'P12A–13'),
(179, 'Tensile_Specimen', 'P12A–14'),
(180, 'Tensile_Specimen', 'P13T–07'),
(181, 'Tensile_Specimen', 'P13A–07'),
(182, 'Tensile_Specimen', 'P13T–02'),
(183, 'Tensile_Specimen', 'P14T–01'),
(184, 'Tensile_Specimen', 'P11A–02'),
(185, 'Tensile_Specimen', 'P13A–02'),
(186, 'Tensile_Specimen', 'P14T–10'),
(187, 'Tensile_Specimen', 'P11A–26'),
(188, 'Tensile_Specimen', 'P14A–27'),
(189, 'Tensile_Specimen', 'P11A–27'),
(190, 'Tensile_Specimen', 'P11A–30'),
(191, 'Tensile_Specimen', 'P11A–09'),
(192, 'Tensile_Specimen', 'P12A–19'),
(193, 'Tensile_Specimen', 'P12A–22'),
(194, 'Tensile_Specimen', 'P11A–12'),
(195, 'Tensile_Specimen', 'P12A–26'),
(196, 'Tensile_Specimen', 'P12T–08'),
(197, 'Tensile_Specimen', 'P12A–10'),
(198, 'Tensile_Specimen', 'P12A–11'),
(199, 'Tensile_Specimen', 'P12T–12'),
(200, 'Tensile_Specimen', 'P14A–22'),
(201, 'Tensile_Specimen', 'P14A–23'),
(202, 'Tensile_Specimen', 'P13T–08'),
(203, 'Tensile_Specimen', 'P13A–08'),
(204, 'Tensile_Specimen', '683–40'),
(205, 'Tensile_Specimen', '683–41'),
(206, 'Tensile_Specimen', '683–33'),
(207, 'Tensile_Specimen', '684–31'),
(208, 'Tensile_Specimen', '68–145'),
(209, 'Tensile_Specimen', '684–21'),
(210, 'Tensile_Specimen', '684–22'),
(211, 'Tensile_Specimen', '682–41'),
(212, 'Tensile_Specimen', '684–39'),
(213, 'Tensile_Specimen', '68–264'),
(214, 'Tensile_Specimen', '681–28'),
(215, 'Tensile_Specimen', '681–29'),
(216, 'Tensile_Specimen', '68–230'),
(217, 'Tensile_Specimen', '682–25'),
(218, 'Tensile_Specimen', '682–26'),
(219, 'Tensile_Specimen', '684–06'),
(220, 'Tensile_Specimen', '684–07'),
(221, 'Tensile_Specimen', '684–08'),
(222, 'Tensile_Specimen', '68–129'),
(223, 'Tensile_Specimen', '684–10'),
(224, 'Tensile_Specimen', '684–11'),
(225, 'Tensile_Specimen', '68–139'),
(226, 'Tensile_Specimen', '682–16'),
(227, 'Tensile_Specimen', '682–17'),
(228, 'Tensile_Specimen', '682–15'),
(229, 'Tensile_Specimen', '682–22'),
(230, 'Tensile_Specimen', '682–23'),
(231, 'Tensile_Specimen', '68–119'),
(232, 'Tensile_Specimen', '681–04'),
(233, 'Tensile_Specimen', '681–05'),
(234, 'Tensile_Specimen', '683–42'),
(235, 'Tensile_Specimen', '684–40'),
(236, 'Tensile_Specimen', '684–32'),
(237, 'Tensile_Specimen', '684–33'),
(238, 'Tensile_Specimen', '68–246'),
(239, 'Tensile_Specimen', '684–23'),
(240, 'Tensile_Specimen', '684–24'),
(241, 'Tensile_Specimen', '682–40'),
(242, 'Tensile_Specimen', '682–42'),
(243, 'Tensile_Specimen', '68–263'),
(244, 'Tensile_Specimen', '682–28'),
(245, 'Tensile_Specimen', '682–29'),
(246, 'Tensile_Specimen', '68–130'),
(247, 'Tensile_Specimen', '682–27'),
(248, 'Tensile_Specimen', '684–09'),
(249, 'Tensile_Specimen', '68–130'),
(250, 'Tensile_Specimen', '684–12'),
(251, 'Tensile_Specimen', '684–15'),
(252, 'Tensile_Specimen', '68–140'),
(253, 'Tensile_Specimen', '682–18'),
(254, 'Tensile_Specimen', '682–24'),
(255, 'Tensile_Specimen', '68–120'),
(256, 'Tensile_Specimen', '681–06'),
(257, 'Tensile_Specimen', '682–09'),
(258, 'Tensile_Specimen', '733–40'),
(259, 'Tensile_Specimen', '733–41'),
(260, 'Tensile_Specimen', '734–23'),
(261, 'Tensile_Specimen', '734–24'),
(262, 'Tensile_Specimen', '732–25'),
(263, 'Tensile_Specimen', '732–26'),
(264, 'Tensile_Specimen', '734–06'),
(265, 'Tensile_Specimen', '734–07'),
(266, 'Tensile_Specimen', '73–119'),
(267, 'Tensile_Specimen', '732–16'),
(268, 'Tensile_Specimen', '732–17'),
(269, 'Tensile_Specimen', '732–15'),
(270, 'Tensile_Specimen', '732–22'),
(271, 'Tensile_Specimen', '73–109'),
(272, 'Tensile_Specimen', '731–04'),
(273, 'Tensile_Specimen', '731–05'),
(274, 'Tensile_Specimen', '733–42'),
(275, 'Tensile_Specimen', '734–40'),
(276, 'Tensile_Specimen', '734–19'),
(277, 'Tensile_Specimen', '734–22'),
(278, 'Tensile_Specimen', '732–27'),
(279, 'Tensile_Specimen', '734–08'),
(280, 'Tensile_Specimen', '734–09'),
(281, 'Tensile_Specimen', '73–120'),
(282, 'Tensile_Specimen', '732–18'),
(283, 'Tensile_Specimen', '732–23'),
(284, 'Tensile_Specimen', '732–24'),
(285, 'Tensile_Specimen', '73–110'),
(286, 'Tensile_Specimen', '731–06'),
(287, 'Tensile_Specimen', '732–09'),
(288, 'Tensile_Specimen', '205–26'),
(289, 'Tensile_Specimen', '205–27'),
(290, 'Tensile_Specimen', '205–30'),
(291, 'Tensile_Specimen', '205–25'),
(292, 'Tensile_Specimen', '205–28'),
(293, 'Tensile_Specimen', '205–29'),
(294, 'Tensile_Specimen', '743–40'),
(295, 'Tensile_Specimen', '743–41'),
(296, 'Tensile_Specimen', '743–36'),
(297, 'Tensile_Specimen', '744–34'),
(298, 'Tensile_Specimen', '74–135'),
(299, 'Tensile_Specimen', '744–21'),
(300, 'Tensile_Specimen', '744–25'),
(301, 'Tensile_Specimen', '742–42'),
(302, 'Tensile_Specimen', '744–39'),
(303, 'Tensile_Specimen', '74–245'),
(304, 'Tensile_Specimen', '741–28'),
(305, 'Tensile_Specimen', '741–29'),
(306, 'Tensile_Specimen', '74–230'),
(307, 'Tensile_Specimen', '742–25'),
(308, 'Tensile_Specimen', '742–26'),
(309, 'Tensile_Specimen', '744–07'),
(310, 'Tensile_Specimen', '744–08'),
(311, 'Tensile_Specimen', '74–119'),
(312, 'Tensile_Specimen', '743–13'),
(313, 'Tensile_Specimen', '743–14'),
(314, 'Tensile_Specimen', '74–130'),
(315, 'Tensile_Specimen', '742–16'),
(316, 'Tensile_Specimen', '742–17'),
(317, 'Tensile_Specimen', '742–22'),
(318, 'Tensile_Specimen', '742–23'),
(319, 'Tensile_Specimen', '74–110'),
(320, 'Tensile_Specimen', '741–04'),
(321, 'Tensile_Specimen', '741–05'),
(322, 'Tensile_Specimen', '744–40'),
(323, 'Tensile_Specimen', '743–42'),
(324, 'Tensile_Specimen', '744–35'),
(325, 'Tensile_Specimen', '744–36'),
(326, 'Tensile_Specimen', '74–236'),
(327, 'Tensile_Specimen', '744–26'),
(328, 'Tensile_Specimen', '744–27'),
(329, 'Tensile_Specimen', '742–40'),
(330, 'Tensile_Specimen', '742–41'),
(331, 'Tensile_Specimen', '74–246'),
(332, 'Tensile_Specimen', '742–28'),
(333, 'Tensile_Specimen', '742–29'),
(334, 'Tensile_Specimen', '74–130'),
(335, 'Tensile_Specimen', '742–27'),
(336, 'Tensile_Specimen', '744–06'),
(337, 'Tensile_Specimen', '744–09'),
(338, 'Tensile_Specimen', '74–120'),
(339, 'Tensile_Specimen', '744–18'),
(340, 'Tensile_Specimen', '743–15'),
(341, 'Tensile_Specimen', '74–270'),
(342, 'Tensile_Specimen', '742–18'),
(343, 'Tensile_Specimen', '742–15'),
(344, 'Tensile_Specimen', '742–24'),
(345, 'Tensile_Specimen', '74–109'),
(346, 'Tensile_Specimen', '741–06'),
(347, 'Tensile_Specimen', '742–09'),
(348, 'Tensile_Specimen', '753–40'),
(349, 'Tensile_Specimen', '753–41'),
(350, 'Tensile_Specimen', '753–30'),
(351, 'Tensile_Specimen', '754–28'),
(352, 'Tensile_Specimen', '75–135'),
(353, 'Tensile_Specimen', '754–21'),
(354, 'Tensile_Specimen', '754–25'),
(355, 'Tensile_Specimen', '752–41'),
(356, 'Tensile_Specimen', '754–39'),
(357, 'Tensile_Specimen', '75–245'),
(358, 'Tensile_Specimen', '751–28'),
(359, 'Tensile_Specimen', '751–29'),
(360, 'Tensile_Specimen', '75–230'),
(361, 'Tensile_Specimen', '752–25'),
(362, 'Tensile_Specimen', '752–26'),
(363, 'Tensile_Specimen', '754–06'),
(364, 'Tensile_Specimen', '754–07'),
(365, 'Tensile_Specimen', '754–08'),
(366, 'Tensile_Specimen', '75–119'),
(367, 'Tensile_Specimen', '753–10'),
(368, 'Tensile_Specimen', '753–11'),
(369, 'Tensile_Specimen', '75–130'),
(370, 'Tensile_Specimen', '752–16'),
(371, 'Tensile_Specimen', '752–17'),
(372, 'Tensile_Specimen', '752–15'),
(373, 'Tensile_Specimen', '752–22'),
(374, 'Tensile_Specimen', '752–23'),
(375, 'Tensile_Specimen', '75–109'),
(376, 'Tensile_Specimen', '751–04'),
(377, 'Tensile_Specimen', '751–05'),
(378, 'Tensile_Specimen', '754–40'),
(379, 'Tensile_Specimen', '753–42'),
(380, 'Tensile_Specimen', '754–29'),
(381, 'Tensile_Specimen', '754–30'),
(382, 'Tensile_Specimen', '75–236'),
(383, 'Tensile_Specimen', '754–26'),
(384, 'Tensile_Specimen', '754–27'),
(385, 'Tensile_Specimen', '752–40'),
(386, 'Tensile_Specimen', '752–42'),
(387, 'Tensile_Specimen', '75–246'),
(388, 'Tensile_Specimen', '752–28'),
(389, 'Tensile_Specimen', '752–29'),
(390, 'Tensile_Specimen', '75–130'),
(391, 'Tensile_Specimen', '752–27'),
(392, 'Tensile_Specimen', '754–09'),
(393, 'Tensile_Specimen', '75–120'),
(394, 'Tensile_Specimen', '753–12'),
(395, 'Tensile_Specimen', '754–12'),
(396, 'Tensile_Specimen', '75–270'),
(397, 'Tensile_Specimen', '752–18'),
(398, 'Tensile_Specimen', '752–24'),
(399, 'Tensile_Specimen', '75–110'),
(400, 'Tensile_Specimen', '751–06'),
(401, 'Tensile_Specimen', '752–09');



INSERT INTO Tensile_Specimen
    (piece_of_material_id, specimen_id, material_id, test_block_id,
     sub_block_id, test_blank_id, specimen_type, specimen_geometry,
     orientation, location_region)
VALUES
(29, 'I1V–01', 'IMPELI-C-E001', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(30, 'I1V–02', 'IMPELI-C-E002', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(31, 'I2V–01', 'IMPELI-C-E003', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(32, 'I2V–02', 'IMPELI-C-E004', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(33, 'I3C–01', 'IMPELI-C-E005', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(34, 'I2V–23', 'IMPELI-C-E006', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(35, 'I3C–14', 'IMPELI-C-E007', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(36, 'I3V–38', 'IMPELI-C-E008', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(37, 'I3V–39', 'IMPELI-C-E009', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(38, 'I1V–26', 'IMPELI-C-E010', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(39, 'I1V–27', 'IMPELI-C-E011', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(40, 'I2V–19', 'IMPELI-C-E012', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(41, 'I2V–03', 'IMPELI-C-E013', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(42, 'I2V–06', 'IMPELI-C-E014', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(43, 'I3C–02', 'IMPELI-C-E015', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(44, 'I2V–24', 'IMPELI-C-E016', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(45, 'I3C–15', 'IMPELI-C-E017', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(46, 'I3V–40', 'IMPELI-C-E018', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(47, 'I1V–28', 'IMPELI-C-E019', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(48, 'I1V–29', 'IMPELI-C-E020', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(49, 'I2V–20', 'IMPELI-C-E021', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(50, 'P21T–01', 'PIPEP2-C-E022', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(51, 'P23T–01', 'PIPEP2-C-E023', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(52, 'P22A–01', 'PIPEP2-C-E024', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(53, 'P23A–01', 'PIPEP2-C-E025', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(54, 'P22T–16', 'PIPEP2-C-E026', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(55, 'P21A–31', 'PIPEP2-C-E027', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(56, 'P25A–28', 'PIPEP2-C-E028', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(57, 'P21A–36', 'PIPEP2-C-E029', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(58, 'P24T–14', 'PIPEP2-C-E030', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(59, 'P25T–10', 'PIPEP2-C-E031', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(60, 'P22A–36', 'PIPEP2-C-E032', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(61, 'P21A–19', 'PIPEP2-C-E033', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(62, 'P22T–04', 'PIPEP2-C-E034', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(63, 'P23A–14', 'PIPEP2-C-E035', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(64, 'P23A–26', 'PIPEP2-C-E036', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(65, 'P22T–11', 'PIPEP2-C-E037', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(66, 'P22A–13', 'PIPEP2-C-E038', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(67, 'P24A–32', 'PIPEP2-C-E039', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(68, 'P24T–05', 'PIPEP2-C-E040', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(69, 'P24A–04', 'PIPEP2-C-E041', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(70, 'P21T–02', 'PIPEP2-C-E042', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(71, 'P23T–02', 'PIPEP2-C-E043', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(72, 'P22A–02', 'PIPEP2-C-E044', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(73, 'P23A–02', 'PIPEP2-C-E045', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(74, 'P21A–32', 'PIPEP2-C-E046', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(75, 'P21A–33', 'PIPEP2-C-E047', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(76, 'P24T–16', 'PIPEP2-C-E048', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(77, 'P21A–37', 'PIPEP2-C-E049', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(78, 'P22T–17', 'PIPEP2-C-E050', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(79, 'P21A–14', 'PIPEP2-C-E051', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(80, 'P21A–15', 'PIPEP2-C-E052', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(81, 'P21A–16', 'PIPEP2-C-E053', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(82, 'P25T–12', 'PIPEP2-C-E054', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(83, 'P21A–18', 'PIPEP2-C-E055', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(84, 'P21T–08', 'PIPEP2-C-E056', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(85, 'P22T–05', 'PIPEP2-C-E057', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(86, 'P23A–15', 'PIPEP2-C-E058', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(87, 'P23A–27', 'PIPEP2-C-E059', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(88, 'P22T–12', 'PIPEP2-C-E060', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(89, 'P24A–30', 'PIPEP2-C-E061', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(90, 'P24A–33', 'PIPEP2-C-E062', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(91, 'P24T–06', 'PIPEP2-C-E063', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(92, 'P24A–05', 'PIPEP2-C-E064', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(93, '693–40', 'SLAB69-C-E065', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(94, '693–41', 'SLAB69-C-E066', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(95, '694–30', 'SLAB69-C-E067', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(96, '694–31', 'SLAB69-C-E068', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(97, '69–135', 'SLAB69-C-E069', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(98, '694–21', 'SLAB69-C-E070', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(99, '694–25', 'SLAB69-C-E071', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(100, '692–40', 'SLAB69-C-E072', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(101, '692–41', 'SLAB69-C-E073', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(102, '69–245', 'SLAB69-C-E074', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(103, '691–28', 'SLAB69-C-E075', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(104, '691–29', 'SLAB69-C-E076', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(105, '69–230', 'SLAB69-C-E077', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(106, '692–25', 'SLAB69-C-E078', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(107, '692–26', 'SLAB69-C-E079', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(108, '694–06', 'SLAB69-C-E080', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(109, '694–07', 'SLAB69-C-E081', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(110, '694–08', 'SLAB69-C-E082', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(111, '69–119', 'SLAB69-C-E083', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(112, '693–12', 'SLAB69-C-E084', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(113, '693–13', 'SLAB69-C-E085', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(114, '69–130', 'SLAB69-C-E086', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(115, '692–16', 'SLAB69-C-E087', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(116, '692–17', 'SLAB69-C-E088', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(117, '692–15', 'SLAB69-C-E089', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(118, '692–22', 'SLAB69-C-E090', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(119, '692–23', 'SLAB69-C-E091', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(120, '69–109', 'SLAB69-C-E092', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(121, '691–04', 'SLAB69-C-E093', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(122, '691–05', 'SLAB69-C-E094', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(123, '693–42', 'SLAB69-C-E095', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(124, '694–40', 'SLAB69-C-E096', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(125, '694–32', 'SLAB69-C-E097', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(126, '694–33', 'SLAB69-C-E098', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(127, '69–236', 'SLAB69-C-E099', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(128, '694–26', 'SLAB69-C-E100', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(129, '694–27', 'SLAB69-C-E101', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(130, '692–42', 'SLAB69-C-E102', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(131, '694–39', 'SLAB69-C-E103', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(132, '69–246', 'SLAB69-C-E104', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(133, '692–28', 'SLAB69-C-E105', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(134, '692–29', 'SLAB69-C-E106', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(135, '69–130', 'SLAB69-C-E107', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(136, '692–27', 'SLAB69-C-E108', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(137, '694–09', 'SLAB69-C-E109', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(138, '69–120', 'SLAB69-C-E110', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(139, '693–14', 'SLAB69-C-E111', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(140, '693–15', 'SLAB69-C-E112', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(141, '69–270', 'SLAB69-C-E113', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(142, '692–18', 'SLAB69-C-E114', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(143, '692–24', 'SLAB69-C-E115', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(144, '69–110', 'SLAB69-C-E116', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(145, '691–06', 'SLAB69-C-E117', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(146, '692–09', 'SLAB69-C-E118', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(147, '18–11', 'COVKBR-SA119-E119', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(148, '18–12', 'COVKBR-SA120-E120', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(149, '18–22', 'COVKBR-SA121-E121', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(150, '13–12', 'COVKBR-SA122-C-E122', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(151, '13–21', 'COVKBR-SA123-C-E123', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(152, '13–22', 'COVKBR-SA124-C-E124', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(153, '15–11', 'COVKBR-SA125-E125', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(154, '15–12', 'COVKBR-SA126-E126', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(155, '15–21', 'COVKBR-SA127-E127', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(156, '15–22', 'COVKBR-SA128-E128', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(157, '16–21', 'COVKBR-SA129-C-E129', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(158, '17–21', 'COVKBR-SA130-C-E130', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(159, 'P13T–01', 'PIPEP1-C-E131', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(160, 'P13T–03', 'PIPEP1-C-E132', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(161, 'P11A–01', 'PIPEP1-C-E133', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(162, 'P13A–01', 'PIPEP1-C-E134', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(163, 'P14T–09', 'PIPEP1-C-E135', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(164, 'P11A–25', 'PIPEP1-C-E136', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(165, 'P14A–26', 'PIPEP1-C-E137', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(166, 'P11A–28', 'PIPEP1-C-E138', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(167, 'P11A–29', 'PIPEP1-C-E139', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(168, 'P11A–10', 'PIPEP1-C-E140', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(169, 'P11T–06', 'PIPEP1-C-E141', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(170, 'P14T–08', 'PIPEP1-C-E142', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(171, 'P11A–13', 'PIPEP1-C-E143', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(172, 'P12A–25', 'PIPEP1-C-E144', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(173, 'P12T–05', 'PIPEP1-C-E145', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(174, 'P12T–06', 'PIPEP1-C-E146', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(175, 'P12A–08', 'PIPEP1-C-E147', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(176, 'P12A–09', 'PIPEP1-C-E148', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(177, 'P12T–11', 'PIPEP1-C-E149', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(178, 'P12A–13', 'PIPEP1-C-E150', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(179, 'P12A–14', 'PIPEP1-C-E151', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(180, 'P13T–07', 'PIPEP1-C-E152', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(181, 'P13A–07', 'PIPEP1-C-E153', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(182, 'P13T–02', 'PIPEP1-C-E154', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(183, 'P14T–01', 'PIPEP1-C-E155', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(184, 'P11A–02', 'PIPEP1-C-E156', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(185, 'P13A–02', 'PIPEP1-C-E157', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(186, 'P14T–10', 'PIPEP1-C-E158', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(187, 'P11A–26', 'PIPEP1-C-E159', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(188, 'P14A–27', 'PIPEP1-C-E160', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(189, 'P11A–27', 'PIPEP1-C-E161', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(190, 'P11A–30', 'PIPEP1-C-E162', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(191, 'P11A–09', 'PIPEP1-C-E163', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(192, 'P12A–19', 'PIPEP1-C-E164', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(193, 'P12A–22', 'PIPEP1-C-E165', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(194, 'P11A–12', 'PIPEP1-C-E166', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(195, 'P12A–26', 'PIPEP1-C-E167', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(196, 'P12T–08', 'PIPEP1-C-E168', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(197, 'P12A–10', 'PIPEP1-C-E169', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(198, 'P12A–11', 'PIPEP1-C-E170', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(199, 'P12T–12', 'PIPEP1-C-E171', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(200, 'P14A–22', 'PIPEP1-C-E172', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(201, 'P14A–23', 'PIPEP1-C-E173', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(202, 'P13T–08', 'PIPEP1-C-E174', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'C', NULL),
(203, 'P13A–08', 'PIPEP1-C-E175', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(204, '683–40', 'SLAB68-C-E176', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(205, '683–41', 'SLAB68-C-E177', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(206, '683–33', 'SLAB68-C-E178', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(207, '684–31', 'SLAB68-C-E179', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(208, '68–145', 'SLAB68-C-E180', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(209, '684–21', 'SLAB68-C-E181', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(210, '684–22', 'SLAB68-C-E182', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(211, '682–41', 'SLAB68-C-E183', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(212, '684–39', 'SLAB68-C-E184', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(213, '68–264', 'SLAB68-C-E185', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(214, '681–28', 'SLAB68-C-E186', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(215, '681–29', 'SLAB68-C-E187', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(216, '68–230', 'SLAB68-C-E188', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(217, '682–25', 'SLAB68-C-E189', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(218, '682–26', 'SLAB68-C-E190', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(219, '684–06', 'SLAB68-C-E191', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(220, '684–07', 'SLAB68-C-E192', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(221, '684–08', 'SLAB68-C-E193', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(222, '68–129', 'SLAB68-C-E194', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(223, '684–10', 'SLAB68-C-E195', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(224, '684–11', 'SLAB68-C-E196', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(225, '68–139', 'SLAB68-C-E197', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(226, '682–16', 'SLAB68-C-E198', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(227, '682–17', 'SLAB68-C-E199', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(228, '682–15', 'SLAB68-C-E200', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(229, '682–22', 'SLAB68-C-E201', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(230, '682–23', 'SLAB68-C-E202', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(231, '68–119', 'SLAB68-C-E203', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(232, '681–04', 'SLAB68-C-E204', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(233, '681–05', 'SLAB68-C-E205', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(234, '683–42', 'SLAB68-C-E206', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(235, '684–40', 'SLAB68-C-E207', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(236, '684–32', 'SLAB68-C-E208', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(237, '684–33', 'SLAB68-C-E209', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(238, '68–246', 'SLAB68-C-E210', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(239, '684–23', 'SLAB68-C-E211', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(240, '684–24', 'SLAB68-C-E212', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(241, '682–40', 'SLAB68-C-E213', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(242, '682–42', 'SLAB68-C-E214', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(243, '68–263', 'SLAB68-C-E215', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(244, '682–28', 'SLAB68-C-E216', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(245, '682–29', 'SLAB68-C-E217', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(246, '68–130', 'SLAB68-C-E218', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(247, '682–27', 'SLAB68-C-E219', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(248, '684–09', 'SLAB68-C-E220', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(249, '68–130', 'SLAB68-C-E221', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(250, '684–12', 'SLAB68-C-E222', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(251, '684–15', 'SLAB68-C-E223', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(252, '68–140', 'SLAB68-C-E224', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(253, '682–18', 'SLAB68-C-E225', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(254, '682–24', 'SLAB68-C-E226', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(255, '68–120', 'SLAB68-C-E227', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(256, '681–06', 'SLAB68-C-E228', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(257, '682–09', 'SLAB68-C-E229', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(258, '733–40', 'SLAB73-C-E230', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(259, '733–41', 'SLAB73-C-E231', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(260, '734–23', 'SLAB73-C-E232', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(261, '734–24', 'SLAB73-C-E233', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(262, '732–25', 'SLAB73-C-E234', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(263, '732–26', 'SLAB73-C-E235', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(264, '734–06', 'SLAB73-C-E236', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(265, '734–07', 'SLAB73-C-E237', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(266, '73–119', 'SLAB73-C-E238', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(267, '732–16', 'SLAB73-C-E239', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(268, '732–17', 'SLAB73-C-E240', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(269, '732–15', 'SLAB73-C-E241', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(270, '732–22', 'SLAB73-C-E242', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(271, '73–109', 'SLAB73-C-E243', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(272, '731–04', 'SLAB73-C-E244', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(273, '731–05', 'SLAB73-C-E245', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(274, '733–42', 'SLAB73-C-E246', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(275, '734–40', 'SLAB73-C-E247', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(276, '734–19', 'SLAB73-C-E248', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(277, '734–22', 'SLAB73-C-E249', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(278, '732–27', 'SLAB73-C-E250', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(279, '734–08', 'SLAB73-C-E251', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(280, '734–09', 'SLAB73-C-E252', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(281, '73–120', 'SLAB73-C-E253', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(282, '732–18', 'SLAB73-C-E254', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(283, '732–23', 'SLAB73-C-E255', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(284, '732–24', 'SLAB73-C-E256', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(285, '73–110', 'SLAB73-C-E257', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(286, '731–06', 'SLAB73-C-E258', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(287, '732–09', 'SLAB73-C-E259', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(288, '205–26', 'PIPE205-C-E260', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(289, '205–27', 'PIPE205-C-E261', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(290, '205–30', 'PIPE205-C-E262', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(291, '205–25', 'PIPE205-C-E263', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(292, '205–28', 'PIPE205-C-E264', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(293, '205–29', 'PIPE205-C-E265', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'L', NULL),
(294, '743–40', 'SLAB74-C-E266', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(295, '743–41', 'SLAB74-C-E267', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(296, '743–36', 'SLAB74-C-E268', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(297, '744–34', 'SLAB74-C-E269', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(298, '74–135', 'SLAB74-C-E270', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(299, '744–21', 'SLAB74-C-E271', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(300, '744–25', 'SLAB74-C-E272', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(301, '742–42', 'SLAB74-C-E273', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(302, '744–39', 'SLAB74-C-E274', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(303, '74–245', 'SLAB74-C-E275', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(304, '741–28', 'SLAB74-C-E276', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(305, '741–29', 'SLAB74-C-E277', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(306, '74–230', 'SLAB74-C-E278', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(307, '742–25', 'SLAB74-C-E279', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(308, '742–26', 'SLAB74-C-E280', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(309, '744–07', 'SLAB74-C-E281', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(310, '744–08', 'SLAB74-C-E282', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(311, '74–119', 'SLAB74-C-E283', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(312, '743–13', 'SLAB74-C-E284', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(313, '743–14', 'SLAB74-C-E285', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(314, '74–130', 'SLAB74-C-E286', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(315, '742–16', 'SLAB74-C-E287', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(316, '742–17', 'SLAB74-C-E288', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(317, '742–22', 'SLAB74-C-E289', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(318, '742–23', 'SLAB74-C-E290', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(319, '74–110', 'SLAB74-C-E291', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(320, '741–04', 'SLAB74-C-E292', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(321, '741–05', 'SLAB74-C-E293', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(322, '744–40', 'SLAB74-C-E294', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(323, '743–42', 'SLAB74-C-E295', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(324, '744–35', 'SLAB74-C-E296', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(325, '744–36', 'SLAB74-C-E297', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(326, '74–236', 'SLAB74-C-E298', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(327, '744–26', 'SLAB74-C-E299', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(328, '744–27', 'SLAB74-C-E300', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(329, '742–40', 'SLAB74-C-E301', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(330, '742–41', 'SLAB74-C-E302', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(331, '74–246', 'SLAB74-C-E303', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(332, '742–28', 'SLAB74-C-E304', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(333, '742–29', 'SLAB74-C-E305', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(334, '74–130', 'SLAB74-C-E306', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(335, '742–27', 'SLAB74-C-E307', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(336, '744–06', 'SLAB74-C-E308', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(337, '744–09', 'SLAB74-C-E309', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(338, '74–120', 'SLAB74-C-E310', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(339, '744–18', 'SLAB74-C-E311', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(340, '743–15', 'SLAB74-C-E312', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(341, '74–270', 'SLAB74-C-E313', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(342, '742–18', 'SLAB74-C-E314', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(343, '742–15', 'SLAB74-C-E315', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(344, '742–24', 'SLAB74-C-E316', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(345, '74–109', 'SLAB74-C-E317', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(346, '741–06', 'SLAB74-C-E318', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(347, '742–09', 'SLAB74-C-E319', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(348, '753–40', 'SLAB75-C-E320', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(349, '753–41', 'SLAB75-C-E321', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(350, '753–30', 'SLAB75-C-E322', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(351, '754–28', 'SLAB75-C-E323', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(352, '75–135', 'SLAB75-C-E324', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(353, '754–21', 'SLAB75-C-E325', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(354, '754–25', 'SLAB75-C-E326', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(355, '752–41', 'SLAB75-C-E327', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(356, '754–39', 'SLAB75-C-E328', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(357, '75–245', 'SLAB75-C-E329', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(358, '751–28', 'SLAB75-C-E330', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(359, '751–29', 'SLAB75-C-E331', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(360, '75–230', 'SLAB75-C-E332', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(361, '752–25', 'SLAB75-C-E333', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(362, '752–26', 'SLAB75-C-E334', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(363, '754–06', 'SLAB75-C-E335', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(364, '754–07', 'SLAB75-C-E336', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(365, '754–08', 'SLAB75-C-E337', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(366, '75–119', 'SLAB75-C-E338', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(367, '753–10', 'SLAB75-C-E339', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(368, '753–11', 'SLAB75-C-E340', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(369, '75–130', 'SLAB75-C-E341', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(370, '752–16', 'SLAB75-C-E342', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(371, '752–17', 'SLAB75-C-E343', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(372, '752–15', 'SLAB75-C-E344', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(373, '752–22', 'SLAB75-C-E345', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(374, '752–23', 'SLAB75-C-E346', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(375, '75–109', 'SLAB75-C-E347', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(376, '751–04', 'SLAB75-C-E348', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(377, '751–05', 'SLAB75-C-E349', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(378, '754–40', 'SLAB75-C-E350', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(379, '753–42', 'SLAB75-C-E351', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(380, '754–29', 'SLAB75-C-E352', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(381, '754–30', 'SLAB75-C-E353', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(382, '75–236', 'SLAB75-C-E354', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(383, '754–26', 'SLAB75-C-E355', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(384, '754–27', 'SLAB75-C-E356', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(385, '752–40', 'SLAB75-C-E357', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(386, '752–42', 'SLAB75-C-E358', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(387, '75–246', 'SLAB75-C-E359', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(388, '752–28', 'SLAB75-C-E360', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(389, '752–29', 'SLAB75-C-E361', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(390, '75–130', 'SLAB75-C-E362', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(391, '752–27', 'SLAB75-C-E363', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(392, '754–09', 'SLAB75-C-E364', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(393, '75–120', 'SLAB75-C-E365', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(394, '753–12', 'SLAB75-C-E366', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(395, '754–12', 'SLAB75-C-E367', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(396, '75–270', 'SLAB75-C-E368', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(397, '752–18', 'SLAB75-C-E369', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(398, '752–24', 'SLAB75-C-E370', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(399, '75–110', 'SLAB75-C-E371', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'V', NULL),
(400, '751–06', 'SLAB75-C-E372', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL),
(401, '752–09', 'SLAB75-C-E373', NULL, NULL, NULL, 'Tensile_Specimen', 'cylindrical', 'H', NULL);


-- 04
-- Aged Specimen
INSERT INTO PieceOfMaterial (piece_of_material_id, material_type, material_name) VALUES
(402, 'Aged_Specimen', 'I2V–23'),
(403, 'Aged_Specimen', 'I3C–14'),
(404, 'Aged_Specimen', 'I3V–38'),
(405, 'Aged_Specimen', 'I3V–39'),
(406, 'Aged_Specimen', 'I1V–26'),
(407, 'Aged_Specimen', 'I1V–27'),
(408, 'Aged_Specimen', 'I2V–19'),
(409, 'Aged_Specimen', 'I2V–24'),
(410, 'Aged_Specimen', 'I3C–15'),
(411, 'Aged_Specimen', 'I3V–40'),
(412, 'Aged_Specimen', 'I1V–28'),
(413, 'Aged_Specimen', 'I1V–29'),
(414, 'Aged_Specimen', 'I2V–20'),
(415, 'Aged_Specimen', 'P22T–16'),
(416, 'Aged_Specimen', 'P21A–31'),
(417, 'Aged_Specimen', 'P25A–28'),
(418, 'Aged_Specimen', 'P21A–36'),
(419, 'Aged_Specimen', 'P24T–14'),
(420, 'Aged_Specimen', 'P25T–10'),
(421, 'Aged_Specimen', 'P22A–36'),
(422, 'Aged_Specimen', 'P21A–19'),
(423, 'Aged_Specimen', 'P22T–04'),
(424, 'Aged_Specimen', 'P23A–14'),
(425, 'Aged_Specimen', 'P23A–26'),
(426, 'Aged_Specimen', 'P22T–11'),
(427, 'Aged_Specimen', 'P22A–13'),
(428, 'Aged_Specimen', 'P24A–32'),
(429, 'Aged_Specimen', 'P24T–05'),
(430, 'Aged_Specimen', 'P24A–04'),
(431, 'Aged_Specimen', 'P21A–32'),
(432, 'Aged_Specimen', 'P21A–33'),
(433, 'Aged_Specimen', 'P24T–16'),
(434, 'Aged_Specimen', 'P21A–37'),
(435, 'Aged_Specimen', 'P22T–17'),
(436, 'Aged_Specimen', 'P21A–14'),
(437, 'Aged_Specimen', 'P21A–15'),
(438, 'Aged_Specimen', 'P21A–16'),
(439, 'Aged_Specimen', 'P25T–12'),
(440, 'Aged_Specimen', 'P21A–18'),
(441, 'Aged_Specimen', 'P21T–08'),
(442, 'Aged_Specimen', 'P22T–05'),
(443, 'Aged_Specimen', 'P23A–15'),
(444, 'Aged_Specimen', 'P23A–27'),
(445, 'Aged_Specimen', 'P22T–12'),
(446, 'Aged_Specimen', 'P24A–30'),
(447, 'Aged_Specimen', 'P24A–33'),
(448, 'Aged_Specimen', 'P24T–06'),
(449, 'Aged_Specimen', 'P24A–05'),
(450, 'Aged_Specimen', '694–30'),
(451, 'Aged_Specimen', '694–31'),
(452, 'Aged_Specimen', '69–135'),
(453, 'Aged_Specimen', '694–21'),
(454, 'Aged_Specimen', '694–25'),
(455, 'Aged_Specimen', '692–40'),
(456, 'Aged_Specimen', '692–41'),
(457, 'Aged_Specimen', '69–245'),
(458, 'Aged_Specimen', '691–28'),
(459, 'Aged_Specimen', '691–29'),
(460, 'Aged_Specimen', '69–230'),
(461, 'Aged_Specimen', '692–25'),
(462, 'Aged_Specimen', '692–26'),
(463, 'Aged_Specimen', '694–06'),
(464, 'Aged_Specimen', '694–07'),
(465, 'Aged_Specimen', '694–08'),
(466, 'Aged_Specimen', '69–119'),
(467, 'Aged_Specimen', '693–12'),
(468, 'Aged_Specimen', '693–13'),
(469, 'Aged_Specimen', '69–130'),
(470, 'Aged_Specimen', '692–16'),
(471, 'Aged_Specimen', '692–17'),
(472, 'Aged_Specimen', '692–15'),
(473, 'Aged_Specimen', '692–22'),
(474, 'Aged_Specimen', '692–23'),
(475, 'Aged_Specimen', '69–109'),
(476, 'Aged_Specimen', '691–04'),
(477, 'Aged_Specimen', '691–05'),
(478, 'Aged_Specimen', '694–32'),
(479, 'Aged_Specimen', '694–33'),
(480, 'Aged_Specimen', '69–236'),
(481, 'Aged_Specimen', '694–26'),
(482, 'Aged_Specimen', '694–27'),
(483, 'Aged_Specimen', '692–42'),
(484, 'Aged_Specimen', '694–39'),
(485, 'Aged_Specimen', '69–246'),
(486, 'Aged_Specimen', '692–28'),
(487, 'Aged_Specimen', '692–29'),
(488, 'Aged_Specimen', '69–130'),
(489, 'Aged_Specimen', '692–27'),
(490, 'Aged_Specimen', '694–09'),
(491, 'Aged_Specimen', '69–120'),
(492, 'Aged_Specimen', '693–14'),
(493, 'Aged_Specimen', '693–15'),
(494, 'Aged_Specimen', '69–270'),
(495, 'Aged_Specimen', '692–18'),
(496, 'Aged_Specimen', '692–24'),
(497, 'Aged_Specimen', '69–110'),
(498, 'Aged_Specimen', '691–06'),
(499, 'Aged_Specimen', '692–09'),
(500, 'Aged_Specimen', '18–11'),
(501, 'Aged_Specimen', '18–12'),
(502, 'Aged_Specimen', '18–22'),
(503, 'Aged_Specimen', '13–12'),
(504, 'Aged_Specimen', '13–21'),
(505, 'Aged_Specimen', '13–22'),
(506, 'Aged_Specimen', '15–11'),
(507, 'Aged_Specimen', '15–12'),
(508, 'Aged_Specimen', '15–21'),
(509, 'Aged_Specimen', '15–22'),
(510, 'Aged_Specimen', '16–21'),
(511, 'Aged_Specimen', '17–21'),
(512, 'Aged_Specimen', 'P14T–09'),
(513, 'Aged_Specimen', 'P11A–25'),
(514, 'Aged_Specimen', 'P14A–26'),
(515, 'Aged_Specimen', 'P11A–28'),
(516, 'Aged_Specimen', 'P11A–29'),
(517, 'Aged_Specimen', 'P11A–10'),
(518, 'Aged_Specimen', 'P11T–06'),
(519, 'Aged_Specimen', 'P14T–08'),
(520, 'Aged_Specimen', 'P11A–13'),
(521, 'Aged_Specimen', 'P12A–25'),
(522, 'Aged_Specimen', 'P12T–05'),
(523, 'Aged_Specimen', 'P12T–06'),
(524, 'Aged_Specimen', 'P12A–08'),
(525, 'Aged_Specimen', 'P12A–09'),
(526, 'Aged_Specimen', 'P12T–11'),
(527, 'Aged_Specimen', 'P12A–13'),
(528, 'Aged_Specimen', 'P12A–14'),
(529, 'Aged_Specimen', 'P13T–07'),
(530, 'Aged_Specimen', 'P13A–07'),
(531, 'Aged_Specimen', 'P14T–10'),
(532, 'Aged_Specimen', 'P11A–26'),
(533, 'Aged_Specimen', 'P14A–27'),
(534, 'Aged_Specimen', 'P11A–27'),
(535, 'Aged_Specimen', 'P11A–30'),
(536, 'Aged_Specimen', 'P11A–09'),
(537, 'Aged_Specimen', 'P12A–19'),
(538, 'Aged_Specimen', 'P12A–22'),
(539, 'Aged_Specimen', 'P11A–12'),
(540, 'Aged_Specimen', 'P12A–26'),
(541, 'Aged_Specimen', 'P12T–08'),
(542, 'Aged_Specimen', 'P12A–10'),
(543, 'Aged_Specimen', 'P12A–11'),
(544, 'Aged_Specimen', 'P12T–12'),
(545, 'Aged_Specimen', 'P14A–22'),
(546, 'Aged_Specimen', 'P14A–23'),
(547, 'Aged_Specimen', 'P13T–08'),
(548, 'Aged_Specimen', 'P13A–08'),
(549, 'Aged_Specimen', '683–33'),
(550, 'Aged_Specimen', '684–31'),
(551, 'Aged_Specimen', '68–145'),
(552, 'Aged_Specimen', '684–21'),
(553, 'Aged_Specimen', '684–22'),
(554, 'Aged_Specimen', '682–41'),
(555, 'Aged_Specimen', '684–39'),
(556, 'Aged_Specimen', '68–264'),
(557, 'Aged_Specimen', '681–28'),
(558, 'Aged_Specimen', '681–29'),
(559, 'Aged_Specimen', '68–230'),
(560, 'Aged_Specimen', '682–25'),
(561, 'Aged_Specimen', '682–26'),
(562, 'Aged_Specimen', '684–06'),
(563, 'Aged_Specimen', '684–07'),
(564, 'Aged_Specimen', '684–08'),
(565, 'Aged_Specimen', '68–129'),
(566, 'Aged_Specimen', '684–10'),
(567, 'Aged_Specimen', '684–11'),
(568, 'Aged_Specimen', '68–139'),
(569, 'Aged_Specimen', '682–16'),
(570, 'Aged_Specimen', '682–17'),
(571, 'Aged_Specimen', '682–15'),
(572, 'Aged_Specimen', '682–22'),
(573, 'Aged_Specimen', '682–23'),
(574, 'Aged_Specimen', '68–119'),
(575, 'Aged_Specimen', '681–04'),
(576, 'Aged_Specimen', '681–05'),
(577, 'Aged_Specimen', '684–32'),
(578, 'Aged_Specimen', '684–33'),
(579, 'Aged_Specimen', '68–246'),
(580, 'Aged_Specimen', '684–23'),
(581, 'Aged_Specimen', '684–24'),
(582, 'Aged_Specimen', '682–40'),
(583, 'Aged_Specimen', '682–42'),
(584, 'Aged_Specimen', '68–263'),
(585, 'Aged_Specimen', '682–28'),
(586, 'Aged_Specimen', '682–29'),
(587, 'Aged_Specimen', '68–130'),
(588, 'Aged_Specimen', '682–27'),
(589, 'Aged_Specimen', '684–09'),
(590, 'Aged_Specimen', '68–130'),
(591, 'Aged_Specimen', '684–12'),
(592, 'Aged_Specimen', '684–15'),
(593, 'Aged_Specimen', '68–140'),
(594, 'Aged_Specimen', '682–18'),
(595, 'Aged_Specimen', '682–24'),
(596, 'Aged_Specimen', '68–120'),
(597, 'Aged_Specimen', '681–06'),
(598, 'Aged_Specimen', '682–09'),
(599, 'Aged_Specimen', '734–23'),
(600, 'Aged_Specimen', '734–24'),
(601, 'Aged_Specimen', '732–25'),
(602, 'Aged_Specimen', '732–26'),
(603, 'Aged_Specimen', '734–06'),
(604, 'Aged_Specimen', '734–07'),
(605, 'Aged_Specimen', '73–119'),
(606, 'Aged_Specimen', '732–16'),
(607, 'Aged_Specimen', '732–17'),
(608, 'Aged_Specimen', '732–15'),
(609, 'Aged_Specimen', '732–22'),
(610, 'Aged_Specimen', '73–109'),
(611, 'Aged_Specimen', '731–04'),
(612, 'Aged_Specimen', '731–05'),
(613, 'Aged_Specimen', '734–19'),
(614, 'Aged_Specimen', '734–22'),
(615, 'Aged_Specimen', '732–27'),
(616, 'Aged_Specimen', '734–08'),
(617, 'Aged_Specimen', '734–09'),
(618, 'Aged_Specimen', '73–120'),
(619, 'Aged_Specimen', '732–18'),
(620, 'Aged_Specimen', '732–23'),
(621, 'Aged_Specimen', '732–24'),
(622, 'Aged_Specimen', '73–110'),
(623, 'Aged_Specimen', '731–06'),
(624, 'Aged_Specimen', '732–09'),
(625, 'Aged_Specimen', '205–26'),
(626, 'Aged_Specimen', '205–27'),
(627, 'Aged_Specimen', '205–30'),
(628, 'Aged_Specimen', '205–25'),
(629, 'Aged_Specimen', '205–28'),
(630, 'Aged_Specimen', '205–29'),
(631, 'Aged_Specimen', '743–36'),
(632, 'Aged_Specimen', '744–34'),
(633, 'Aged_Specimen', '74–135'),
(634, 'Aged_Specimen', '744–21'),
(635, 'Aged_Specimen', '744–25'),
(636, 'Aged_Specimen', '742–42'),
(637, 'Aged_Specimen', '744–39'),
(638, 'Aged_Specimen', '74–245'),
(639, 'Aged_Specimen', '741–28'),
(640, 'Aged_Specimen', '741–29'),
(641, 'Aged_Specimen', '74–230'),
(642, 'Aged_Specimen', '742–25'),
(643, 'Aged_Specimen', '742–26'),
(644, 'Aged_Specimen', '744–07'),
(645, 'Aged_Specimen', '744–08'),
(646, 'Aged_Specimen', '74–119'),
(647, 'Aged_Specimen', '743–13'),
(648, 'Aged_Specimen', '743–14'),
(649, 'Aged_Specimen', '74–130'),
(650, 'Aged_Specimen', '742–16'),
(651, 'Aged_Specimen', '742–17'),
(652, 'Aged_Specimen', '742–22'),
(653, 'Aged_Specimen', '742–23'),
(654, 'Aged_Specimen', '74–110'),
(655, 'Aged_Specimen', '741–04'),
(656, 'Aged_Specimen', '741–05'),
(657, 'Aged_Specimen', '744–35'),
(658, 'Aged_Specimen', '744–36'),
(659, 'Aged_Specimen', '74–236'),
(660, 'Aged_Specimen', '744–26'),
(661, 'Aged_Specimen', '744–27'),
(662, 'Aged_Specimen', '742–40'),
(663, 'Aged_Specimen', '742–41'),
(664, 'Aged_Specimen', '74–246'),
(665, 'Aged_Specimen', '742–28'),
(666, 'Aged_Specimen', '742–29'),
(667, 'Aged_Specimen', '74–130'),
(668, 'Aged_Specimen', '742–27'),
(669, 'Aged_Specimen', '744–06'),
(670, 'Aged_Specimen', '744–09'),
(671, 'Aged_Specimen', '74–120'),
(672, 'Aged_Specimen', '744–18'),
(673, 'Aged_Specimen', '743–15'),
(674, 'Aged_Specimen', '74–270'),
(675, 'Aged_Specimen', '742–18'),
(676, 'Aged_Specimen', '742–15'),
(677, 'Aged_Specimen', '742–24'),
(678, 'Aged_Specimen', '74–109'),
(679, 'Aged_Specimen', '741–06'),
(680, 'Aged_Specimen', '742–09'),
(681, 'Aged_Specimen', '753–30'),
(682, 'Aged_Specimen', '754–28'),
(683, 'Aged_Specimen', '75–135'),
(684, 'Aged_Specimen', '754–21'),
(685, 'Aged_Specimen', '754–25'),
(686, 'Aged_Specimen', '752–41'),
(687, 'Aged_Specimen', '754–39'),
(688, 'Aged_Specimen', '75–245'),
(689, 'Aged_Specimen', '751–28'),
(690, 'Aged_Specimen', '751–29'),
(691, 'Aged_Specimen', '75–230'),
(692, 'Aged_Specimen', '752–25'),
(693, 'Aged_Specimen', '752–26'),
(694, 'Aged_Specimen', '754–06'),
(695, 'Aged_Specimen', '754–07'),
(696, 'Aged_Specimen', '754–08'),
(697, 'Aged_Specimen', '75–119'),
(698, 'Aged_Specimen', '753–10'),
(699, 'Aged_Specimen', '753–11'),
(700, 'Aged_Specimen', '75–130'),
(701, 'Aged_Specimen', '752–16'),
(702, 'Aged_Specimen', '752–17'),
(703, 'Aged_Specimen', '752–15'),
(704, 'Aged_Specimen', '752–22'),
(705, 'Aged_Specimen', '752–23'),
(706, 'Aged_Specimen', '75–109'),
(707, 'Aged_Specimen', '751–04'),
(708, 'Aged_Specimen', '751–05'),
(709, 'Aged_Specimen', '754–29'),
(710, 'Aged_Specimen', '754–30'),
(711, 'Aged_Specimen', '75–236'),
(712, 'Aged_Specimen', '754–26'),
(713, 'Aged_Specimen', '754–27'),
(714, 'Aged_Specimen', '752–40'),
(715, 'Aged_Specimen', '752–42'),
(716, 'Aged_Specimen', '75–246'),
(717, 'Aged_Specimen', '752–28'),
(718, 'Aged_Specimen', '752–29'),
(719, 'Aged_Specimen', '75–130'),
(720, 'Aged_Specimen', '752–27'),
(721, 'Aged_Specimen', '754–09'),
(722, 'Aged_Specimen', '75–120'),
(723, 'Aged_Specimen', '753–12'),
(724, 'Aged_Specimen', '754–12'),
(725, 'Aged_Specimen', '75–270'),
(726, 'Aged_Specimen', '752–18'),
(727, 'Aged_Specimen', '752–24'),
(728, 'Aged_Specimen', '75–110'),
(729, 'Aged_Specimen', '751–06'),
(730, 'Aged_Specimen', '752–09');

INSERT INTO Aged_Specimen
    (piece_of_material_id, specimen_id, material_id,
     aging_id, aging_type, aging_record_status, aging_plant)
VALUES
(402, 'I2V–23', 'IMPELI-C-E006-LA006',  'LA006', 'Laboratory Aged', 'Complete', NULL),
(403, 'I3C–14', 'IMPELI-C-E007-LA007',  'LA007', 'Laboratory Aged', 'Complete', NULL),
(404, 'I3V–38', 'IMPELI-C-E008-LA008',  'LA008', 'Laboratory Aged', 'Complete', NULL),
(405, 'I3V–39', 'IMPELI-C-E009-LA009',  'LA009', 'Laboratory Aged', 'Complete', NULL),
(406, 'I1V–26', 'IMPELI-C-E010-LA010',  'LA010', 'Laboratory Aged', 'Complete', NULL),
(407, 'I1V–27', 'IMPELI-C-E011-LA011',  'LA011', 'Laboratory Aged', 'Complete', NULL),
(408, 'I2V–19', 'IMPELI-C-E012-LA012',  'LA012', 'Laboratory Aged', 'Complete', NULL),
(409, 'I2V–24', 'IMPELI-C-E016-LA016',  'LA016', 'Laboratory Aged', 'Complete', NULL),
(410, 'I3C–15', 'IMPELI-C-E017-LA017',  'LA017', 'Laboratory Aged', 'Complete', NULL),
(411, 'I3V–40', 'IMPELI-C-E018-LA018',  'LA018', 'Laboratory Aged', 'Complete', NULL),
(412, 'I1V–28', 'IMPELI-C-E019-LA019',  'LA019', 'Laboratory Aged', 'Complete', NULL),
(413, 'I1V–29', 'IMPELI-C-E020-LA020',  'LA020', 'Laboratory Aged', 'Complete', NULL),
(414, 'I2V–20', 'IMPELI-C-E021-LA021',  'LA021', 'Laboratory Aged', 'Complete', NULL),
(415, 'P22T–16', 'PIPEP2-C-E026-LA026', 'LA026', 'Laboratory Aged', 'Complete', NULL),
(416, 'P21A–31', 'PIPEP2-C-E027-LA027', 'LA027', 'Laboratory Aged', 'Complete', NULL),
(417, 'P25A–28', 'PIPEP2-C-E028-LA028', 'LA028', 'Laboratory Aged', 'Complete', NULL),
(418, 'P21A–36', 'PIPEP2-C-E029-LA029', 'LA029', 'Laboratory Aged', 'Complete', NULL),
(419, 'P24T–14', 'PIPEP2-C-E030-LA030', 'LA030', 'Laboratory Aged', 'Complete', NULL),
(420, 'P25T–10', 'PIPEP2-C-E031-LA031', 'LA031', 'Laboratory Aged', 'Complete', NULL),
(421, 'P22A–36', 'PIPEP2-C-E032-LA032', 'LA032', 'Laboratory Aged', 'Complete', NULL),
(422, 'P21A–19', 'PIPEP2-C-E033-LA033', 'LA033', 'Laboratory Aged', 'Complete', NULL),
(423, 'P22T–04', 'PIPEP2-C-E034-LA034', 'LA034', 'Laboratory Aged', 'Complete', NULL),
(424, 'P23A–14', 'PIPEP2-C-E035-LA035', 'LA035', 'Laboratory Aged', 'Complete', NULL),
(425, 'P23A–26', 'PIPEP2-C-E036-LA036', 'LA036', 'Laboratory Aged', 'Complete', NULL),
(426, 'P22T–11', 'PIPEP2-C-E037-LA037', 'LA037', 'Laboratory Aged', 'Complete', NULL),
(427, 'P22A–13', 'PIPEP2-C-E038-LA038', 'LA038', 'Laboratory Aged', 'Complete', NULL),
(428, 'P24A–32', 'PIPEP2-C-E039-LA039', 'LA039', 'Laboratory Aged', 'Complete', NULL),
(429, 'P24T–05', 'PIPEP2-C-E040-LA040', 'LA040', 'Laboratory Aged', 'Complete', NULL),
(430, 'P24A–04', 'PIPEP2-C-E041-LA041', 'LA041', 'Laboratory Aged', 'Complete', NULL),
(431, 'P21A–32', 'PIPEP2-C-E046-LA046', 'LA046', 'Laboratory Aged', 'Complete', NULL),
(432, 'P21A–33', 'PIPEP2-C-E047-LA047', 'LA047', 'Laboratory Aged', 'Complete', NULL),
(433, 'P24T–16', 'PIPEP2-C-E048-LA048', 'LA048', 'Laboratory Aged', 'Complete', NULL),
(434, 'P21A–37', 'PIPEP2-C-E049-LA049', 'LA049', 'Laboratory Aged', 'Complete', NULL),
(435, 'P22T–17', 'PIPEP2-C-E050-LA050', 'LA050', 'Laboratory Aged', 'Complete', NULL),
(436, 'P21A–14', 'PIPEP2-C-E051-LA051', 'LA051', 'Laboratory Aged', 'Complete', NULL),
(437, 'P21A–15', 'PIPEP2-C-E052-LA052', 'LA052', 'Laboratory Aged', 'Complete', NULL),
(438, 'P21A–16', 'PIPEP2-C-E053-LA053', 'LA053', 'Laboratory Aged', 'Complete', NULL),
(439, 'P25T–12', 'PIPEP2-C-E054-LA054', 'LA054', 'Laboratory Aged', 'Complete', NULL),
(440, 'P21A–18', 'PIPEP2-C-E055-LA055', 'LA055', 'Laboratory Aged', 'Complete', NULL),
(441, 'P21T–08', 'PIPEP2-C-E056-LA056', 'LA056', 'Laboratory Aged', 'Complete', NULL),
(442, 'P22T–05', 'PIPEP2-C-E057-LA057', 'LA057', 'Laboratory Aged', 'Complete', NULL),
(443, 'P23A–15', 'PIPEP2-C-E058-LA058', 'LA058', 'Laboratory Aged', 'Complete', NULL),
(444, 'P23A–27', 'PIPEP2-C-E059-LA059', 'LA059', 'Laboratory Aged', 'Complete', NULL),
(445, 'P22T–12', 'PIPEP2-C-E060-LA060', 'LA060', 'Laboratory Aged', 'Complete', NULL),
(446, 'P24A–30', 'PIPEP2-C-E061-LA061', 'LA061', 'Laboratory Aged', 'Complete', NULL),
(447, 'P24A–33', 'PIPEP2-C-E062-LA062', 'LA062', 'Laboratory Aged', 'Complete', NULL),
(448, 'P24T–06', 'PIPEP2-C-E063-LA063', 'LA063', 'Laboratory Aged', 'Complete', NULL),
(449, 'P24A–05', 'PIPEP2-C-E064-LA064', 'LA064', 'Laboratory Aged', 'Complete', NULL),
(450, '694–30', 'SLAB69-C-E067-LA067',  'LA067', 'Laboratory Aged', 'Complete', NULL),
(451, '694–31', 'SLAB69-C-E068-LA068',  'LA068', 'Laboratory Aged', 'Complete', NULL),
(452, '69–135', 'SLAB69-C-E069-LA069',  'LA069', 'Laboratory Aged', 'Complete', NULL),
(453, '694–21', 'SLAB69-C-E070-LA070',  'LA070', 'Laboratory Aged', 'Complete', NULL),
(454, '694–25', 'SLAB69-C-E071-LA071',  'LA071', 'Laboratory Aged', 'Complete', NULL),
(455, '692–40', 'SLAB69-C-E072-LA072',  'LA072', 'Laboratory Aged', 'Complete', NULL),
(456, '692–41', 'SLAB69-C-E073-LA073',  'LA073', 'Laboratory Aged', 'Complete', NULL),
(457, '69–245', 'SLAB69-C-E074-LA074',  'LA074', 'Laboratory Aged', 'Complete', NULL),
(458, '691–28', 'SLAB69-C-E075-LA075',  'LA075', 'Laboratory Aged', 'Complete', NULL),
(459, '691–29', 'SLAB69-C-E076-LA076',  'LA076', 'Laboratory Aged', 'Complete', NULL),
(460, '69–230', 'SLAB69-C-E077-LA077',  'LA077', 'Laboratory Aged', 'Complete', NULL),
(461, '692–25', 'SLAB69-C-E078-LA078',  'LA078', 'Laboratory Aged', 'Complete', NULL),
(462, '692–26', 'SLAB69-C-E079-LA079',  'LA079', 'Laboratory Aged', 'Complete', NULL),
(463, '694–06', 'SLAB69-C-E080-LA080',  'LA080', 'Laboratory Aged', 'Complete', NULL),
(464, '694–07', 'SLAB69-C-E081-LA081',  'LA081', 'Laboratory Aged', 'Complete', NULL),
(465, '694–08', 'SLAB69-C-E082-LA082',  'LA082', 'Laboratory Aged', 'Complete', NULL),
(466, '69–119', 'SLAB69-C-E083-LA083',  'LA083', 'Laboratory Aged', 'Complete', NULL),
(467, '693–12', 'SLAB69-C-E084-LA084',  'LA084', 'Laboratory Aged', 'Complete', NULL),
(468, '693–13', 'SLAB69-C-E085-LA085',  'LA085', 'Laboratory Aged', 'Complete', NULL),
(469, '69–130', 'SLAB69-C-E086-LA086',  'LA086', 'Laboratory Aged', 'Complete', NULL),
(470, '692–16', 'SLAB69-C-E087-LA087',  'LA087', 'Laboratory Aged', 'Complete', NULL),
(471, '692–17', 'SLAB69-C-E088-LA088',  'LA088', 'Laboratory Aged', 'Complete', NULL),
(472, '692–15', 'SLAB69-C-E089-LA089',  'LA089', 'Laboratory Aged', 'Complete', NULL),
(473, '692–22', 'SLAB69-C-E090-LA090',  'LA090', 'Laboratory Aged', 'Complete', NULL),
(474, '692–23', 'SLAB69-C-E091-LA091',  'LA091', 'Laboratory Aged', 'Complete', NULL),
(475, '69–109', 'SLAB69-C-E092-LA092',  'LA092', 'Laboratory Aged', 'Complete', NULL),
(476, '691–04', 'SLAB69-C-E093-LA093',  'LA093', 'Laboratory Aged', 'Complete', NULL),
(477, '691–05', 'SLAB69-C-E094-LA094',  'LA094', 'Laboratory Aged', 'Complete', NULL),
(478, '694–32', 'SLAB69-C-E097-LA097',  'LA097', 'Laboratory Aged', 'Complete', NULL),
(479, '694–33', 'SLAB69-C-E098-LA098',  'LA098', 'Laboratory Aged', 'Complete', NULL),
(480, '69–236', 'SLAB69-C-E099-LA099',  'LA099', 'Laboratory Aged', 'Complete', NULL),
(481, '694–26', 'SLAB69-C-E100-LA100',  'LA100', 'Laboratory Aged', 'Complete', NULL),
(482, '694–27', 'SLAB69-C-E101-LA101',  'LA101', 'Laboratory Aged', 'Complete', NULL),
(483, '692–42', 'SLAB69-C-E102-LA102',  'LA102', 'Laboratory Aged', 'Complete', NULL),
(484, '694–39', 'SLAB69-C-E103-LA103',  'LA103', 'Laboratory Aged', 'Complete', NULL),
(485, '69–246', 'SLAB69-C-E104-LA104',  'LA104', 'Laboratory Aged', 'Complete', NULL),
(486, '692–28', 'SLAB69-C-E105-LA105',  'LA105', 'Laboratory Aged', 'Complete', NULL),
(487, '692–29', 'SLAB69-C-E106-LA106',  'LA106', 'Laboratory Aged', 'Complete', NULL),
(488, '69–130', 'SLAB69-C-E107-LA107',  'LA107', 'Laboratory Aged', 'Complete', NULL),
(489, '692–27', 'SLAB69-C-E108-LA108',  'LA108', 'Laboratory Aged', 'Complete', NULL),
(490, '694–09', 'SLAB69-C-E109-LA109',  'LA109', 'Laboratory Aged', 'Complete', NULL),
(491, '69–120', 'SLAB69-C-E110-LA110',  'LA110', 'Laboratory Aged', 'Complete', NULL),
(492, '693–14', 'SLAB69-C-E111-LA111',  'LA111', 'Laboratory Aged', 'Complete', NULL),
(493, '693–15', 'SLAB69-C-E112-LA112',  'LA112', 'Laboratory Aged', 'Complete', NULL),
(494, '69–270', 'SLAB69-C-E113-LA113',  'LA113', 'Laboratory Aged', 'Complete', NULL),
(495, '692–18', 'SLAB69-C-E114-LA114',  'LA114', 'Laboratory Aged', 'Complete', NULL),
(496, '692–24', 'SLAB69-C-E115-LA115',  'LA115', 'Laboratory Aged', 'Complete', NULL),
(497, '69–110', 'SLAB69-C-E116-LA116',  'LA116', 'Laboratory Aged', 'Complete', NULL),
(498, '691–06', 'SLAB69-C-E117-LA117',  'LA117', 'Laboratory Aged', 'Complete', NULL),
(499, '692–09', 'SLAB69-C-E118-LA118',  'LA118', 'Laboratory Aged', 'Complete', NULL),
(500, '18–11', 'COVKBR-SA119-C-E119', 'SA119', 'Service Aged', 'Complete', 'KRB reactor, Gundremmingen'),
(501, '18–12', 'COVKBR-SA120-C-E120', 'SA120', 'Service Aged', 'Complete', 'KRB reactor, Gundremmingen'),
(502, '18–22', 'COVKBR-SA121-C-E121', 'SA121', 'Service Aged', 'Complete', 'KRB reactor, Gundremmingen'),
(503, '13–12', 'COVKBR-SA122-C-E122', 'SA122', 'Service Aged', 'Complete', 'KRB reactor, Gundremmingen'),
(504, '13–21', 'COVKBR-SA123-C-E123', 'SA123', 'Service Aged', 'Complete', 'KRB reactor, Gundremmingen'),
(505, '13–22', 'COVKBR-SA124-C-E124', 'SA124', 'Service Aged', 'Complete', 'KRB reactor, Gundremmingen'),
(506, '15–11', 'COVKBR-SA125-C-E125', 'SA125', 'Service Aged', 'Complete', 'KRB reactor, Gundremmingen'),
(507, '15–12', 'COVKBR-SA126-C-E126', 'SA126', 'Service Aged', 'Complete', 'KRB reactor, Gundremmingen'),
(508, '15–21', 'COVKBR-SA127-C-E127', 'SA127', 'Service Aged', 'Complete', 'KRB reactor, Gundremmingen'),
(509, '15–22', 'COVKBR-SA128-C-E128', 'SA128', 'Service Aged', 'Complete', 'KRB reactor, Gundremmingen'),
(510, '16–21', 'COVKBR-SA129-C-E129', 'SA129', 'Service Aged', 'Complete', 'KRB reactor, Gundremmingen'),
(511, '17–21', 'COVKBR-SA130-C-E130', 'SA130', 'Service Aged', 'Complete', 'KRB reactor, Gundremmingen'),
(512, 'P14T–09', 'PIPEP1-C-E135-LA135', 'LA135', 'Laboratory Aged', 'Complete', NULL),
(513, 'P11A–25', 'PIPEP1-C-E136-LA136', 'LA136', 'Laboratory Aged', 'Complete', NULL),
(514, 'P14A–26', 'PIPEP1-C-E137-LA137', 'LA137', 'Laboratory Aged', 'Complete', NULL),
(515, 'P11A–28', 'PIPEP1-C-E138-LA138', 'LA138', 'Laboratory Aged', 'Complete', NULL),
(516, 'P11A–29', 'PIPEP1-C-E139-LA139', 'LA139', 'Laboratory Aged', 'Complete', NULL),
(517, 'P11A–10', 'PIPEP1-C-E140-LA140', 'LA140', 'Laboratory Aged', 'Complete', NULL),
(518, 'P11T–06', 'PIPEP1-C-E141-LA141', 'LA141', 'Laboratory Aged', 'Complete', NULL),
(519, 'P14T–08', 'PIPEP1-C-E142-LA142', 'LA142', 'Laboratory Aged', 'Complete', NULL),
(520, 'P11A–13', 'PIPEP1-C-E143-LA143', 'LA143', 'Laboratory Aged', 'Complete', NULL),
(521, 'P12A–25', 'PIPEP1-C-E144-LA144', 'LA144', 'Laboratory Aged', 'Complete', NULL),
(522, 'P12T–05', 'PIPEP1-C-E145-LA145', 'LA145', 'Laboratory Aged', 'Complete', NULL),
(523, 'P12T–06', 'PIPEP1-C-E146-LA146', 'LA146', 'Laboratory Aged', 'Complete', NULL),
(524, 'P12A–08', 'PIPEP1-C-E147-LA147', 'LA147', 'Laboratory Aged', 'Complete', NULL),
(525, 'P12A–09', 'PIPEP1-C-E148-LA148', 'LA148', 'Laboratory Aged', 'Complete', NULL),
(526, 'P12T–11', 'PIPEP1-C-E149-LA149', 'LA149', 'Laboratory Aged', 'Complete', NULL),
(527, 'P12A–13', 'PIPEP1-C-E150-LA150', 'LA150', 'Laboratory Aged', 'Complete', NULL),
(528, 'P12A–14', 'PIPEP1-C-E151-LA151', 'LA151', 'Laboratory Aged', 'Complete', NULL),
(529, 'P13T–07', 'PIPEP1-C-E152-LA152', 'LA152', 'Laboratory Aged', 'Complete', NULL),
(530, 'P13A–07', 'PIPEP1-C-E153-LA153', 'LA153', 'Laboratory Aged', 'Complete', NULL),
(531, 'P14T–10', 'PIPEP1-C-E158-LA158', 'LA158', 'Laboratory Aged', 'Complete', NULL),
(532, 'P11A–26', 'PIPEP1-C-E159-LA159', 'LA159', 'Laboratory Aged', 'Complete', NULL),
(533, 'P14A–27', 'PIPEP1-C-E160-LA160', 'LA160', 'Laboratory Aged', 'Complete', NULL),
(534, 'P11A–27', 'PIPEP1-C-E161-LA161', 'LA161', 'Laboratory Aged', 'Complete', NULL),
(535, 'P11A–30', 'PIPEP1-C-E162-LA162', 'LA162', 'Laboratory Aged', 'Complete', NULL),
(536, 'P11A–09', 'PIPEP1-C-E163-LA163', 'LA163', 'Laboratory Aged', 'Complete', NULL),
(537, 'P12A–19', 'PIPEP1-C-E164-LA164', 'LA164', 'Laboratory Aged', 'Complete', NULL),
(538, 'P12A–22', 'PIPEP1-C-E165-LA165', 'LA165', 'Laboratory Aged', 'Complete', NULL),
(539, 'P11A–12', 'PIPEP1-C-E166-LA166', 'LA166', 'Laboratory Aged', 'Complete', NULL),
(540, 'P12A–26', 'PIPEP1-C-E167-LA167', 'LA167', 'Laboratory Aged', 'Complete', NULL),
(541, 'P12T–08', 'PIPEP1-C-E168-LA168', 'LA168', 'Laboratory Aged', 'Complete', NULL),
(542, 'P12A–10', 'PIPEP1-C-E169-LA169', 'LA169', 'Laboratory Aged', 'Complete', NULL),
(543, 'P12A–11', 'PIPEP1-C-E170-LA170', 'LA170', 'Laboratory Aged', 'Complete', NULL),
(544, 'P12T–12', 'PIPEP1-C-E171-LA171', 'LA171', 'Laboratory Aged', 'Complete', NULL),
(545, 'P14A–22', 'PIPEP1-C-E172-LA172', 'LA172', 'Laboratory Aged', 'Complete', NULL),
(546, 'P14A–23', 'PIPEP1-C-E173-LA173', 'LA173', 'Laboratory Aged', 'Complete', NULL),
(547, 'P13T–08', 'PIPEP1-C-E174-LA174', 'LA174', 'Laboratory Aged', 'Complete', NULL),
(548, 'P13A–08', 'PIPEP1-C-E175-LA175', 'LA175', 'Laboratory Aged', 'Complete', NULL),
(549, '683–33', 'SLAB68-C-E178-LA178', 'LA178', 'Laboratory Aged', 'Complete', NULL),
(550, '684–31', 'SLAB68-C-E179-LA179', 'LA179', 'Laboratory Aged', 'Complete', NULL),
(551, '68–145', 'SLAB68-C-E180-LA180', 'LA180', 'Laboratory Aged', 'Complete', NULL),
(552, '684–21', 'SLAB68-C-E181-LA181', 'LA181', 'Laboratory Aged', 'Complete', NULL),
(553, '684–22', 'SLAB68-C-E182-LA182', 'LA182', 'Laboratory Aged', 'Complete', NULL),
(554, '682–41', 'SLAB68-C-E183-LA183', 'LA183', 'Laboratory Aged', 'Complete', NULL),
(555, '684–39', 'SLAB68-C-E184-LA184', 'LA184', 'Laboratory Aged', 'Complete', NULL),
(556, '68–264', 'SLAB68-C-E185-LA185', 'LA185', 'Laboratory Aged', 'Complete', NULL),
(557, '681–28', 'SLAB68-C-E186-LA186', 'LA186', 'Laboratory Aged', 'Complete', NULL),
(558, '681–29', 'SLAB68-C-E187-LA187', 'LA187', 'Laboratory Aged', 'Complete', NULL),
(559, '68–230', 'SLAB68-C-E188-LA188', 'LA188', 'Laboratory Aged', 'Complete', NULL),
(560, '682–25', 'SLAB68-C-E189-LA189', 'LA189', 'Laboratory Aged', 'Complete', NULL),
(561, '682–26', 'SLAB68-C-E190-LA190', 'LA190', 'Laboratory Aged', 'Complete', NULL),
(562, '684–06', 'SLAB68-C-E191-LA191', 'LA191', 'Laboratory Aged', 'Complete', NULL),
(563, '684–07', 'SLAB68-C-E192-LA192', 'LA192', 'Laboratory Aged', 'Complete', NULL),
(564, '684–08', 'SLAB68-C-E193-LA193', 'LA193', 'Laboratory Aged', 'Complete', NULL),
(565, '68–129', 'SLAB68-C-E194-LA194', 'LA194', 'Laboratory Aged', 'Complete', NULL),
(566, '684–10', 'SLAB68-C-E195-LA195', 'LA195', 'Laboratory Aged', 'Complete', NULL),
(567, '684–11', 'SLAB68-C-E196-LA196', 'LA196', 'Laboratory Aged', 'Complete', NULL),
(568, '68–139', 'SLAB68-C-E197-LA197', 'LA197', 'Laboratory Aged', 'Complete', NULL),
(569, '682–16', 'SLAB68-C-E198-LA198', 'LA198', 'Laboratory Aged', 'Complete', NULL),
(570, '682–17', 'SLAB68-C-E199-LA199', 'LA199', 'Laboratory Aged', 'Complete', NULL),
(571, '682–15', 'SLAB68-C-E200-LA200', 'LA200', 'Laboratory Aged', 'Complete', NULL),
(572, '682–22', 'SLAB68-C-E201-LA201', 'LA201', 'Laboratory Aged', 'Complete', NULL),
(573, '682–23', 'SLAB68-C-E202-LA202', 'LA202', 'Laboratory Aged', 'Complete', NULL),
(574, '68–119', 'SLAB68-C-E203-LA203', 'LA203', 'Laboratory Aged', 'Complete', NULL),
(575, '681–04', 'SLAB68-C-E204-LA204', 'LA204', 'Laboratory Aged', 'Complete', NULL),
(576, '681–05', 'SLAB68-C-E205-LA205', 'LA205', 'Laboratory Aged', 'Complete', NULL),
(577, '684–32', 'SLAB68-C-E208-LA208', 'LA208', 'Laboratory Aged', 'Complete', NULL),
(578, '684–33', 'SLAB68-C-E209-LA209', 'LA209', 'Laboratory Aged', 'Complete', NULL),
(579, '68–246', 'SLAB68-C-E210-LA210', 'LA210', 'Laboratory Aged', 'Complete', NULL),
(580, '684–23', 'SLAB68-C-E211-LA211', 'LA211', 'Laboratory Aged', 'Complete', NULL),
(581, '684–24', 'SLAB68-C-E212-LA212', 'LA212', 'Laboratory Aged', 'Complete', NULL),
(582, '682–40', 'SLAB68-C-E213-LA213', 'LA213', 'Laboratory Aged', 'Complete', NULL),
(583, '682–42', 'SLAB68-C-E214-LA214', 'LA214', 'Laboratory Aged', 'Complete', NULL),
(584, '68–263', 'SLAB68-C-E215-LA215', 'LA215', 'Laboratory Aged', 'Complete', NULL),
(585, '682–28', 'SLAB68-C-E216-LA216', 'LA216', 'Laboratory Aged', 'Complete', NULL),
(586, '682–29', 'SLAB68-C-E217-LA217', 'LA217', 'Laboratory Aged', 'Complete', NULL),
(587, '68–130', 'SLAB68-C-E218-LA218', 'LA218', 'Laboratory Aged', 'Complete', NULL),
(588, '682–27', 'SLAB68-C-E219-LA219', 'LA219', 'Laboratory Aged', 'Complete', NULL),
(589, '684–09', 'SLAB68-C-E220-LA220', 'LA220', 'Laboratory Aged', 'Complete', NULL),
(590, '68–130', 'SLAB68-C-E221-LA221', 'LA221', 'Laboratory Aged', 'Complete', NULL),
(591, '684–12', 'SLAB68-C-E222-LA222', 'LA222', 'Laboratory Aged', 'Complete', NULL),
(592, '684–15', 'SLAB68-C-E223-LA223', 'LA223', 'Laboratory Aged', 'Complete', NULL),
(593, '68–140', 'SLAB68-C-E224-LA224', 'LA224', 'Laboratory Aged', 'Complete', NULL),
(594, '682–18', 'SLAB68-C-E225-LA225', 'LA225', 'Laboratory Aged', 'Complete', NULL),
(595, '682–24', 'SLAB68-C-E226-LA226', 'LA226', 'Laboratory Aged', 'Complete', NULL),
(596, '68–120', 'SLAB68-C-E227-LA227', 'LA227', 'Laboratory Aged', 'Complete', NULL),
(597, '681–06', 'SLAB68-C-E228-LA228', 'LA228', 'Laboratory Aged', 'Complete', NULL),
(598, '682–09', 'SLAB68-C-E229-LA229', 'LA229', 'Laboratory Aged', 'Complete', NULL),
(599, '734–23', 'SLAB73-C-E232-LA232', 'LA232', 'Laboratory Aged', 'Complete', NULL),
(600, '734–24', 'SLAB73-C-E233-LA233', 'LA233', 'Laboratory Aged', 'Complete', NULL),
(601, '732–25', 'SLAB73-C-E234-LA234', 'LA234', 'Laboratory Aged', 'Complete', NULL),
(602, '732–26', 'SLAB73-C-E235-LA235', 'LA235', 'Laboratory Aged', 'Complete', NULL),
(603, '734–06', 'SLAB73-C-E236-LA236', 'LA236', 'Laboratory Aged', 'Complete', NULL),
(604, '734–07', 'SLAB73-C-E237-LA237', 'LA237', 'Laboratory Aged', 'Complete', NULL),
(605, '73–119', 'SLAB73-C-E238-LA238', 'LA238', 'Laboratory Aged', 'Complete', NULL),
(606, '732–16', 'SLAB73-C-E239-LA239', 'LA239', 'Laboratory Aged', 'Complete', NULL),
(607, '732–17', 'SLAB73-C-E240-LA240', 'LA240', 'Laboratory Aged', 'Complete', NULL),
(608, '732–15', 'SLAB73-C-E241-LA241', 'LA241', 'Laboratory Aged', 'Complete', NULL),
(609, '732–22', 'SLAB73-C-E242-LA242', 'LA242', 'Laboratory Aged', 'Complete', NULL),
(610, '73–109', 'SLAB73-C-E243-LA243', 'LA243', 'Laboratory Aged', 'Complete', NULL),
(611, '731–04', 'SLAB73-C-E244-LA244', 'LA244', 'Laboratory Aged', 'Complete', NULL),
(612, '731–05', 'SLAB73-C-E245-LA245', 'LA245', 'Laboratory Aged', 'Complete', NULL),
(613, '734–19', 'SLAB73-C-E248-LA248', 'LA248', 'Laboratory Aged', 'Complete', NULL),
(614, '734–22', 'SLAB73-C-E249-LA249', 'LA249', 'Laboratory Aged', 'Complete', NULL),
(615, '732–27', 'SLAB73-C-E250-LA250', 'LA250', 'Laboratory Aged', 'Complete', NULL),
(616, '734–08', 'SLAB73-C-E251-LA251', 'LA251', 'Laboratory Aged', 'Complete', NULL),
(617, '734–09', 'SLAB73-C-E252-LA252', 'LA252', 'Laboratory Aged', 'Complete', NULL),
(618, '73–120', 'SLAB73-C-E253-LA253', 'LA253', 'Laboratory Aged', 'Complete', NULL),
(619, '732–18', 'SLAB73-C-E254-LA254', 'LA254', 'Laboratory Aged', 'Complete', NULL),
(620, '732–23', 'SLAB73-C-E255-LA255', 'LA255', 'Laboratory Aged', 'Complete', NULL),
(621, '732–24', 'SLAB73-C-E256-LA256', 'LA256', 'Laboratory Aged', 'Complete', NULL),
(622, '73–110', 'SLAB73-C-E257-LA257', 'LA257', 'Laboratory Aged', 'Complete', NULL),
(623, '731–06', 'SLAB73-C-E258-LA258', 'LA258', 'Laboratory Aged', 'Complete', NULL),
(624, '732–09', 'SLAB73-C-E259-LA259', 'LA259', 'Laboratory Aged', 'Complete', NULL),
(625, '205–26', 'PIPE205-C-E260-LA260', 'LA260', 'Laboratory Aged', 'Complete', NULL),
(626, '205–27', 'PIPE205-C-E261-LA261', 'LA261', 'Laboratory Aged', 'Complete', NULL),
(627, '205–30', 'PIPE205-C-E262-LA262', 'LA262', 'Laboratory Aged', 'Complete', NULL),
(628, '205–25', 'PIPE205-C-E263-LA263', 'LA263', 'Laboratory Aged', 'Complete', NULL),
(629, '205–28', 'PIPE205-C-E264-LA264', 'LA264', 'Laboratory Aged', 'Complete', NULL),
(630, '205–29', 'PIPE205-C-E265-LA265', 'LA265', 'Laboratory Aged', 'Complete', NULL),
(631, '743–36', 'SLAB74-C-E268-LA268', 'LA268', 'Laboratory Aged', 'Complete', NULL),
(632, '744–34', 'SLAB74-C-E269-LA269', 'LA269', 'Laboratory Aged', 'Complete', NULL),
(633, '74–135', 'SLAB74-C-E270-LA270', 'LA270', 'Laboratory Aged', 'Complete', NULL),
(634, '744–21', 'SLAB74-C-E271-LA271', 'LA271', 'Laboratory Aged', 'Complete', NULL),
(635, '744–25', 'SLAB74-C-E272-LA272', 'LA272', 'Laboratory Aged', 'Complete', NULL),
(636, '742–42', 'SLAB74-C-E273-LA273', 'LA273', 'Laboratory Aged', 'Complete', NULL),
(637, '744–39', 'SLAB74-C-E274-LA274', 'LA274', 'Laboratory Aged', 'Complete', NULL),
(638, '74–245', 'SLAB74-C-E275-LA275', 'LA275', 'Laboratory Aged', 'Complete', NULL),
(639, '741–28', 'SLAB74-C-E276-LA276', 'LA276', 'Laboratory Aged', 'Complete', NULL),
(640, '741–29', 'SLAB74-C-E277-LA277', 'LA277', 'Laboratory Aged', 'Complete', NULL),
(641, '74–230', 'SLAB74-C-E278-LA278', 'LA278', 'Laboratory Aged', 'Complete', NULL),
(642, '742–25', 'SLAB74-C-E279-LA279', 'LA279', 'Laboratory Aged', 'Complete', NULL),
(643, '742–26', 'SLAB74-C-E280-LA280', 'LA280', 'Laboratory Aged', 'Complete', NULL),
(644, '744–07', 'SLAB74-C-E281-LA281', 'LA281', 'Laboratory Aged', 'Complete', NULL),
(645, '744–08', 'SLAB74-C-E282-LA282', 'LA282', 'Laboratory Aged', 'Complete', NULL),
(646, '74–119', 'SLAB74-C-E283-LA283', 'LA283', 'Laboratory Aged', 'Complete', NULL),
(647, '743–13', 'SLAB74-C-E284-LA284', 'LA284', 'Laboratory Aged', 'Complete', NULL),
(648, '743–14', 'SLAB74-C-E285-LA285', 'LA285', 'Laboratory Aged', 'Complete', NULL),
(649, '74–130', 'SLAB74-C-E286-LA286', 'LA286', 'Laboratory Aged', 'Complete', NULL),
(650, '742–16', 'SLAB74-C-E287-LA287', 'LA287', 'Laboratory Aged', 'Complete', NULL),
(651, '742–17', 'SLAB74-C-E288-LA288', 'LA288', 'Laboratory Aged', 'Complete', NULL),
(652, '742–22', 'SLAB74-C-E289-LA289', 'LA289', 'Laboratory Aged', 'Complete', NULL),
(653, '742–23', 'SLAB74-C-E290-LA290', 'LA290', 'Laboratory Aged', 'Complete', NULL),
(654, '74–110', 'SLAB74-C-E291-LA291', 'LA291', 'Laboratory Aged', 'Complete', NULL),
(655, '741–04', 'SLAB74-C-E292-LA292', 'LA292', 'Laboratory Aged', 'Complete', NULL),
(656, '741–05', 'SLAB74-C-E293-LA293', 'LA293', 'Laboratory Aged', 'Complete', NULL),
(657, '744–35', 'SLAB74-C-E296-LA296', 'LA296', 'Laboratory Aged', 'Complete', NULL),
(658, '744–36', 'SLAB74-C-E297-LA297', 'LA297', 'Laboratory Aged', 'Complete', NULL),
(659, '74–236', 'SLAB74-C-E298-LA298', 'LA298', 'Laboratory Aged', 'Complete', NULL),
(660, '744–26', 'SLAB74-C-E299-LA299', 'LA299', 'Laboratory Aged', 'Complete', NULL),
(661, '744–27', 'SLAB74-C-E300-LA300', 'LA300', 'Laboratory Aged', 'Complete', NULL),
(662, '742–40', 'SLAB74-C-E301-LA301', 'LA301', 'Laboratory Aged', 'Complete', NULL),
(663, '742–41', 'SLAB74-C-E302-LA302', 'LA302', 'Laboratory Aged', 'Complete', NULL),
(664, '74–246', 'SLAB74-C-E303-LA303', 'LA303', 'Laboratory Aged', 'Complete', NULL),
(665, '742–28', 'SLAB74-C-E304-LA304', 'LA304', 'Laboratory Aged', 'Complete', NULL),
(666, '742–29', 'SLAB74-C-E305-LA305', 'LA305', 'Laboratory Aged', 'Complete', NULL),
(667, '74–130', 'SLAB74-C-E306-LA306', 'LA306', 'Laboratory Aged', 'Complete', NULL),
(668, '742–27', 'SLAB74-C-E307-LA307', 'LA307', 'Laboratory Aged', 'Complete', NULL),
(669, '744–06', 'SLAB74-C-E308-LA308', 'LA308', 'Laboratory Aged', 'Complete', NULL),
(670, '744–09', 'SLAB74-C-E309-LA309', 'LA309', 'Laboratory Aged', 'Complete', NULL),
(671, '74–120', 'SLAB74-C-E310-LA310', 'LA310', 'Laboratory Aged', 'Complete', NULL),
(672, '744–18', 'SLAB74-C-E311-LA311', 'LA311', 'Laboratory Aged', 'Complete', NULL),
(673, '743–15', 'SLAB74-C-E312-LA312', 'LA312', 'Laboratory Aged', 'Complete', NULL),
(674, '74–270', 'SLAB74-C-E313-LA313', 'LA313', 'Laboratory Aged', 'Complete', NULL),
(675, '742–18', 'SLAB74-C-E314-LA314', 'LA314', 'Laboratory Aged', 'Complete', NULL),
(676, '742–15', 'SLAB74-C-E315-LA315', 'LA315', 'Laboratory Aged', 'Complete', NULL),
(677, '742–24', 'SLAB74-C-E316-LA316', 'LA316', 'Laboratory Aged', 'Complete', NULL),
(678, '74–109', 'SLAB74-C-E317-LA317', 'LA317', 'Laboratory Aged', 'Complete', NULL),
(679, '741–06', 'SLAB74-C-E318-LA318', 'LA318', 'Laboratory Aged', 'Complete', NULL),
(680, '742–09', 'SLAB74-C-E319-LA319', 'LA319', 'Laboratory Aged', 'Complete', NULL),
(681, '753–30', 'SLAB75-C-E322-LA322', 'LA322', 'Laboratory Aged', 'Complete', NULL),
(682, '754–28', 'SLAB75-C-E323-LA323', 'LA323', 'Laboratory Aged', 'Complete', NULL),
(683, '75–135', 'SLAB75-C-E324-LA324', 'LA324', 'Laboratory Aged', 'Complete', NULL),
(684, '754–21', 'SLAB75-C-E325-LA325', 'LA325', 'Laboratory Aged', 'Complete', NULL),
(685, '754–25', 'SLAB75-C-E326-LA326', 'LA326', 'Laboratory Aged', 'Complete', NULL),
(686, '752–41', 'SLAB75-C-E327-LA327', 'LA327', 'Laboratory Aged', 'Complete', NULL),
(687, '754–39', 'SLAB75-C-E328-LA328', 'LA328', 'Laboratory Aged', 'Complete', NULL),
(688, '75–245', 'SLAB75-C-E329-LA329', 'LA329', 'Laboratory Aged', 'Complete', NULL),
(689, '751–28', 'SLAB75-C-E330-LA330', 'LA330', 'Laboratory Aged', 'Complete', NULL),
(690, '751–29', 'SLAB75-C-E331-LA331', 'LA331', 'Laboratory Aged', 'Complete', NULL),
(691, '75–230', 'SLAB75-C-E332-LA332', 'LA332', 'Laboratory Aged', 'Complete', NULL),
(692, '752–25', 'SLAB75-C-E333-LA333', 'LA333', 'Laboratory Aged', 'Complete', NULL),
(693, '752–26', 'SLAB75-C-E334-LA334', 'LA334', 'Laboratory Aged', 'Complete', NULL),
(694, '754–06', 'SLAB75-C-E335-LA335', 'LA335', 'Laboratory Aged', 'Complete', NULL),
(695, '754–07', 'SLAB75-C-E336-LA336', 'LA336', 'Laboratory Aged', 'Complete', NULL),
(696, '754–08', 'SLAB75-C-E337-LA337', 'LA337', 'Laboratory Aged', 'Complete', NULL),
(697, '75–119', 'SLAB75-C-E338-LA338', 'LA338', 'Laboratory Aged', 'Complete', NULL),
(698, '753–10', 'SLAB75-C-E339-LA339', 'LA339', 'Laboratory Aged', 'Complete', NULL),
(699, '753–11', 'SLAB75-C-E340-LA340', 'LA340', 'Laboratory Aged', 'Complete', NULL),
(700, '75–130', 'SLAB75-C-E341-LA341', 'LA341', 'Laboratory Aged', 'Complete', NULL),
(701, '752–16', 'SLAB75-C-E342-LA342', 'LA342', 'Laboratory Aged', 'Complete', NULL),
(702, '752–17', 'SLAB75-C-E343-LA343', 'LA343', 'Laboratory Aged', 'Complete', NULL),
(703, '752–15', 'SLAB75-C-E344-LA344', 'LA344', 'Laboratory Aged', 'Complete', NULL),
(704, '752–22', 'SLAB75-C-E345-LA345', 'LA345', 'Laboratory Aged', 'Complete', NULL),
(705, '752–23', 'SLAB75-C-E346-LA346', 'LA346', 'Laboratory Aged', 'Complete', NULL),
(706, '75–109', 'SLAB75-C-E347-LA347', 'LA347', 'Laboratory Aged', 'Complete', NULL),
(707, '751–04', 'SLAB75-C-E348-LA348', 'LA348', 'Laboratory Aged', 'Complete', NULL),
(708, '751–05', 'SLAB75-C-E349-LA349', 'LA349', 'Laboratory Aged', 'Complete', NULL),
(709, '754–29', 'SLAB75-C-E352-LA352', 'LA352', 'Laboratory Aged', 'Complete', NULL),
(710, '754–30', 'SLAB75-C-E353-LA353', 'LA353', 'Laboratory Aged', 'Complete', NULL),
(711, '75–236', 'SLAB75-C-E354-LA354', 'LA354', 'Laboratory Aged', 'Complete', NULL),
(712, '754–26', 'SLAB75-C-E355-LA355', 'LA355', 'Laboratory Aged', 'Complete', NULL),
(713, '754–27', 'SLAB75-C-E356-LA356', 'LA356', 'Laboratory Aged', 'Complete', NULL),
(714, '752–40', 'SLAB75-C-E357-LA357', 'LA357', 'Laboratory Aged', 'Complete', NULL),
(715, '752–42', 'SLAB75-C-E358-LA358', 'LA358', 'Laboratory Aged', 'Complete', NULL),
(716, '75–246', 'SLAB75-C-E359-LA359', 'LA359', 'Laboratory Aged', 'Complete', NULL),
(717, '752–28', 'SLAB75-C-E360-LA360', 'LA360', 'Laboratory Aged', 'Complete', NULL),
(718, '752–29', 'SLAB75-C-E361-LA361', 'LA361', 'Laboratory Aged', 'Complete', NULL),
(719, '75–130', 'SLAB75-C-E362-LA362', 'LA362', 'Laboratory Aged', 'Complete', NULL),
(720, '752–27', 'SLAB75-C-E363-LA363', 'LA363', 'Laboratory Aged', 'Complete', NULL),
(721, '754–09', 'SLAB75-C-E364-LA364', 'LA364', 'Laboratory Aged', 'Complete', NULL),
(722, '75–120', 'SLAB75-C-E365-LA365', 'LA365', 'Laboratory Aged', 'Complete', NULL),
(723, '753–12', 'SLAB75-C-E366-LA366', 'LA366', 'Laboratory Aged', 'Complete', NULL),
(724, '754–12', 'SLAB75-C-E367-LA367', 'LA367', 'Laboratory Aged', 'Complete', NULL),
(725, '75–270', 'SLAB75-C-E368-LA368', 'LA368', 'Laboratory Aged', 'Complete', NULL),
(726, '752–18', 'SLAB75-C-E369-LA369', 'LA369', 'Laboratory Aged', 'Complete', NULL),
(727, '752–24', 'SLAB75-C-E370-LA370', 'LA370', 'Laboratory Aged', 'Complete', NULL),
(728, '75–110', 'SLAB75-C-E371-LA371', 'LA371', 'Laboratory Aged', 'Complete', NULL),
(729, '751–06', 'SLAB75-C-E372-LA372', 'LA372', 'Laboratory Aged', 'Complete', NULL),
(730, '752–09', 'SLAB75-C-E373-LA373', 'LA373', 'Laboratory Aged', 'Complete', NULL);




-- 05
-- Reannealed_Specimen
INSERT INTO PieceOfMaterial (piece_of_material_id, material_type, material_name) VALUES
(731, 'Reannealed_Specimen', '13–12'),
(732, 'Reannealed_Specimen', '13–21'),
(733, 'Reannealed_Specimen', '13–22'),
(734, 'Reannealed_Specimen', '16–21'),
(735, 'Reannealed_Specimen', '17–21');

INSERT INTO Reannealed_Specimen
    (piece_of_material_id, specimen_id, material_id, aging_type, aging_record_status, aging_plant)
VALUES
(731, '13–12', 'COVKBR-SA122-C-E122-R122', 'Reannealed', 'Complete', 'KRB reactor, Gundremmingen'),
(732, '13–21', 'COVKBR-SA123-C-E123-R123', 'Reannealed', 'Complete', 'KRB reactor, Gundremmingen'),
(733, '13–22', 'COVKBR-SA124-C-E124-R124', 'Reannealed', 'Complete', 'KRB reactor, Gundremmingen'),
(734, '16–21', 'COVKBR-SA129-C-E129-R129', 'Reannealed', 'Complete', 'KRB reactor, Gundremmingen'),
(735, '17–21', 'COVKBR-SA130-C-E130-R130', 'Reannealed', 'Complete', 'KRB reactor, Gundremmingen');

-- 06
-- Post_Test_Specimen

INSERT INTO PieceOfMaterial (piece_of_material_id, material_type, material_name)
WITH RECURSIVE
specimens(n, specimen_id, material_base) AS (
    SELECT   1, 'I1V–01', 'IMPELI-C-E001'           UNION ALL
    SELECT   2, 'I1V–02', 'IMPELI-C-E002'           UNION ALL
    SELECT   3, 'I2V–01', 'IMPELI-C-E003'           UNION ALL
    SELECT   4, 'I2V–02', 'IMPELI-C-E004'           UNION ALL
    SELECT   5, 'I3C–01', 'IMPELI-C-E005'           UNION ALL
    SELECT   6, 'I2V–23', 'IMPELI-C-E006-LA006'     UNION ALL
    SELECT   7, 'I3C–14', 'IMPELI-C-E007-LA007'     UNION ALL
    SELECT   8, 'I3V–38', 'IMPELI-C-E008-LA008'     UNION ALL
    SELECT   9, 'I3V–39', 'IMPELI-C-E009-LA009'     UNION ALL
    SELECT  10, 'I1V–26', 'IMPELI-C-E010-LA010'     UNION ALL
    SELECT  11, 'I1V–27', 'IMPELI-C-E011-LA011'     UNION ALL
    SELECT  12, 'I2V–19', 'IMPELI-C-E012-LA012'     UNION ALL
    SELECT  13, 'I2V–03', 'IMPELI-C-E013'           UNION ALL
    SELECT  14, 'I2V–06', 'IMPELI-C-E014'           UNION ALL
    SELECT  15, 'I3C–02', 'IMPELI-C-E015'           UNION ALL
    SELECT  16, 'I2V–24', 'IMPELI-C-E016-LA016'     UNION ALL
    SELECT  17, 'I3C–15', 'IMPELI-C-E017-LA017'     UNION ALL
    SELECT  18, 'I3V–40', 'IMPELI-C-E018-LA018'     UNION ALL
    SELECT  19, 'I1V–28', 'IMPELI-C-E019-LA019'     UNION ALL
    SELECT  20, 'I1V–29', 'IMPELI-C-E020-LA020'     UNION ALL
    SELECT  21, 'I2V–20', 'IMPELI-C-E021-LA021'     UNION ALL
    SELECT  22, 'P21T–01', 'PIPEP2-C-E022'          UNION ALL
    SELECT  23, 'P23T–01', 'PIPEP2-C-E023'          UNION ALL
    SELECT  24, 'P22A–01', 'PIPEP2-C-E024'          UNION ALL
    SELECT  25, 'P23A–01', 'PIPEP2-C-E025'          UNION ALL
    SELECT  26, 'P22T–16', 'PIPEP2-C-E026-LA026'    UNION ALL
    SELECT  27, 'P21A–31', 'PIPEP2-C-E027-LA027'    UNION ALL
    SELECT  28, 'P25A–28', 'PIPEP2-C-E028-LA028'    UNION ALL
    SELECT  29, 'P21A–36', 'PIPEP2-C-E029-LA029'    UNION ALL
    SELECT  30, 'P24T–14', 'PIPEP2-C-E030-LA030'    UNION ALL
    SELECT  31, 'P25T–10', 'PIPEP2-C-E031-LA031'    UNION ALL
    SELECT  32, 'P22A–36', 'PIPEP2-C-E032-LA032'    UNION ALL
    SELECT  33, 'P21A–19', 'PIPEP2-C-E033-LA033'    UNION ALL
    SELECT  34, 'P22T–04', 'PIPEP2-C-E034-LA034'    UNION ALL
    SELECT  35, 'P23A–14', 'PIPEP2-C-E035-LA035'    UNION ALL
    SELECT  36, 'P23A–26', 'PIPEP2-C-E036-LA036'    UNION ALL
    SELECT  37, 'P22T–11', 'PIPEP2-C-E037-LA037'    UNION ALL
    SELECT  38, 'P22A–13', 'PIPEP2-C-E038-LA038'    UNION ALL
    SELECT  39, 'P24A–32', 'PIPEP2-C-E039-LA039'    UNION ALL
    SELECT  40, 'P24T–05', 'PIPEP2-C-E040-LA040'    UNION ALL
    SELECT  41, 'P24A–04', 'PIPEP2-C-E041-LA041'    UNION ALL
    SELECT  42, 'P21T–02', 'PIPEP2-C-E042'          UNION ALL
    SELECT  43, 'P23T–02', 'PIPEP2-C-E043'          UNION ALL
    SELECT  44, 'P22A–02', 'PIPEP2-C-E044'          UNION ALL
    SELECT  45, 'P23A–02', 'PIPEP2-C-E045'          UNION ALL
    SELECT  46, 'P21A–32', 'PIPEP2-C-E046-LA046'    UNION ALL
    SELECT  47, 'P21A–33', 'PIPEP2-C-E047-LA047'    UNION ALL
    SELECT  48, 'P24T–16', 'PIPEP2-C-E048-LA048'    UNION ALL
    SELECT  49, 'P21A–37', 'PIPEP2-C-E049-LA049'    UNION ALL
    SELECT  50, 'P22T–17', 'PIPEP2-C-E050-LA050'    UNION ALL
    SELECT  51, 'P21A–14', 'PIPEP2-C-E051-LA051'    UNION ALL
    SELECT  52, 'P21A–15', 'PIPEP2-C-E052-LA052'    UNION ALL
    SELECT  53, 'P21A–16', 'PIPEP2-C-E053-LA053'    UNION ALL
    SELECT  54, 'P25T–12', 'PIPEP2-C-E054-LA054'    UNION ALL
    SELECT  55, 'P21A–18', 'PIPEP2-C-E055-LA055'    UNION ALL
    SELECT  56, 'P21T–08', 'PIPEP2-C-E056-LA056'    UNION ALL
    SELECT  57, 'P22T–05', 'PIPEP2-C-E057-LA057'    UNION ALL
    SELECT  58, 'P23A–15', 'PIPEP2-C-E058-LA058'    UNION ALL
    SELECT  59, 'P23A–27', 'PIPEP2-C-E059-LA059'    UNION ALL
    SELECT  60, 'P22T–12', 'PIPEP2-C-E060-LA060'    UNION ALL
    SELECT  61, 'P24A–30', 'PIPEP2-C-E061-LA061'    UNION ALL
    SELECT  62, 'P24A–33', 'PIPEP2-C-E062-LA062'    UNION ALL
    SELECT  63, 'P24T–06', 'PIPEP2-C-E063-LA063'    UNION ALL
    SELECT  64, 'P24A–05', 'PIPEP2-C-E064-LA064'    UNION ALL
    SELECT  65, '693–40', 'SLAB69-C-E065'           UNION ALL
    SELECT  66, '693–41', 'SLAB69-C-E066'           UNION ALL
    SELECT  67, '694–30', 'SLAB69-C-E067-LA067'     UNION ALL
    SELECT  68, '694–31', 'SLAB69-C-E068-LA068'     UNION ALL
    SELECT  69, '69–135', 'SLAB69-C-E069-LA069'     UNION ALL
    SELECT  70, '694–21', 'SLAB69-C-E070-LA070'     UNION ALL
    SELECT  71, '694–25', 'SLAB69-C-E071-LA071'     UNION ALL
    SELECT  72, '692–40', 'SLAB69-C-E072-LA072'     UNION ALL
    SELECT  73, '692–41', 'SLAB69-C-E073-LA073'     UNION ALL
    SELECT  74, '69–245', 'SLAB69-C-E074-LA074'     UNION ALL
    SELECT  75, '691–28', 'SLAB69-C-E075-LA075'     UNION ALL
    SELECT  76, '691–29', 'SLAB69-C-E076-LA076'     UNION ALL
    SELECT  77, '69–230', 'SLAB69-C-E077-LA077'     UNION ALL
    SELECT  78, '692–25', 'SLAB69-C-E078-LA078'     UNION ALL
    SELECT  79, '692–26', 'SLAB69-C-E079-LA079'     UNION ALL
    SELECT  80, '694–06', 'SLAB69-C-E080-LA080'     UNION ALL
    SELECT  81, '694–07', 'SLAB69-C-E081-LA081'     UNION ALL
    SELECT  82, '694–08', 'SLAB69-C-E082-LA082'     UNION ALL
    SELECT  83, '69–119', 'SLAB69-C-E083-LA083'     UNION ALL
    SELECT  84, '693–12', 'SLAB69-C-E084-LA084'     UNION ALL
    SELECT  85, '693–13', 'SLAB69-C-E085-LA085'     UNION ALL
    SELECT  86, '69–130', 'SLAB69-C-E086-LA086'     UNION ALL
    SELECT  87, '692–16', 'SLAB69-C-E087-LA087'     UNION ALL
    SELECT  88, '692–17', 'SLAB69-C-E088-LA088'     UNION ALL
    SELECT  89, '692–15', 'SLAB69-C-E089-LA089'     UNION ALL
    SELECT  90, '692–22', 'SLAB69-C-E090-LA090'     UNION ALL
    SELECT  91, '692–23', 'SLAB69-C-E091-LA091'     UNION ALL
    SELECT  92, '69–109', 'SLAB69-C-E092-LA092'     UNION ALL
    SELECT  93, '691–04', 'SLAB69-C-E093-LA093'     UNION ALL
    SELECT  94, '691–05', 'SLAB69-C-E094-LA094'     UNION ALL
    SELECT  95, '693–42', 'SLAB69-C-E095'           UNION ALL
    SELECT  96, '694–40', 'SLAB69-C-E096'           UNION ALL
    SELECT  97, '694–32', 'SLAB69-C-E097-LA097'     UNION ALL
    SELECT  98, '694–33', 'SLAB69-C-E098-LA098'     UNION ALL
    SELECT  99, '69–236', 'SLAB69-C-E099-LA099'     UNION ALL
    SELECT 100, '694–26', 'SLAB69-C-E100-LA100'     UNION ALL
    SELECT 101, '694–27', 'SLAB69-C-E101-LA101'     UNION ALL
    SELECT 102, '692–42', 'SLAB69-C-E102-LA102'     UNION ALL
    SELECT 103, '694–39', 'SLAB69-C-E103-LA103'     UNION ALL
    SELECT 104, '69–246', 'SLAB69-C-E104-LA104'     UNION ALL
    SELECT 105, '692–28', 'SLAB69-C-E105-LA105'     UNION ALL
    SELECT 106, '692–29', 'SLAB69-C-E106-LA106'     UNION ALL
    SELECT 107, '69–130', 'SLAB69-C-E107-LA107'     UNION ALL
    SELECT 108, '692–27', 'SLAB69-C-E108-LA108'     UNION ALL
    SELECT 109, '694–09', 'SLAB69-C-E109-LA109'     UNION ALL
    SELECT 110, '69–120', 'SLAB69-C-E110-LA110'     UNION ALL
    SELECT 111, '693–14', 'SLAB69-C-E111-LA111'     UNION ALL
    SELECT 112, '693–15', 'SLAB69-C-E112-LA112'     UNION ALL
    SELECT 113, '69–270', 'SLAB69-C-E113-LA113'     UNION ALL
    SELECT 114, '692–18', 'SLAB69-C-E114-LA114'     UNION ALL
    SELECT 115, '692–24', 'SLAB69-C-E115-LA115'     UNION ALL
    SELECT 116, '69–110', 'SLAB69-C-E116-LA116'     UNION ALL
    SELECT 117, '691–06', 'SLAB69-C-E117-LA117'     UNION ALL
    SELECT 118, '692–09', 'SLAB69-C-E118-LA118'     UNION ALL
    SELECT 119, '18–11',   'COVKBR-SA119-C-E119'    UNION ALL
    SELECT 120, '18–12',   'COVKBR-SA120-C-E120'    UNION ALL
    SELECT 121, '18–22',   'COVKBR-SA121-C-E121'    UNION ALL
    SELECT 122, '13–12',   'COVKBR-SA122-C-E122-R122' UNION ALL
    SELECT 123, '13–21',   'COVKBR-SA123-C-E123-R123' UNION ALL
    SELECT 124, '13–22',   'COVKBR-SA124-C-E124-R124' UNION ALL
    SELECT 125, '15–11',   'COVKBR-SA125-C-E125'    UNION ALL
    SELECT 126, '15–12',   'COVKBR-SA126-C-E126'    UNION ALL
    SELECT 127, '15–21',   'COVKBR-SA127-C-E127'    UNION ALL
    SELECT 128, '15–22',   'COVKBR-SA128-C-E128'    UNION ALL
    SELECT 129, '16–21',   'COVKBR-SA129-C-E129-R129' UNION ALL
    SELECT 130, '17–21',   'COVKBR-SA130-C-E130-R130' UNION ALL
    SELECT 131, 'P13T–01', 'PIPEP1-C-E131'          UNION ALL
    SELECT 132, 'P13T–03', 'PIPEP1-C-E132'          UNION ALL
    SELECT 133, 'P11A–01', 'PIPEP1-C-E133'          UNION ALL
    SELECT 134, 'P13A–01', 'PIPEP1-C-E134'          UNION ALL
    SELECT 135, 'P14T–09', 'PIPEP1-C-E135-LA135'    UNION ALL
    SELECT 136, 'P11A–25', 'PIPEP1-C-E136-LA136'    UNION ALL
    SELECT 137, 'P14A–26', 'PIPEP1-C-E137-LA137'    UNION ALL
    SELECT 138, 'P11A–28', 'PIPEP1-C-E138-LA138'    UNION ALL
    SELECT 139, 'P11A–29', 'PIPEP1-C-E139-LA139'    UNION ALL
    SELECT 140, 'P11A–10', 'PIPEP1-C-E140-LA140'    UNION ALL
    SELECT 141, 'P11T–06', 'PIPEP1-C-E141-LA141'    UNION ALL
    SELECT 142, 'P14T–08', 'PIPEP1-C-E142-LA142'    UNION ALL
    SELECT 143, 'P11A–13', 'PIPEP1-C-E143-LA143'    UNION ALL
    SELECT 144, 'P12A–25', 'PIPEP1-C-E144-LA144'    UNION ALL
    SELECT 145, 'P12T–05', 'PIPEP1-C-E145-LA145'    UNION ALL
    SELECT 146, 'P12T–06', 'PIPEP1-C-E146-LA146'    UNION ALL
    SELECT 147, 'P12A–08', 'PIPEP1-C-E147-LA147'    UNION ALL
    SELECT 148, 'P12A–09', 'PIPEP1-C-E148-LA148'    UNION ALL
    SELECT 149, 'P12T–11', 'PIPEP1-C-E149-LA149'    UNION ALL
    SELECT 150, 'P12A–13', 'PIPEP1-C-E150-LA150'    UNION ALL
    SELECT 151, 'P12A–14', 'PIPEP1-C-E151-LA151'    UNION ALL
    SELECT 152, 'P13T–07', 'PIPEP1-C-E152-LA152'    UNION ALL
    SELECT 153, 'P13A–07', 'PIPEP1-C-E153-LA153'    UNION ALL
    SELECT 154, 'P13T–02', 'PIPEP1-C-E154'          UNION ALL
    SELECT 155, 'P14T–01', 'PIPEP1-C-E155'          UNION ALL
    SELECT 156, 'P11A–02', 'PIPEP1-C-E156'          UNION ALL
    SELECT 157, 'P13A–02', 'PIPEP1-C-E157'          UNION ALL
    SELECT 158, 'P14T–10', 'PIPEP1-C-E158-LA158'    UNION ALL
    SELECT 159, 'P11A–26', 'PIPEP1-C-E159-LA159'    UNION ALL
    SELECT 160, 'P14A–27', 'PIPEP1-C-E160-LA160'    UNION ALL
    SELECT 161, 'P11A–27', 'PIPEP1-C-E161-LA161'    UNION ALL
    SELECT 162, 'P11A–30', 'PIPEP1-C-E162-LA162'    UNION ALL
    SELECT 163, 'P11A–09', 'PIPEP1-C-E163-LA163'    UNION ALL
    SELECT 164, 'P12A–19', 'PIPEP1-C-E164-LA164'    UNION ALL
    SELECT 165, 'P12A–22', 'PIPEP1-C-E165-LA165'    UNION ALL
    SELECT 166, 'P11A–12', 'PIPEP1-C-E166-LA166'    UNION ALL
    SELECT 167, 'P12A–26', 'PIPEP1-C-E167-LA167'    UNION ALL
    SELECT 168, 'P12T–08', 'PIPEP1-C-E168-LA168'    UNION ALL
    SELECT 169, 'P12A–10', 'PIPEP1-C-E169-LA169'    UNION ALL
    SELECT 170, 'P12A–11', 'PIPEP1-C-E170-LA170'    UNION ALL
    SELECT 171, 'P12T–12', 'PIPEP1-C-E171-LA171'    UNION ALL
    SELECT 172, 'P14A–22', 'PIPEP1-C-E172-LA172'    UNION ALL
    SELECT 173, 'P14A–23', 'PIPEP1-C-E173-LA173'    UNION ALL
    SELECT 174, 'P13T–08', 'PIPEP1-C-E174-LA174'    UNION ALL
    SELECT 175, 'P13A–08', 'PIPEP1-C-E175-LA175'    UNION ALL
    SELECT 176, '683–40', 'SLAB68-C-E176'           UNION ALL
    SELECT 177, '683–41', 'SLAB68-C-E177'           UNION ALL
    SELECT 178, '683–33', 'SLAB68-C-E178-LA178'     UNION ALL
    SELECT 179, '684–31', 'SLAB68-C-E179-LA179'     UNION ALL
    SELECT 180, '68–145', 'SLAB68-C-E180-LA180'     UNION ALL
    SELECT 181, '684–21', 'SLAB68-C-E181-LA181'     UNION ALL
    SELECT 182, '684–22', 'SLAB68-C-E182-LA182'     UNION ALL
    SELECT 183, '682–41', 'SLAB68-C-E183-LA183'     UNION ALL
    SELECT 184, '684–39', 'SLAB68-C-E184-LA184'     UNION ALL
    SELECT 185, '68–264', 'SLAB68-C-E185-LA185'     UNION ALL
    SELECT 186, '681–28', 'SLAB68-C-E186-LA186'     UNION ALL
    SELECT 187, '681–29', 'SLAB68-C-E187-LA187'     UNION ALL
    SELECT 188, '68–230', 'SLAB68-C-E188-LA188'     UNION ALL
    SELECT 189, '682–25', 'SLAB68-C-E189-LA189'     UNION ALL
    SELECT 190, '682–26', 'SLAB68-C-E190-LA190'     UNION ALL
    SELECT 191, '684–06', 'SLAB68-C-E191-LA191'     UNION ALL
    SELECT 192, '684–07', 'SLAB68-C-E192-LA192'     UNION ALL
    SELECT 193, '684–08', 'SLAB68-C-E193-LA193'     UNION ALL
    SELECT 194, '68–129', 'SLAB68-C-E194-LA194'     UNION ALL
    SELECT 195, '684–10', 'SLAB68-C-E195-LA195'     UNION ALL
    SELECT 196, '684–11', 'SLAB68-C-E196-LA196'     UNION ALL
    SELECT 197, '68–139', 'SLAB68-C-E197-LA197'     UNION ALL
    SELECT 198, '682–16', 'SLAB68-C-E198-LA198'     UNION ALL
    SELECT 199, '682–17', 'SLAB68-C-E199-LA199'     UNION ALL
    SELECT 200, '682–15', 'SLAB68-C-E200-LA200'     UNION ALL
    SELECT 201, '682–22', 'SLAB68-C-E201-LA201'     UNION ALL
    SELECT 202, '682–23', 'SLAB68-C-E202-LA202'     UNION ALL
    SELECT 203, '68–119', 'SLAB68-C-E203-LA203'     UNION ALL
    SELECT 204, '681–04', 'SLAB68-C-E204-LA204'     UNION ALL
    SELECT 205, '681–05', 'SLAB68-C-E205-LA205'     UNION ALL
    SELECT 206, '683–42', 'SLAB68-C-E206'           UNION ALL
    SELECT 207, '684–40', 'SLAB68-C-E207'           UNION ALL
    SELECT 208, '684–32', 'SLAB68-C-E208-LA208'     UNION ALL
    SELECT 209, '684–33', 'SLAB68-C-E209-LA209'     UNION ALL
    SELECT 210, '68–246', 'SLAB68-C-E210-LA210'     UNION ALL
    SELECT 211, '684–23', 'SLAB68-C-E211-LA211'     UNION ALL
    SELECT 212, '684–24', 'SLAB68-C-E212-LA212'     UNION ALL
    SELECT 213, '682–40', 'SLAB68-C-E213-LA213'     UNION ALL
    SELECT 214, '682–42', 'SLAB68-C-E214-LA214'     UNION ALL
    SELECT 215, '68–263', 'SLAB68-C-E215-LA215'     UNION ALL
    SELECT 216, '682–28', 'SLAB68-C-E216-LA216'     UNION ALL
    SELECT 217, '682–29', 'SLAB68-C-E217-LA217'     UNION ALL
    SELECT 218, '68–130', 'SLAB68-C-E218-LA218'     UNION ALL
    SELECT 219, '682–27', 'SLAB68-C-E219-LA219'     UNION ALL
    SELECT 220, '684–09', 'SLAB68-C-E220-LA220'     UNION ALL
    SELECT 221, '68–130', 'SLAB68-C-E221-LA221'     UNION ALL
    SELECT 222, '684–12', 'SLAB68-C-E222-LA222'     UNION ALL
    SELECT 223, '684–15', 'SLAB68-C-E223-LA223'     UNION ALL
    SELECT 224, '68–140', 'SLAB68-C-E224-LA224'     UNION ALL
    SELECT 225, '682–18', 'SLAB68-C-E225-LA225'     UNION ALL
    SELECT 226, '682–24', 'SLAB68-C-E226-LA226'     UNION ALL
    SELECT 227, '68–120', 'SLAB68-C-E227-LA227'     UNION ALL
    SELECT 228, '681–06', 'SLAB68-C-E228-LA228'     UNION ALL
    SELECT 229, '682–09', 'SLAB68-C-E229-LA229'     UNION ALL
    SELECT 230, '733–40', 'SLAB73-C-E230'           UNION ALL
    SELECT 231, '733–41', 'SLAB73-C-E231'           UNION ALL
    SELECT 232, '734–23', 'SLAB73-C-E232-LA232'     UNION ALL
    SELECT 233, '734–24', 'SLAB73-C-E233-LA233'     UNION ALL
    SELECT 234, '732–25', 'SLAB73-C-E234-LA234'     UNION ALL
    SELECT 235, '732–26', 'SLAB73-C-E235-LA235'     UNION ALL
    SELECT 236, '734–06', 'SLAB73-C-E236-LA236'     UNION ALL
    SELECT 237, '734–07', 'SLAB73-C-E237-LA237'     UNION ALL
    SELECT 238, '73–119', 'SLAB73-C-E238-LA238'     UNION ALL
    SELECT 239, '732–16', 'SLAB73-C-E239-LA239'     UNION ALL
    SELECT 240, '732–17', 'SLAB73-C-E240-LA240'     UNION ALL
    SELECT 241, '732–15', 'SLAB73-C-E241-LA241'     UNION ALL
    SELECT 242, '732–22', 'SLAB73-C-E242-LA242'     UNION ALL
    SELECT 243, '73–109', 'SLAB73-C-E243-LA243'     UNION ALL
    SELECT 244, '731–04', 'SLAB73-C-E244-LA244'     UNION ALL
    SELECT 245, '731–05', 'SLAB73-C-E245-LA245'     UNION ALL
    SELECT 246, '733–42', 'SLAB73-C-E246'           UNION ALL
    SELECT 247, '734–40', 'SLAB73-C-E247'           UNION ALL
    SELECT 248, '734–19', 'SLAB73-C-E248-LA248'     UNION ALL
    SELECT 249, '734–22', 'SLAB73-C-E249-LA249'     UNION ALL
    SELECT 250, '732–27', 'SLAB73-C-E250-LA250'     UNION ALL
    SELECT 251, '734–08', 'SLAB73-C-E251-LA251'     UNION ALL
    SELECT 252, '734–09', 'SLAB73-C-E252-LA252'     UNION ALL
    SELECT 253, '73–120', 'SLAB73-C-E253-LA253'     UNION ALL
    SELECT 254, '732–18', 'SLAB73-C-E254-LA254'     UNION ALL
    SELECT 255, '732–23', 'SLAB73-C-E255-LA255'     UNION ALL
    SELECT 256, '732–24', 'SLAB73-C-E256-LA256'     UNION ALL
    SELECT 257, '73–110', 'SLAB73-C-E257-LA257'     UNION ALL
    SELECT 258, '731–06', 'SLAB73-C-E258-LA258'     UNION ALL
    SELECT 259, '732–09', 'SLAB73-C-E259-LA259'     UNION ALL
    SELECT 260, '205–26', 'PIPE205-C-E260-LA260'    UNION ALL
    SELECT 261, '205–27', 'PIPE205-C-E261-LA261'    UNION ALL
    SELECT 262, '205–30', 'PIPE205-C-E262-LA262'    UNION ALL
    SELECT 263, '205–25', 'PIPE205-C-E263-LA263'    UNION ALL
    SELECT 264, '205–28', 'PIPE205-C-E264-LA264'    UNION ALL
    SELECT 265, '205–29', 'PIPE205-C-E265-LA265'    UNION ALL
    SELECT 266, '743–40', 'SLAB74-C-E266'           UNION ALL
    SELECT 267, '743–41', 'SLAB74-C-E267'           UNION ALL
    SELECT 268, '743–36', 'SLAB74-C-E268-LA268'     UNION ALL
    SELECT 269, '744–34', 'SLAB74-C-E269-LA269'     UNION ALL
    SELECT 270, '74–135', 'SLAB74-C-E270-LA270'     UNION ALL
    SELECT 271, '744–21', 'SLAB74-C-E271-LA271'     UNION ALL
    SELECT 272, '744–25', 'SLAB74-C-E272-LA272'     UNION ALL
    SELECT 273, '742–42', 'SLAB74-C-E273-LA273'     UNION ALL
    SELECT 274, '744–39', 'SLAB74-C-E274-LA274'     UNION ALL
    SELECT 275, '74–245', 'SLAB74-C-E275-LA275'     UNION ALL
    SELECT 276, '741–28', 'SLAB74-C-E276-LA276'     UNION ALL
    SELECT 277, '741–29', 'SLAB74-C-E277-LA277'     UNION ALL
    SELECT 278, '74–230', 'SLAB74-C-E278-LA278'     UNION ALL
    SELECT 279, '742–25', 'SLAB74-C-E279-LA279'     UNION ALL
    SELECT 280, '742–26', 'SLAB74-C-E280-LA280'     UNION ALL
    SELECT 281, '744–07', 'SLAB74-C-E281-LA281'     UNION ALL
    SELECT 282, '744–08', 'SLAB74-C-E282-LA282'     UNION ALL
    SELECT 283, '74–119', 'SLAB74-C-E283-LA283'     UNION ALL
    SELECT 284, '743–13', 'SLAB74-C-E284-LA284'     UNION ALL
    SELECT 285, '743–14', 'SLAB74-C-E285-LA285'     UNION ALL
    SELECT 286, '74–130', 'SLAB74-C-E286-LA286'     UNION ALL
    SELECT 287, '742–16', 'SLAB74-C-E287-LA287'     UNION ALL
    SELECT 288, '742–17', 'SLAB74-C-E288-LA288'     UNION ALL
    SELECT 289, '742–22', 'SLAB74-C-E289-LA289'     UNION ALL
    SELECT 290, '742–23', 'SLAB74-C-E290-LA290'     UNION ALL
    SELECT 291, '74–110', 'SLAB74-C-E291-LA291'     UNION ALL
    SELECT 292, '741–04', 'SLAB74-C-E292-LA292'     UNION ALL
    SELECT 293, '741–05', 'SLAB74-C-E293-LA293'     UNION ALL
    SELECT 294, '744–40', 'SLAB74-C-E294'           UNION ALL
    SELECT 295, '743–42', 'SLAB74-C-E295'           UNION ALL
    SELECT 296, '744–35', 'SLAB74-C-E296-LA296'     UNION ALL
    SELECT 297, '744–36', 'SLAB74-C-E297-LA297'     UNION ALL
    SELECT 298, '74–236', 'SLAB74-C-E298-LA298'     UNION ALL
    SELECT 299, '744–26', 'SLAB74-C-E299-LA299'     UNION ALL
    SELECT 300, '744–27', 'SLAB74-C-E300-LA300'     UNION ALL
    SELECT 301, '742–40', 'SLAB74-C-E301-LA301'     UNION ALL
    SELECT 302, '742–41', 'SLAB74-C-E302-LA302'     UNION ALL
    SELECT 303, '74–246', 'SLAB74-C-E303-LA303'     UNION ALL
    SELECT 304, '742–28', 'SLAB74-C-E304-LA304'     UNION ALL
    SELECT 305, '742–29', 'SLAB74-C-E305-LA305'     UNION ALL
    SELECT 306, '74–130', 'SLAB74-C-E306-LA306'     UNION ALL
    SELECT 307, '742–27', 'SLAB74-C-E307-LA307'     UNION ALL
    SELECT 308, '744–06', 'SLAB74-C-E308-LA308'     UNION ALL
    SELECT 309, '744–09', 'SLAB74-C-E309-LA309'     UNION ALL
    SELECT 310, '74–120', 'SLAB74-C-E310-LA310'     UNION ALL
    SELECT 311, '744–18', 'SLAB74-C-E311-LA311'     UNION ALL
    SELECT 312, '743–15', 'SLAB74-C-E312-LA312'     UNION ALL
    SELECT 313, '74–270', 'SLAB74-C-E313-LA313'     UNION ALL
    SELECT 314, '742–18', 'SLAB74-C-E314-LA314'     UNION ALL
    SELECT 315, '742–15', 'SLAB74-C-E315-LA315'     UNION ALL
    SELECT 316, '742–24', 'SLAB74-C-E316-LA316'     UNION ALL
    SELECT 317, '74–109', 'SLAB74-C-E317-LA317'     UNION ALL
    SELECT 318, '741–06', 'SLAB74-C-E318-LA318'     UNION ALL
    SELECT 319, '742–09', 'SLAB74-C-E319-LA319'     UNION ALL
    SELECT 320, '753–40', 'SLAB75-C-E320'           UNION ALL
    SELECT 321, '753–41', 'SLAB75-C-E321'           UNION ALL
    SELECT 322, '753–30', 'SLAB75-C-E322-LA322'     UNION ALL
    SELECT 323, '754–28', 'SLAB75-C-E323-LA323'     UNION ALL
    SELECT 324, '75–135', 'SLAB75-C-E324-LA324'     UNION ALL
    SELECT 325, '754–21', 'SLAB75-C-E325-LA325'     UNION ALL
    SELECT 326, '754–25', 'SLAB75-C-E326-LA326'     UNION ALL
    SELECT 327, '752–41', 'SLAB75-C-E327-LA327'     UNION ALL
    SELECT 328, '754–39', 'SLAB75-C-E328-LA328'     UNION ALL
    SELECT 329, '75–245', 'SLAB75-C-E329-LA329'     UNION ALL
    SELECT 330, '751–28', 'SLAB75-C-E330-LA330'     UNION ALL
    SELECT 331, '751–29', 'SLAB75-C-E331-LA331'     UNION ALL
    SELECT 332, '75–230', 'SLAB75-C-E332-LA332'     UNION ALL
    SELECT 333, '752–25', 'SLAB75-C-E333-LA333'     UNION ALL
    SELECT 334, '752–26', 'SLAB75-C-E334-LA334'     UNION ALL
    SELECT 335, '754–06', 'SLAB75-C-E335-LA335'     UNION ALL
    SELECT 336, '754–07', 'SLAB75-C-E336-LA336'     UNION ALL
    SELECT 337, '754–08', 'SLAB75-C-E337-LA337'     UNION ALL
    SELECT 338, '75–119', 'SLAB75-C-E338-LA338'     UNION ALL
    SELECT 339, '753–10', 'SLAB75-C-E339-LA339'     UNION ALL
    SELECT 340, '753–11', 'SLAB75-C-E340-LA340'     UNION ALL
    SELECT 341, '75–130', 'SLAB75-C-E341-LA341'     UNION ALL
    SELECT 342, '752–16', 'SLAB75-C-E342-LA342'     UNION ALL
    SELECT 343, '752–17', 'SLAB75-C-E343-LA343'     UNION ALL
    SELECT 344, '752–15', 'SLAB75-C-E344-LA344'     UNION ALL
    SELECT 345, '752–22', 'SLAB75-C-E345-LA345'     UNION ALL
    SELECT 346, '752–23', 'SLAB75-C-E346-LA346'     UNION ALL
    SELECT 347, '75–109', 'SLAB75-C-E347-LA347'     UNION ALL
    SELECT 348, '751–04', 'SLAB75-C-E348-LA348'     UNION ALL
    SELECT 349, '751–05', 'SLAB75-C-E349-LA349'     UNION ALL
    SELECT 350, '754–40', 'SLAB75-C-E350'           UNION ALL
    SELECT 351, '753–42', 'SLAB75-C-E351'           UNION ALL
    SELECT 352, '754–29', 'SLAB75-C-E352-LA352'     UNION ALL
    SELECT 353, '754–30', 'SLAB75-C-E353-LA353'     UNION ALL
    SELECT 354, '75–236', 'SLAB75-C-E354-LA354'     UNION ALL
    SELECT 355, '754–26', 'SLAB75-C-E355-LA355'     UNION ALL
    SELECT 356, '754–27', 'SLAB75-C-E356-LA356'     UNION ALL
    SELECT 357, '752–40', 'SLAB75-C-E357-LA357'     UNION ALL
    SELECT 358, '752–42', 'SLAB75-C-E358-LA358'     UNION ALL
    SELECT 359, '75–246', 'SLAB75-C-E359-LA359'     UNION ALL
    SELECT 360, '752–28', 'SLAB75-C-E360-LA360'     UNION ALL
    SELECT 361, '752–29', 'SLAB75-C-E361-LA361'     UNION ALL
    SELECT 362, '75–130', 'SLAB75-C-E362-LA362'     UNION ALL
    SELECT 363, '752–27', 'SLAB75-C-E363-LA363'     UNION ALL
    SELECT 364, '754–09', 'SLAB75-C-E364-LA364'     UNION ALL
    SELECT 365, '75–120', 'SLAB75-C-E365-LA365'     UNION ALL
    SELECT 366, '753–12', 'SLAB75-C-E366-LA366'     UNION ALL
    SELECT 367, '754–12', 'SLAB75-C-E367-LA367'     UNION ALL
    SELECT 368, '75–270', 'SLAB75-C-E368-LA368'     UNION ALL
    SELECT 369, '752–18', 'SLAB75-C-E369-LA369'     UNION ALL
    SELECT 370, '752–24', 'SLAB75-C-E370-LA370'     UNION ALL
    SELECT 371, '75–110', 'SLAB75-C-E371-LA371'     UNION ALL
    SELECT 372, '751–06', 'SLAB75-C-E372-LA372'     UNION ALL
    SELECT 373, '752–09', 'SLAB75-C-E373-LA373'
),
halves(half_order, half) AS (
    SELECT 1, 'T1' UNION ALL
    SELECT 2, 'T2'
)
SELECT
    735 + ROW_NUMBER() OVER (ORDER BY n, half_order) AS piece_of_material_id,
    'Post_Test_Specimen' AS material_type,
    CONCAT(material_base, '-', half) AS material_name
FROM specimens
CROSS JOIN halves;



INSERT INTO Post_Test_Specimen
    (piece_of_material_id, specimen_id, material_id,
     fracture_location, fracture_cross_section_shape,
     fracture_surface_appearance, post_test_observations)
SELECT
    pom.piece_of_material_id,
    REPLACE(REPLACE(pom.material_name, '-T1', ''), '-T2', '') AS specimen_id,
    pom.material_name AS material_id,
    NULL, NULL, NULL, NULL
FROM PieceOfMaterial pom
WHERE pom.material_type = 'Post_Test_Specimen';



-- verify
SELECT COUNT(*) FROM PieceOfMaterial WHERE material_type = 'Post_Test_Specimen';
-- Expected: 746

SELECT COUNT(*) FROM Post_Test_Specimen;
-- Expected: 746

SELECT * FROM PieceOfMaterial WHERE material_name IN ('IMPELI-C-E001-T1', 'IMPELI-C-E001-T2');
-- Expected: 2 rows



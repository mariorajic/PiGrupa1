-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 19, 2018 at 06:36 PM
-- Server version: 5.7.21-0ubuntu0.17.10.1
-- PHP Version: 7.2.4-1+ubuntu17.10.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pi-grupa1`
--

-- --------------------------------------------------------

--
-- Table structure for table `berbe`
--

CREATE TABLE `berbe` (
  `id` int(11) NOT NULL,
  `id_sadnje` int(11) NOT NULL,
  `datum` date NOT NULL,
  `kolicina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `biljke`
--

CREATE TABLE `biljke` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `farme`
--

CREATE TABLE `farme` (
  `id` int(11) NOT NULL,
  `id_parcele` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gradovi`
--

CREATE TABLE `gradovi` (
  `id` int(11) NOT NULL,
  `ime` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `id` int(11) NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `kontakt` varchar(255) NOT NULL,
  `id_zadruge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mljekomati`
--

CREATE TABLE `mljekomati` (
  `id` int(11) NOT NULL,
  `id_korisnika` int(11) NOT NULL,
  `lokacija` varchar(255) NOT NULL,
  `kapacitet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oranice`
--

CREATE TABLE `oranice` (
  `id` int(11) NOT NULL,
  `id_parcele` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL,
  `lokacija` varchar(255) NOT NULL,
  `koordinate` varchar(255) NOT NULL,
  `dimenzije` varchar(255) NOT NULL,
  `tlo` varchar(255) NOT NULL,
  `tip_parcele` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parcele`
--

CREATE TABLE `parcele` (
  `id` int(11) NOT NULL,
  `id_korisnika` int(11) NOT NULL,
  `koordinate` varchar(255) NOT NULL,
  `dimenzije` int(11) NOT NULL,
  `id_grada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prodaje_biljaka`
--

CREATE TABLE `prodaje_biljaka` (
  `id` int(11) NOT NULL,
  `id_biljke` int(11) NOT NULL,
  `kolicina` int(11) NOT NULL,
  `profit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prodaje_sirovina`
--

CREATE TABLE `prodaje_sirovina` (
  `id` int(11) NOT NULL,
  `id_sirovine` int(11) NOT NULL,
  `kolicina` int(11) NOT NULL,
  `datum` date NOT NULL,
  `profit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `punjenje_mljekomata`
--

CREATE TABLE `punjenje_mljekomata` (
  `id` int(11) NOT NULL,
  `id_mljekomata` int(11) NOT NULL,
  `datum` date NOT NULL,
  `troskovi` int(11) NOT NULL,
  `profit` int(11) NOT NULL,
  `preostala_kolicina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radnje_oranica`
--

CREATE TABLE `radnje_oranica` (
  `id` int(11) NOT NULL,
  `id_tip_radnje` int(11) NOT NULL,
  `datum` date NOT NULL,
  `id_oranice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radnje_stroja`
--

CREATE TABLE `radnje_stroja` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL,
  `datum` date NOT NULL,
  `trosak` int(11) DEFAULT NULL,
  `profit` int(11) DEFAULT NULL,
  `id_stroja` int(11) NOT NULL,
  `tip_radnje_stroja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sadnje`
--

CREATE TABLE `sadnje` (
  `id` int(11) NOT NULL,
  `biljka` int(11) NOT NULL,
  `id_oranice` int(11) NOT NULL,
  `datum` date NOT NULL,
  `kolicina` int(11) NOT NULL,
  `troskovi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `servisi_mljekomata`
--

CREATE TABLE `servisi_mljekomata` (
  `id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `troskovi` int(11) NOT NULL,
  `id_mljekomata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sirovine`
--

CREATE TABLE `sirovine` (
  `id` int(11) NOT NULL,
  `id_zivotinje` int(11) DEFAULT NULL,
  `naziv` varchar(255) NOT NULL,
  `datum` date NOT NULL,
  `kolicina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_zivotinje`
--

CREATE TABLE `status_zivotinje` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `strojevi`
--

CREATE TABLE `strojevi` (
  `id` int(11) NOT NULL,
  `naziv` int(11) NOT NULL,
  `datum_kupovine` date NOT NULL,
  `trosak` int(11) NOT NULL,
  `vrijednost` int(11) NOT NULL,
  `id_parcele` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tip_radnje_oranice`
--

CREATE TABLE `tip_radnje_oranice` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tip_radnje_stroja`
--

CREATE TABLE `tip_radnje_stroja` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `troskovi`
--

CREATE TABLE `troskovi` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL,
  `datum` date NOT NULL,
  `trosak` int(11) NOT NULL,
  `id_parcele` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zadruge`
--

CREATE TABLE `zadruge` (
  `id` int(11) NOT NULL,
  `ime` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zivotinje`
--

CREATE TABLE `zivotinje` (
  `id` int(11) NOT NULL,
  `id_farme` int(11) NOT NULL,
  `vrsta` varchar(255) NOT NULL,
  `broj_taga` int(11) NOT NULL,
  `kolicina` int(11) NOT NULL,
  `status` int(9) NOT NULL,
  `uzrok_smrti` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berbe`
--
ALTER TABLE `berbe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sadnje` (`id_sadnje`);

--
-- Indexes for table `biljke`
--
ALTER TABLE `biljke`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farme`
--
ALTER TABLE `farme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_korisnika` (`id_parcele`);

--
-- Indexes for table `gradovi`
--
ALTER TABLE `gradovi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_zadruge` (`id_zadruge`);

--
-- Indexes for table `mljekomati`
--
ALTER TABLE `mljekomati`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_korisnika` (`id_korisnika`);

--
-- Indexes for table `oranice`
--
ALTER TABLE `oranice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tip_parcele` (`tip_parcele`),
  ADD KEY `id_korisnika` (`id_parcele`);

--
-- Indexes for table `parcele`
--
ALTER TABLE `parcele`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_korisnika` (`id_korisnika`),
  ADD KEY `id_grada` (`id_grada`);

--
-- Indexes for table `prodaje_biljaka`
--
ALTER TABLE `prodaje_biljaka`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_biljke` (`id_biljke`);

--
-- Indexes for table `prodaje_sirovina`
--
ALTER TABLE `prodaje_sirovina`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sirovine` (`id_sirovine`);

--
-- Indexes for table `punjenje_mljekomata`
--
ALTER TABLE `punjenje_mljekomata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mljekomata` (`id_mljekomata`);

--
-- Indexes for table `radnje_oranica`
--
ALTER TABLE `radnje_oranica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tip_radnje` (`id_tip_radnje`),
  ADD KEY `id_oranice` (`id_oranice`);

--
-- Indexes for table `radnje_stroja`
--
ALTER TABLE `radnje_stroja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_stroja` (`id_stroja`),
  ADD KEY `tip_radnje_stroja` (`tip_radnje_stroja`);

--
-- Indexes for table `sadnje`
--
ALTER TABLE `sadnje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_parcele` (`id_oranice`),
  ADD KEY `biljka` (`biljka`);

--
-- Indexes for table `servisi_mljekomata`
--
ALTER TABLE `servisi_mljekomata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mljekomata` (`id_mljekomata`);

--
-- Indexes for table `sirovine`
--
ALTER TABLE `sirovine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_zivotinje` (`id_zivotinje`);

--
-- Indexes for table `status_zivotinje`
--
ALTER TABLE `status_zivotinje`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strojevi`
--
ALTER TABLE `strojevi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_parcele` (`id_parcele`);

--
-- Indexes for table `tip_radnje_oranice`
--
ALTER TABLE `tip_radnje_oranice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tip_radnje_stroja`
--
ALTER TABLE `tip_radnje_stroja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `troskovi`
--
ALTER TABLE `troskovi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_parcele` (`id_parcele`);

--
-- Indexes for table `zadruge`
--
ALTER TABLE `zadruge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zivotinje`
--
ALTER TABLE `zivotinje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_parcele` (`id_farme`),
  ADD KEY `status` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berbe`
--
ALTER TABLE `berbe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `biljke`
--
ALTER TABLE `biljke`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `farme`
--
ALTER TABLE `farme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gradovi`
--
ALTER TABLE `gradovi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mljekomati`
--
ALTER TABLE `mljekomati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oranice`
--
ALTER TABLE `oranice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `parcele`
--
ALTER TABLE `parcele`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prodaje_biljaka`
--
ALTER TABLE `prodaje_biljaka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prodaje_sirovina`
--
ALTER TABLE `prodaje_sirovina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `punjenje_mljekomata`
--
ALTER TABLE `punjenje_mljekomata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `radnje_oranica`
--
ALTER TABLE `radnje_oranica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `radnje_stroja`
--
ALTER TABLE `radnje_stroja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sadnje`
--
ALTER TABLE `sadnje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `servisi_mljekomata`
--
ALTER TABLE `servisi_mljekomata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sirovine`
--
ALTER TABLE `sirovine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `status_zivotinje`
--
ALTER TABLE `status_zivotinje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `strojevi`
--
ALTER TABLE `strojevi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tip_radnje_oranice`
--
ALTER TABLE `tip_radnje_oranice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `troskovi`
--
ALTER TABLE `troskovi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zadruge`
--
ALTER TABLE `zadruge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zivotinje`
--
ALTER TABLE `zivotinje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `berbe`
--
ALTER TABLE `berbe`
  ADD CONSTRAINT `berbe_ibfk_1` FOREIGN KEY (`id_sadnje`) REFERENCES `sadnje` (`id`);

--
-- Constraints for table `farme`
--
ALTER TABLE `farme`
  ADD CONSTRAINT `farme_ibfk_1` FOREIGN KEY (`id_parcele`) REFERENCES `parcele` (`id`);

--
-- Constraints for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD CONSTRAINT `korisnici_ibfk_1` FOREIGN KEY (`id_zadruge`) REFERENCES `zadruge` (`id`);

--
-- Constraints for table `mljekomati`
--
ALTER TABLE `mljekomati`
  ADD CONSTRAINT `mljekomati_ibfk_1` FOREIGN KEY (`id_korisnika`) REFERENCES `korisnici` (`id`);

--
-- Constraints for table `oranice`
--
ALTER TABLE `oranice`
  ADD CONSTRAINT `oranice_ibfk_1` FOREIGN KEY (`id_parcele`) REFERENCES `parcele` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parcele`
--
ALTER TABLE `parcele`
  ADD CONSTRAINT `parcele_ibfk_1` FOREIGN KEY (`id_korisnika`) REFERENCES `korisnici` (`id`),
  ADD CONSTRAINT `parcele_ibfk_2` FOREIGN KEY (`id_grada`) REFERENCES `gradovi` (`id`);

--
-- Constraints for table `prodaje_biljaka`
--
ALTER TABLE `prodaje_biljaka`
  ADD CONSTRAINT `prodaje_biljaka_ibfk_1` FOREIGN KEY (`id_biljke`) REFERENCES `biljke` (`id`);

--
-- Constraints for table `prodaje_sirovina`
--
ALTER TABLE `prodaje_sirovina`
  ADD CONSTRAINT `prodaje_sirovina_ibfk_1` FOREIGN KEY (`id_sirovine`) REFERENCES `sirovine` (`id`);

--
-- Constraints for table `punjenje_mljekomata`
--
ALTER TABLE `punjenje_mljekomata`
  ADD CONSTRAINT `punjenje_mljekomata_ibfk_1` FOREIGN KEY (`id_mljekomata`) REFERENCES `mljekomati` (`id`);

--
-- Constraints for table `radnje_oranica`
--
ALTER TABLE `radnje_oranica`
  ADD CONSTRAINT `radnje_oranica_ibfk_1` FOREIGN KEY (`id_tip_radnje`) REFERENCES `tip_radnje_oranice` (`id`),
  ADD CONSTRAINT `radnje_oranica_ibfk_2` FOREIGN KEY (`id_oranice`) REFERENCES `oranice` (`id`);

--
-- Constraints for table `radnje_stroja`
--
ALTER TABLE `radnje_stroja`
  ADD CONSTRAINT `radnje_stroja_ibfk_1` FOREIGN KEY (`id_stroja`) REFERENCES `strojevi` (`id`),
  ADD CONSTRAINT `radnje_stroja_ibfk_2` FOREIGN KEY (`tip_radnje_stroja`) REFERENCES `tip_radnje_stroja` (`id`);

--
-- Constraints for table `sadnje`
--
ALTER TABLE `sadnje`
  ADD CONSTRAINT `sadnje_ibfk_1` FOREIGN KEY (`id_oranice`) REFERENCES `oranice` (`id`),
  ADD CONSTRAINT `sadnje_ibfk_2` FOREIGN KEY (`biljka`) REFERENCES `biljke` (`id`);

--
-- Constraints for table `servisi_mljekomata`
--
ALTER TABLE `servisi_mljekomata`
  ADD CONSTRAINT `servisi_mljekomata_ibfk_1` FOREIGN KEY (`id_mljekomata`) REFERENCES `mljekomati` (`id`);

--
-- Constraints for table `sirovine`
--
ALTER TABLE `sirovine`
  ADD CONSTRAINT `sirovine_ibfk_1` FOREIGN KEY (`id_zivotinje`) REFERENCES `zivotinje` (`id`);

--
-- Constraints for table `strojevi`
--
ALTER TABLE `strojevi`
  ADD CONSTRAINT `strojevi_ibfk_1` FOREIGN KEY (`id_parcele`) REFERENCES `parcele` (`id`);

--
-- Constraints for table `troskovi`
--
ALTER TABLE `troskovi`
  ADD CONSTRAINT `troskovi_ibfk_1` FOREIGN KEY (`id_parcele`) REFERENCES `parcele` (`id`);

--
-- Constraints for table `zivotinje`
--
ALTER TABLE `zivotinje`
  ADD CONSTRAINT `zivotinje_ibfk_1` FOREIGN KEY (`id_farme`) REFERENCES `farme` (`id`),
  ADD CONSTRAINT `zivotinje_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status_zivotinje` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

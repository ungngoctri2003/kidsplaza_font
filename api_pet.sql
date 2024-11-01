-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2024 at 01:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_pet`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_ThuCung` int(11) DEFAULT NULL,
  `soLuong` int(11) DEFAULT NULL,
  `tongTien` float DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `idPet` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `total_Product` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `idUser`, `idPet`, `quantity`, `status`, `createdAt`, `updatedAt`, `total_Product`) VALUES
(6, 5, 5, 1, 'Chưa thanh toán', '2024-11-01 15:58:26', '2024-11-01 15:58:26', 825000);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Sữa', '2024-10-31 13:32:13', '2024-10-31 13:32:13'),
(2, 'Bỉm', '2024-10-31 13:32:20', '2024-10-31 13:32:20'),
(3, 'Thời trang', '2024-10-31 13:32:30', '2024-10-31 13:32:30');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `thuCung` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`thuCung`)),
  `tongTien` float DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `thuCung`, `tongTien`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 3, '[{\"id\":1,\"idUser\":3,\"idPet\":1,\"quantity\":1,\"status\":\"Chưa thanh toán\",\"total_Product\":0,\"createdAt\":\"2024-10-31T06:41:38.000Z\",\"updatedAt\":\"2024-10-31T06:41:38.000Z\",\"Pet\":{\"id\":1,\"name\":\"GOLDEN VÀNG\",\"price\":0,\"describe\":\"Golden là một giống cỡ vừa, rất hiền lành và thông minh, có nguồn gốc từ nước Anh. Tìm hiểu nguồn gốc, cách chăm sóc và giá bán chó Golden.\",\"avatar\":\"https://res.cloudinary.com/dw9w3kc49/image/upload/v1730356754/user/bxixdu6twwpugeo7flhd.png\",\"species\":\"Thuần trủng\",\"avatar_detail\":null,\"id_category\":1,\"quantity\":12,\"top_quantity\":null,\"createdAt\":\"2024-10-31T06:33:15.000Z\",\"updatedAt\":\"2024-10-31T06:39:24.000Z\"}}]', 0, 'Chưa thanh toán', '2024-10-31 13:41:48', '2024-10-31 13:41:48'),
(2, 5, '[{\"id\":5,\"idUser\":5,\"idPet\":3,\"quantity\":1,\"status\":\"Chưa thanh toán\",\"total_Product\":455000,\"createdAt\":\"2024-11-01T08:56:06.000Z\",\"updatedAt\":\"2024-11-01T08:56:06.000Z\",\"Pet\":{\"id\":3,\"name\":\"Sữa Nan Optipro Plus số 4 5HMO 800g cho bé 2-6 tuổi\",\"price\":455000,\"describe\":\"Sữa Nan Optipro Plus số 4 800g - sản phẩm đầu tiên và duy nhất trong các dòng Nan Optipro có chứa phức hợp quý 5HMO Với kinh nghiệm 155 năm trong phát triển dưỡng nhi, Nestlé cho ra đời dòng sản phẩm sữa Nan Optipro Plus số 4 5HMO 800g giúp hỗ trợ tiêu hó\",\"avatar\":\"https://res.cloudinary.com/dw9w3kc49/image/upload/v1730449794/user/gwyjtgcwimahp7wuztrm.jpg\",\"species\":\"Sữa\",\"avatar_detail\":null,\"id_category\":1,\"quantity\":50,\"top_quantity\":null,\"createdAt\":\"2024-11-01T08:30:14.000Z\",\"updatedAt\":\"2024-11-01T08:30:41.000Z\"}}]', 455000, 'Đã thanh toán', '2024-11-01 15:57:46', '2024-11-01 15:57:46'),
(3, 5, '[{\"id\":5,\"idUser\":5,\"idPet\":3,\"quantity\":1,\"status\":\"Chưa thanh toán\",\"total_Product\":455000,\"createdAt\":\"2024-11-01T08:56:06.000Z\",\"updatedAt\":\"2024-11-01T08:56:06.000Z\",\"Pet\":{\"id\":3,\"name\":\"Sữa Nan Optipro Plus số 4 5HMO 800g cho bé 2-6 tuổi\",\"price\":455000,\"describe\":\"Sữa Nan Optipro Plus số 4 800g - sản phẩm đầu tiên và duy nhất trong các dòng Nan Optipro có chứa phức hợp quý 5HMO Với kinh nghiệm 155 năm trong phát triển dưỡng nhi, Nestlé cho ra đời dòng sản phẩm sữa Nan Optipro Plus số 4 5HMO 800g giúp hỗ trợ tiêu hó\",\"avatar\":\"https://res.cloudinary.com/dw9w3kc49/image/upload/v1730449794/user/gwyjtgcwimahp7wuztrm.jpg\",\"species\":\"Sữa\",\"avatar_detail\":null,\"id_category\":1,\"quantity\":50,\"top_quantity\":null,\"createdAt\":\"2024-11-01T08:30:14.000Z\",\"updatedAt\":\"2024-11-01T08:30:41.000Z\"}}]', 455000, 'Đã thanh toán', '2024-11-01 15:57:46', '2024-11-01 15:57:46'),
(4, 5, '[{\"id\":6,\"idUser\":5,\"idPet\":5,\"quantity\":1,\"status\":\"Chưa thanh toán\",\"total_Product\":825000,\"createdAt\":\"2024-11-01T08:58:26.000Z\",\"updatedAt\":\"2024-11-01T08:58:26.000Z\",\"Pet\":{\"id\":5,\"name\":\"Sữa bột S-26 Ultima 3 750g dành cho bé từ 2-6 tuổi\",\"price\":825000,\"describe\":\"Sữa bột S26 Ultima 3 750g là sản phẩm được nghiên cứu dành riêng cho trẻ từ 2-6 tuổi, với công thức độc đáo cùng các thành phần dinh dưỡng cân đối cung cấp các dưỡng chất quan trọng, hỗ trợ sự tăng trưởng và phát triển của trẻ.\",\"avatar\":\"https://res.cloudinary.com/dw9w3kc49/image/upload/v1730449888/user/uvr6yf98fbewa6qbf9o8.jpg\",\"species\":\"Sữa\",\"avatar_detail\":null,\"id_category\":1,\"quantity\":50,\"top_quantity\":null,\"createdAt\":\"2024-11-01T08:32:00.000Z\",\"updatedAt\":\"2024-11-01T08:45:45.000Z\"}}]', 825000, 'Đã thanh toán', '2024-11-01 15:59:05', '2024-11-01 15:59:05'),
(5, 5, '[{\"id\":6,\"idUser\":5,\"idPet\":5,\"quantity\":1,\"status\":\"Chưa thanh toán\",\"total_Product\":825000,\"createdAt\":\"2024-11-01T08:58:26.000Z\",\"updatedAt\":\"2024-11-01T08:58:26.000Z\",\"Pet\":{\"id\":5,\"name\":\"Sữa bột S-26 Ultima 3 750g dành cho bé từ 2-6 tuổi\",\"price\":825000,\"describe\":\"Sữa bột S26 Ultima 3 750g là sản phẩm được nghiên cứu dành riêng cho trẻ từ 2-6 tuổi, với công thức độc đáo cùng các thành phần dinh dưỡng cân đối cung cấp các dưỡng chất quan trọng, hỗ trợ sự tăng trưởng và phát triển của trẻ.\",\"avatar\":\"https://res.cloudinary.com/dw9w3kc49/image/upload/v1730449888/user/uvr6yf98fbewa6qbf9o8.jpg\",\"species\":\"Sữa\",\"avatar_detail\":null,\"id_category\":1,\"quantity\":50,\"top_quantity\":null,\"createdAt\":\"2024-11-01T08:32:00.000Z\",\"updatedAt\":\"2024-11-01T08:45:45.000Z\"}}]', 825000, 'Đã thanh toán', '2024-11-01 15:59:05', '2024-11-01 15:59:05'),
(6, 5, '[{\"id\":6,\"idUser\":5,\"idPet\":5,\"quantity\":1,\"status\":\"Chưa thanh toán\",\"total_Product\":825000,\"createdAt\":\"2024-11-01T08:58:26.000Z\",\"updatedAt\":\"2024-11-01T08:58:26.000Z\",\"Pet\":{\"id\":5,\"name\":\"Sữa bột S-26 Ultima 3 750g dành cho bé từ 2-6 tuổi\",\"price\":825000,\"describe\":\"Sữa bột S26 Ultima 3 750g là sản phẩm được nghiên cứu dành riêng cho trẻ từ 2-6 tuổi, với công thức độc đáo cùng các thành phần dinh dưỡng cân đối cung cấp các dưỡng chất quan trọng, hỗ trợ sự tăng trưởng và phát triển của trẻ.\",\"avatar\":\"https://res.cloudinary.com/dw9w3kc49/image/upload/v1730449888/user/uvr6yf98fbewa6qbf9o8.jpg\",\"species\":\"Sữa\",\"avatar_detail\":null,\"id_category\":1,\"quantity\":49,\"top_quantity\":1,\"createdAt\":\"2024-11-01T08:32:00.000Z\",\"updatedAt\":\"2024-11-01T08:59:05.000Z\"}}]', 825000, 'Đã thanh toán', '2024-11-01 17:29:32', '2024-11-01 17:29:32'),
(7, 5, '[{\"id\":6,\"idUser\":5,\"idPet\":5,\"quantity\":1,\"status\":\"Chưa thanh toán\",\"total_Product\":825000,\"createdAt\":\"2024-11-01T08:58:26.000Z\",\"updatedAt\":\"2024-11-01T08:58:26.000Z\",\"Pet\":{\"id\":5,\"name\":\"Sữa bột S-26 Ultima 3 750g dành cho bé từ 2-6 tuổi\",\"price\":825000,\"describe\":\"Sữa bột S26 Ultima 3 750g là sản phẩm được nghiên cứu dành riêng cho trẻ từ 2-6 tuổi, với công thức độc đáo cùng các thành phần dinh dưỡng cân đối cung cấp các dưỡng chất quan trọng, hỗ trợ sự tăng trưởng và phát triển của trẻ.\",\"avatar\":\"https://res.cloudinary.com/dw9w3kc49/image/upload/v1730449888/user/uvr6yf98fbewa6qbf9o8.jpg\",\"species\":\"Sữa\",\"avatar_detail\":null,\"id_category\":1,\"quantity\":49,\"top_quantity\":1,\"createdAt\":\"2024-11-01T08:32:00.000Z\",\"updatedAt\":\"2024-11-01T08:59:05.000Z\"}}]', 825000, 'Đã thanh toán', '2024-11-01 17:29:32', '2024-11-01 17:29:32');

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE `pays` (
  `id` int(11) NOT NULL,
  `idNhanVien` varchar(255) DEFAULT NULL,
  `idKhachHang` varchar(255) DEFAULT NULL,
  `totalPrice` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `species` varchar(255) DEFAULT NULL,
  `avatar_detail` text DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `top_quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id`, `name`, `price`, `describe`, `avatar`, `species`, `avatar_detail`, `id_category`, `quantity`, `top_quantity`, `createdAt`, `updatedAt`) VALUES
(3, 'Sữa Nan Optipro Plus số 4 5HMO 800g cho bé 2-6 tuổi', 455000, 'Sữa Nan Optipro Plus số 4 800g - sản phẩm đầu tiên và duy nhất trong các dòng Nan Optipro có chứa phức hợp quý 5HMO Với kinh nghiệm 155 năm trong phát triển dưỡng nhi, Nestlé cho ra đời dòng sản phẩm sữa Nan Optipro Plus số 4 5HMO 800g giúp hỗ trợ tiêu hó', 'https://res.cloudinary.com/dw9w3kc49/image/upload/v1730449794/user/gwyjtgcwimahp7wuztrm.jpg', 'Sữa', NULL, 1, 49, 1, '2024-11-01 15:30:14', '2024-11-01 15:57:46'),
(5, 'Sữa bột S-26 Ultima 3 750g dành cho bé từ 2-6 tuổi', 825000, 'Sữa bột S26 Ultima 3 750g là sản phẩm được nghiên cứu dành riêng cho trẻ từ 2-6 tuổi, với công thức độc đáo cùng các thành phần dinh dưỡng cân đối cung cấp các dưỡng chất quan trọng, hỗ trợ sự tăng trưởng và phát triển của trẻ.', 'https://res.cloudinary.com/dw9w3kc49/image/upload/v1730449888/user/uvr6yf98fbewa6qbf9o8.jpg', 'Sữa', NULL, 1, 48, 2, '2024-11-01 15:32:00', '2024-11-01 17:29:32'),
(6, 'Sữa Nan Optipro Plus số 4 5HMO 1.5kg cho bé 2-6 tuổi', 800000, 'Sữa Nan Optipro Plus số 4 - sản phẩm đầu tiên và duy nhất trong các dòng Nan Optipro có chứa phức hợp quý 5HMO Với kinh nghiệm 155 năm trong phát triển dưỡng nhi, Nestlé cho ra đời dòng sản phẩm sữa Nan số 4 Optipro Plus 5HMO giúp hỗ trợ tiêu hóa, tăng cư', 'https://res.cloudinary.com/dw9w3kc49/image/upload/v1730450083/user/pppi83ba1epk2eas6uxa.jpg', 'Sữa', NULL, 1, 50, NULL, '2024-11-01 15:34:45', '2024-11-01 15:46:04'),
(7, 'Bỉm - Tã dán Huggies Size S 80 miếng (Cho bé từ 4-8kg)', 300000, 'Bỉm - Tã dán Huggies size S 80 miếng giúp bé yêu thoải mái vận động Bỉm - Tã dán Huggies size S 80 miếng là dòng bỉm dán dành cho các bé sơ sinh với size S phù hợp cho với bé từ 4 - 8kg. Những đặc điểm ưu việt chỉ có ở dòng tã dán Huggies mới như: bọc kén', 'https://res.cloudinary.com/dw9w3kc49/image/upload/v1730450138/user/bsrcntxtusjvn3izyscg.jpg', 'Bỉm', NULL, 2, 50, NULL, '2024-11-01 15:36:22', '2024-11-01 15:46:34'),
(8, 'Bỉm - Tã dán Molfix size M 76+6 miếng (cho bé 6-11kg)', 249000, 'Tã dán Molfix size M 76+6 miếng (cho bé 6-11kg) Tã Molfix size M cho bé 6kg-11kg đến từ thương hiệu nổi tiếng Molfix chuyên cung cấp tã giấy bỉm cho bé. Sản phẩm đang là sự lựa chọn của khá nhiều ba mẹ với nhiều ưu điểm tiết kiệm, thoải mái an tâm khi sử ', 'https://res.cloudinary.com/dw9w3kc49/image/upload/v1730450260/user/lobcmalz6davmjt5nlp3.jpg', 'Bỉm', NULL, 2, 50, NULL, '2024-11-01 15:37:42', '2024-11-01 15:46:44'),
(9, 'Bỉm - Tã dán Goldgi+ size M 66 miếng cho bé (6-11kg)', 395000, 'Bỉm dán Goldgi+ size M 66 miếng siêu mỏng - thấm hút vượt trội Bỉm Goldgi+ size M cao cấp mang thiết kế đột phá với ưu điểm thấm hút vượt trội với bề mặt siêu mỏng chỉ với 1.5mm. Màng lót 3D 9 lỗ mềm mại, tản nhiệt nhanh, vừa vặn ôm sát cơ thể đem đến cho', 'https://res.cloudinary.com/dw9w3kc49/image/upload/v1730450330/user/x9iucjk4xjboszhr8z92.jpg', 'Bỉm', NULL, 2, 50, NULL, '2024-11-01 15:38:52', '2024-11-01 15:47:00'),
(10, 'Áo gió bé trai KidsPlaza in vũ trụ 24K-WJ04 (Xám)', 189000, 'Áo gió bé trai KidsPlaza in vũ trụ 24K-WJ04 (Xám) cho bé trai từ 1-4 tuổi Đối với thời tiết giao mùa thì một chiếc áo gió mỏng sẽ là lựa chọn lý tưởng cho bé, áo gió vừa giúp giữ ấm cơ thể mà bé vẫn có thể thoải mái vui chơi, vận động.', 'https://res.cloudinary.com/dw9w3kc49/image/upload/v1730450437/user/rjnwjpjfzxyxwwulbxoy.jpg', 'Thời trang', NULL, 3, 50, NULL, '2024-11-01 15:40:42', '2024-11-01 15:47:56'),
(11, 'Bộ quần áo dài tay bé trai KidsPlaza in Super Dino M24T (Xanh)', 159000, 'Bộ quần áo dài tay bé trai KidsPlaza in Super Dino M24T (Xanh) cho các bé từ 1-4 tuổi Bộ quần áo được thiết kế với kiểu dáng basic, dáng dài rộng rãi, thoải mái, giúp bé dễ dàng vận động, vui chơi, thích hợp cho bé mặc ở nhà, đi học.', 'https://res.cloudinary.com/dw9w3kc49/image/upload/v1730450558/user/squ8guigb4kqcibuepjj.jpg', 'Thời gian', NULL, 3, 50, NULL, '2024-11-01 15:43:25', '2024-11-01 15:47:14'),
(12, 'Bộ quần áo dài tay bé trai KidsPlaza in Puppy M24T (Xám nâu)', 159000, 'Bộ quần áo dài tay bé trai KidsPlaza in Puppy M24T (Xám nâu) cho các bé từ 1-4 tuổi Bộ quần áo được thiết kế với kiểu dáng basic, dáng rộng rãi, thoải mái, giúp bé dễ dàng vận động, vui chơi, thích hợp cho bé mặc ở nhà, đi học.', 'https://res.cloudinary.com/dw9w3kc49/image/upload/v1730450658/user/vqmlyumhlnuatjy62saj.jpg', 'Thời trang', NULL, 3, 50, NULL, '2024-11-01 15:44:21', '2024-11-01 15:45:39');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('create_bills.js'),
('create_carts.js'),
('create_news.js'),
('create_order.js'),
('create_pay.js'),
('create-category.js'),
('create-pet.js'),
('create-user.js');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gioiTinh` varchar(255) DEFAULT NULL,
  `namSinh` datetime DEFAULT NULL,
  `sdt` int(11) DEFAULT NULL,
  `diaChi` varchar(255) DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `role_id` varchar(255) DEFAULT 'R3',
  `resetToken` varchar(255) DEFAULT NULL,
  `resetTokenExpiry` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `gioiTinh`, `namSinh`, `sdt`, `diaChi`, `avatar`, `role_id`, `resetToken`, `resetTokenExpiry`, `createdAt`, `updatedAt`) VALUES
(5, 'user', 'user@gmail.com', '$2a$09$QybOptDsyXmVVDbIKCykcueffspGVOHg4xztYCBidzvYQfVxGqhMm', 'Nam', '2024-11-18 07:00:00', 12345689, 'ha nam', 'https://res.cloudinary.com/dw9w3kc49/image/upload/v1730448558/user/rntb5uuqtolwor7o4mse.jpg', 'R3', NULL, NULL, '2024-11-01 15:09:49', '2024-11-01 15:09:49'),
(7, 'admin', 'admin@gmail.com', '$2a$09$QybOptDsyXmVVDbIKCykcueffspGVOHg4xztYCBidzvYQfVxGqhMm', 'Nam', '2024-11-12 07:00:00', 12345678, 'ha noi', 'https://res.cloudinary.com/dw9w3kc49/image/upload/v1696383687/user/user_defaut.png', 'R2', 'f0ec194c6a078f87a6cc15a592a36f04056677de', '1730539115116', '2024-11-01 15:11:51', '2024-11-01 15:18:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

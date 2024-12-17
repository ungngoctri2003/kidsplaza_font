import React, { useEffect, useState } from "react";
import { banner, brand } from "../data";
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import Banner_ca from "../componnents/Banner/Banner_ca";
import "../css/Home.css";
import { Card, Avatar, Image, Col, Row, message } from "antd";
import { Link, useNavigate } from "react-router-dom";
import { getTop10 } from "../componnents/Api";
import AddToCartButton from "../componnents/AddToCard";
import Show_Detail from "../componnents/Show_Detail";
import { formatPrice } from "../componnents/Common/formatPrice";
import { Button } from "@mui/material";
const Home = ({ category, dataUser }) => {
  const navigate = useNavigate();
  const settings = {
    dots: false,
    fade: true,
    infinite: true,
    arrows: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    speed: 2000,
    autoplaySpeed: 3000,
    cssEase: "linear",
  };
  const handleCheckRole = () => {
    if (dataUser?.role_id === "R2" || dataUser?.role_id === "R1") {
      message.warning("Tài khoản của bạn không phải tài khoản người dùng!");
      navigate("/admin");
    }
  };
  useEffect(() => {
    handleCheckRole();
  }, [dataUser]);
  const [proOut, setProOut] = useState([]);

  useEffect(() => {
    getTop10()
      .then((res) => res.pet?.rows)
      .then((res) => {
        setProOut(res);
        console.log(res);
      })
      .catch((error) => {
        console.error("Lỗi lấy dữ liệu sản phẩm:", error);
      });
  }, []);
  return (
    <div>
      <div className="silder__banner">
        <Slider {...settings}>
          {banner.map((banner, i) => {
            return (
              <div className="banner-img" key={i}>
                <img style={{ objectFit: "cover" }} src={banner.img} alt="" />
              </div>
            );
          })}
        </Slider>
      </div>
      <div className="container">
        <div className="banner_content">
          <p>Hệ thống laptop uy tín nhất Việt Nam</p>
          <div className="banenr_content_btn">
            <Link to="/shop-all">
              <Button variant="contained" size="medium">
                Start Shopping
              </Button>
            </Link>
          </div>
        </div>
      </div>
      <div className="container">
        <div className="banner_ca">
          <Banner_ca category={category} />
        </div>
      </div>
      <div className="container">
        <p className="top10thu">Top đồ dùng được yêu thích nhất</p>
        {proOut.length > 0 ? (
          <Row className="RowHome" style={{ justifyContent: "center" }}>
            {proOut.map((pet) => (
              <Col key={pet.id}>
                <Card
                  className="cardHome"
                  hoverable
                  style={{ width: 360, margin: 20 }}
                  cover={
                    <div style={{ overflow: "hidden", height: 250 }}>
                      <img
                        src={pet.avatar}
                        alt={pet.name}
                        style={{
                          width: "100%",
                          height: "100%",
                          objectFit: "cover", // Giữ tỷ lệ hình ảnh
                          objectPosition: "center", // Căn giữa hình ảnh
                        }}
                      />
                    </div>
                  }
                  actions={[
                    <AddToCartButton item={pet} />,
                    <Show_Detail item={pet} />,
                  ]}
                >
                  <Card.Meta
                    title={
                      <div
                        style={{
                          display: "flex",
                          flexDirection: "column",
                          justifyContent: "space-between",
                        }}
                      >
                        {pet.name}
                        <div style={{ fontSize: 16, fontWeight: "normal" }}>
                          {pet.price
                            ? `${formatPrice(pet.price)} Đ`
                            : "Update..."}
                        </div>
                      </div>
                    }
                    description={pet.describe}
                    avatar={<Avatar src={pet.avatar} />}
                  />
                </Card>
              </Col>
            ))}
          </Row>
        ) : (
          <div
            style={{
              display: "flex",
              justifyContent: "center",
              height: "100vh",
              margin: "auto",
            }}
          >
            <p>No products available</p>
          </div>
        )}
      </div>
      <div className="container">
        <div className="brand_container">
          <p>Best Brands at Lowest Prices</p>
          <div className="brand">
            {brand.map((brand) => {
              return (
                <div className="brand_logo" key={brand.id}>
                  <img src={brand.img} alt="" />
                </div>
              );
            })}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Home;

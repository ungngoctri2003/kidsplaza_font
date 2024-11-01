import React from "react";
import { Link } from "react-router-dom";
import { Button, Typography, Box, Grid } from "@mui/material";
import { banner_ca } from "../../data";
import { formatVietnameseToString } from "../Common/formatVietnameseToString";

const Banner_ca = ({ category }) => {
  return (
    <Grid container spacing={2} sx={{ marginTop: 4 }}>
      {banner_ca?.map((item, index) => (
        <Grid item xs={12} sm={6} md={4} key={index}>
          <Box
            position="relative"
            sx={{
              overflow: "hidden",
              borderRadius: 2,
              boxShadow: 3,
              "&:hover .overlay-text": {
                opacity: 1,
                transform: "translateY(0)",
              },
            }}
          >
            <Box
              component="img"
              src={item.img}
              alt={`Banner ${index}`}
              sx={{
                width: "100%",
                height: "100%",
                objectFit: "cover",
                transition: "transform 0.3s ease",
                "&:hover": {
                  transform: "scale(1.1)",
                },
              }}
            />
            <Box
              className="overlay-text"
              position="absolute"
              bottom={0}
              width="100%"
              bgcolor="rgba(0, 0, 0, 0.6)"
              color="white"
              p={2}
              sx={{
                textAlign: "center",
                opacity: 0,
                transition: "all 0.4s ease",
                transform: "translateY(20px)",
              }}
            >
              <Typography variant="h6" component="p" gutterBottom>
                {category[index]?.name || "Category"}
              </Typography>
              <Button
                variant="contained"
                color="secondary"
                component={Link}
                to={`/category/${formatVietnameseToString(
                  category[index]?.name || "404"
                )}/${category[index]?.id}`}
                sx={{ mt: 1 }}
              >
                Shop Now
              </Button>
            </Box>
          </Box>
        </Grid>
      ))}
    </Grid>
  );
};

export default Banner_ca;

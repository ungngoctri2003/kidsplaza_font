import React, { useEffect, useState } from "react";
import {
  changeStatusOrder,
  getAllOrder,
  cancelOrder,
} from "../../../componnents/Api/index";
import {
  Table,
  Tooltip,
  Input,
  ConfigProvider,
  Flex,
  Button,
  Modal,
  message,
} from "antd";
import { CheckOutlined, DeleteOutlined } from "@ant-design/icons";
import { formatPrice } from "./../../../componnents/Common/formatPrice";
import formatDate from "./../../../componnents/Common/formatDay";
const { confirm } = Modal;
export default function QLOrder() {
  const [dataOrder, setOrder] = useState([]);
  const [queryOrder, setQueryOrder] = useState("");

  // Tạo một bảng tính mới
  // const workbook = XLSX.utils.book_new();

  // // Tạo một sheet từ dữ liệu
  // const sheet = XLSX.utils.aoa_to_sheet(data);
  // XLSX.utils.book_append_sheet(workbook, sheet, 'Sheet1');
  const handleOrderCancel = (idOrder) => {
    cancelOrder(idOrder).then((res) => {
      if (res?.mess === "Đơn hàng đã được hủy") {
        message.success(res?.mess);
        onLoadDateOrder();
      } else {
        message.warning(res?.mess);
      }
    });
  };
  const handleOrderSuccess = (idOrder) => {
    changeStatusOrder(idOrder).then((res) => {
      if (res?.mess === "Thanh toán thành công") {
        message.success(res?.mess);
        onLoadDateOrder();
      } else {
        message.warning(res?.mess);
      }
    });
  };
  const showModalAccess = (idOrder) => {
    confirm({
      title: "Cảnh báo",
      icon: <CheckOutlined style={{ color: "#52D037" }} />,
      content: "Bạn muốn đổi trạng thái sang thành công",
      okText: "Đồng ý",
      okType: "primary",
      cancelText: "Hủy bỏ",
      onOk() {
        // handleDeleteCategory()
        handleOrderSuccess(idOrder);
      },
      onCancel() {},
    });
  };
  const showModalCancelOrder = (idOrder) => {
    confirm({
      title: "Cảnh báo",
      icon: <DeleteOutlined style={{ color: "red" }} />,
      content: "Bạn muốn đổi trạng thái sang hủy đơn hàng",
      okText: "Đồng ý",
      okType: "primary danger",
      cancelText: "Hủy bỏ",
      onOk() {
        // handleDeleteCategory()
        handleOrderCancel(idOrder);
      },
      onCancel() {},
    });
  };
  const columns = [
    {
      title: "Mã hóa đơn",
      dataIndex: "id",
      key: "id",
      render: (text) => <p>{text}</p>,
      width: "8%",
      align: "center",
    },
    {
      title: "Tên người dùng",
      dataIndex: "User",
      key: "User",
      render: (item) => <p style={{ textAlign: "center" }}>{item?.name}</p>,
      align: "center",
    },
    {
      title: "Nội dung đơn hàng",
      children: [
        {
          title: "Tên thú cưng",
          dataIndex: "thuCung",
          key: "thuCung_name",
          align: "center",
          width: "25%",
          render: (item) => {
            const parsedItems =
              typeof item === "string" ? JSON.parse(item) : item;
            return (
              <div>
                {parsedItems?.map((item1) => (
                  <div className="box_item1" key={item1?.idPet}>
                    <p
                      style={{
                        textAlign: "center",
                        margin: "10px 0",
                        width: "100%",
                      }}
                    >
                      {item1?.Pet?.name}
                    </p>
                  </div>
                ))}
              </div>
            );
          },
        },
        {
          title: "Số lượng",
          dataIndex: "thuCung",
          key: "thuCung_quantity",
          align: "center",
          width: "8%",
          render: (item) => {
            const parsedItems =
              typeof item === "string" ? JSON.parse(item) : item;
            return (
              <div>
                {parsedItems?.map((item1) => (
                  <div
                    className="box_item1"
                    key={item1?.idPet}
                    style={{ margin: "10px 0" }}
                  >
                    <p style={{ textAlign: "center" }}>{item1?.quantity}</p>
                  </div>
                ))}
              </div>
            );
          },
        },
        {
          title: "Giá",
          dataIndex: "thuCung",
          key: "thuCung_price",
          align: "center",
          width: "10%",
          render: (item) => {
            const parsedItems =
              typeof item === "string" ? JSON.parse(item) : item;
            return (
              <div>
                {parsedItems?.map((item1) => (
                  <div
                    className="box_item1"
                    key={item1?.idPet}
                    style={{ margin: "10px 0" }}
                  >
                    <p style={{ textAlign: "center" }}>
                      {formatPrice(item1?.Pet?.price)} $
                    </p>
                  </div>
                ))}
              </div>
            );
          },
        },
      ],
      align: "center",
    },
    {
      title: "Tổng tiền",
      dataIndex: "tongTien",
      key: "tongTien",
      align: "center",
      render: (text) => <p>{formatPrice(text)}$</p>,
      width: "5%",
    },
    {
      title: "Trạng thái",
      dataIndex: "status",
      key: "status",
      align: "center",
      render: (status) => (
        <div
          style={{
            backgroundColor:
              status === "Đơn hàng đã hủy"
                ? "red"
                : status === "Đã thanh toán"
                ? "#52D037"
                : "#FFD45C",
            borderRadius: "10px",
            padding: "5px 0",
          }}
        >
          <p style={{ color: "#fff", fontWeight: "600" }}>{status}</p>
        </div>
      ),
    },
    {
      title: "Ngày tạo",
      dataIndex: "createdAt",
      key: "createdAt",
      align: "center",
      render: (createdAt) => (
        <Tooltip title={formatDate(createdAt)}>{formatDate(createdAt)}</Tooltip>
      ),
    },
    {
      title: "Edit",
      dataIndex: "Edit",
      key: "Edit",
      align: "center",
      render: (_, record) => (
        <div style={{ display: "flex", gap: "10px", justifyContent: "center" }}>
          <Button
            type="primary"
            style={{ minWidth: "100px" }}
            onClick={() => showModalAccess(record?.id)}
          >
            Thành công
          </Button>
          <Button
            type="primary"
            danger
            style={{ minWidth: "100px" }}
            onClick={() => showModalCancelOrder(record?.id)}
          >
            Hủy
          </Button>
        </div>
      ),
    },
  ];

  const onLoadDateOrder = () => {
    getAllOrder().then((res) => {
      setOrder(res?.Orders?.rows);
    });
  };
  useEffect(() => {
    onLoadDateOrder();
  }, []);
  return (
    <div>
      <div className="containet_item">
        <Input
          placeholder="Nhập vào tên người dùng"
          onChange={(e) => setQueryOrder(e.target.value.toLocaleLowerCase())}
          style={{ width: "20%", marginBottom: "20px" }}
        />
        <ConfigProvider
          theme={{
            components: {
              Table: {
                headerBg: "#3F95FD",
                headerColor: "#fff",
                borderColor: "#ccc",
                borderRadius: 10,
              },
            },
          }}
        >
          <Table
            columns={columns}
            dataSource={dataOrder?.filter((item) =>
              item?.User?.name?.toLocaleLowerCase().includes(queryOrder)
            )}
            pagination={{ pageSize: 5 }}
            bordered={true}
          />
        </ConfigProvider>
      </div>
    </div>
  );
}

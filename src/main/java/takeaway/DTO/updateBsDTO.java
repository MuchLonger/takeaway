package takeaway.DTO;

/**
 * @description:
 * @Time: 2019/3/10 16:01
 */
public class updateBsDTO {
    private Integer shopId;
    private Integer goToUserNum;
    private String password;
    private Long shopTel;
    private String shopAddress;
    private String shopName;
    private String operatingStatus;
    private Double shopDiscount;
    private String localImg;

    @Override
    public String toString() {
        return "updateBsDTO{" +
                "shopId=" + shopId +
                ", goToUserNum=" + goToUserNum +
                ", password='" + password + '\'' +
                ", shopTel=" + shopTel +
                ", shopAddress='" + shopAddress + '\'' +
                ", shopName='" + shopName + '\'' +
                ", operatingStatus='" + operatingStatus + '\'' +
                ", shopDiscount=" + shopDiscount +
                ", localImg='" + localImg + '\'' +
                '}';
    }

    public String getLocalImg() {
        return localImg;
    }

    public void setLocalImg(String localImg) {
        this.localImg = localImg;
    }


    public String getOperatingStatus() {
        return operatingStatus;
    }

    public void setOperatingStatus(String operatingStatus) {
        this.operatingStatus = operatingStatus;
    }

    public Integer getGoToUserNum() {
        return goToUserNum;
    }

    public void setGoToUserNum(Integer goToUserNum) {
        this.goToUserNum = goToUserNum;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Long getShopTel() {
        return shopTel;
    }

    public void setShopTel(Long shopTel) {
        this.shopTel = shopTel;
    }

    public String getShopAddress() {
        return shopAddress;
    }

    public void setShopAddress(String shopAddress) {
        this.shopAddress = shopAddress;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }


    public Double getShopDiscount() {
        return shopDiscount;
    }

    public void setShopDiscount(Double shopDiscount) {
        this.shopDiscount = shopDiscount;
    }
}

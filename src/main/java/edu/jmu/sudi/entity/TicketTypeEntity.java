package edu.jmu.sudi.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 优惠券类型实体类
 * @author LiangJie
 */
public class TicketTypeEntity implements Serializable {

    private Long ticketTypeId;
    private String ticketName;
    private Integer requirement;
    private Integer cheap;
    private Integer ticketNum;
    private Integer receive;
    private Integer liveTime;
    private String lastModifyBy;
    private Date lastModifyTime;
    private Integer ticketTypeStatus;
    private Integer needScore;

    public Long getTicketTypeId() {
        return ticketTypeId;
    }

    public void setTicketTypeId(Long ticketTypeId) {
        this.ticketTypeId = ticketTypeId;
    }

    public String getTicketName() {
        return ticketName;
    }

    public void setTicketName(String ticketName) {
        this.ticketName = ticketName;
    }

    public Integer getRequirement() {
        return requirement;
    }

    public void setRequirement(Integer requirement) {
        this.requirement = requirement;
    }

    public Integer getCheap() {
        return cheap;
    }

    public void setCheap(Integer cheap) {
        this.cheap = cheap;
    }

    public Integer getTicketNum() {
        return ticketNum;
    }

    public void setTicketNum(Integer ticketNum) {
        this.ticketNum = ticketNum;
    }

    public Integer getReceive() {
        return receive;
    }

    public void setReceive(Integer receive) {
        this.receive = receive;
    }

    public Integer getLiveTime() {
        return liveTime;
    }

    public void setLiveTime(Integer liveTime) {
        this.liveTime = liveTime;
    }

    public String getLastModifyBy() {
        return lastModifyBy;
    }

    public void setLastModifyBy(String lastModifyBy) {
        this.lastModifyBy = lastModifyBy;
    }

    public Date getLastModifyTime() {
        return lastModifyTime;
    }

    public void setLastModifyTime(Date lastModifyTime) {
        this.lastModifyTime = lastModifyTime;
    }

    public Integer getTicketTypeStatus() {
        return ticketTypeStatus;
    }

    public void setTicketTypeStatus(Integer ticketTypeStatus) {
        this.ticketTypeStatus = ticketTypeStatus;
    }

    public Integer getNeedScore() {
        return needScore;
    }

    public void setNeedScore(Integer needScore) {
        this.needScore = needScore;
    }
}

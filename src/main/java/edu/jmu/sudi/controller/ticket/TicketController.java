package edu.jmu.sudi.controller.ticket;

import com.alibaba.fastjson.JSON;
import edu.jmu.sudi.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 优惠券商城控制器
 * @author LiangJie
 */
@RestController
@RequestMapping("/reception/ticket")
public class TicketController {

    @Autowired
    private TicketService ticketService;

    /**
     * 查询所有上架的优惠券类别
     * @return
     */
    @RequestMapping("/findAll")
    public String findAllTicketOnShelf(){
        Map<String, Object> map = ticketService.findAllTicketOnShelf();
        return JSON.toJSONString(map);
    }

    /**
     * 领取优惠券
     * @param ticketTypeId
     * @param session
     * @return
     */
    @RequestMapping("/receiveTicket")
    public String receiveTicket(Long ticketTypeId, HttpSession session){
        Map<String, Object> map = ticketService.receiveTicket(ticketTypeId, session);
        return JSON.toJSONString(map);
    }



}

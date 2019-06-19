package org.fkjava.shopping.page;


import org.fkjava.shopping.domain.Order;
import org.fkjava.shopping.domain.OrderItem;

import java.util.List;

public class OrderData {
    private Order order;
    private List<OrderItem> orderItems;

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
}

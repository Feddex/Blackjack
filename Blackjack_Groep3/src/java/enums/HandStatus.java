/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enums;

/**
 *
 * @author Anthony Lannoote
 */
public enum HandStatus {
    BUSTED("Busted"), BLACKJACK("Blackjack"), STAND("Stand");
    
    private String status;

    private HandStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return this.status;
    }
    
    
    
}

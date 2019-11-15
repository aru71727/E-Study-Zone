/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MyPackage;

import java.util.Random;

/**
 *
 * @author Aradhana
 */
public class CaptchaGenerator {
    public String CaptchaCode()
    {
    String capcode="";
    char ch;
    ch=(char)rand(65,90);
    capcode=capcode+ch;
    ch=(char)rand(65,90);
    capcode=capcode+ch;
    ch=(char)rand(48,57);
    capcode=capcode+ch;
    ch=(char)rand(48,57);
    capcode=capcode+ch;
    ch=(char)rand(97,122);
    capcode=capcode+ch;
    ch=(char)rand(97,122);
    capcode=capcode+ch;
    return capcode;
    }
    public int rand(int min,int max)
    {
    Random r=new Random();   
    int rn=r.nextInt((max-min)+1)+min;
    return rn;
    }
    
    
    
}

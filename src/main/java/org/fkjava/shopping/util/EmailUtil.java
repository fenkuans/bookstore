package org.fkjava.shopping.util;


import com.sun.mail.smtp.SMTPTransport;
import org.fkjava.shopping.domain.User;
import org.junit.Test;


import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

public class EmailUtil {

    public static void email(User user,String url) throws Exception {
        // 1.发送邮件一般使用JavaMail邮件技术
        // 2.web开发使用协议 ：http://
        // 3.发送邮件必须有邮件服务器，学习阶段一般是由第三方提供的免费邮件服务器（网易）
        // 如果是企业，一般会自己搭建专门的邮件服务器
        // 使用第三方邮件服务器，需要自己注册一个邮箱，并做相应的配置才可使用
        // 4.邮件开发也有专门的协议 POP3/SMTP(常用)/IMAP

        // =================================================
        // 1.配置邮件服务器以及授权(使用stmp服务器)

        Properties properties = new Properties();
        ClassLoader classLoader = EmailUtil.class.getClassLoader();
//        InputStream resourceAsStream = classLoader.getResourceAsStream("mail.properties");
        //解决properties文件读取中文乱码
        InputStreamReader resourceAsStream = new InputStreamReader(classLoader.getResourceAsStream("mail.properties"),"UTF-8");
        properties.load(resourceAsStream);
        Properties props = System.getProperties();

        // 1.1设置邮件服务器地址
        props.put("mail.smtp.host", "smtp.163.com");
        // 1.2 设置邮件的授权
        props.put("mail.smtp.auth", "true");

        // 2.创建一个发送邮件的会话
        Session session = Session.getInstance(props, null);
        // 设置邮件debug模式。可以查看发送邮件的详细信息，项目上线关闭
        session.setDebug(true);

        // 3.创建一个邮件对象（发送人，主题，邮件内容，附件，收件人）
        Message msg = new MimeMessage(session);
        // 3.1设置邮件的发送人
        msg.setFrom(new InternetAddress(properties.getProperty("addresser")));
        // 3.2设置邮件的收件人
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail(), false));
        // 3.3设置发送邮件 主题，邮件内容，附件
        //3.3.0设置邮件的主题
        msg.setSubject("FK商城注册验证");
        // 3.3.1设置邮件内容
        MimeBodyPart mbp1 = new MimeBodyPart();
        // mbp1.setText("二狗，出来搞事情");//不支持html
        mbp1.setContent("<span>点击链接激活FK商城账户完成注册：<a href="+url+">"+url+"</a></span>", "text/html;charset=utf-8");
//        MimeBodyPart mbp2 = new MimeBodyPart();
        // 3.3.2发送附件
//        File file = new File("C:/Users/YL/Desktop/ergou.png");
//        mbp2.attachFile(file);
        MimeMultipart mp = new MimeMultipart();
        mp.addBodyPart(mbp1);
//        mp.addBodyPart(mbp2);
        msg.setContent(mp);

        // 4.创建一个协议对象用于发送邮件
        SMTPTransport t = (SMTPTransport) session.getTransport("smtp");
        //4.1设置 发送人的账号授权码
        t.connect(properties.getProperty("connectName"), properties.getProperty("conncetPassword"));
        //4.2发送邮件，需要设置设置邮件对象和接收人
        t.sendMessage(msg, msg.getAllRecipients());
        //4.3关闭邮件协议对象
        t.close();

    }
}

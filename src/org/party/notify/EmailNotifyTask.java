package org.party.notify;

import org.party.domain.Commit;
import org.party.domain.User;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class EmailNotifyTask extends Thread {
    private static Properties prop = new Properties();
    static {
        prop.put("mail.smtp.host", "");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.user", "12281054@bjtu.edu.cn");
        prop.put("mail.smtp.from", "12281054@bjtu.edu.cn");
        prop.put("passwd", "wayward");
    }
    @Override
    public void run() {
        List<User> users = User.getAllUsers();
        for (User user : users) {
            Commit commit = Commit.findCommitByUserId(user.getId());
            String content = commit.getNotice();
            if (content.equals("无")) {
                continue;
            }
            try {
//                sendEmail(content, user.getStudentid() + "@bjtu.edu.cn");
                //TODO for debug
                sendEmail(content, "12281054@bjtu.edu.cn");
            } catch (Exception e) {
                //TODO
                //日志处理
                continue;
            }
        }
    }
    public void sendEmail(String content, String addr) throws Exception{
        Session session = Session.getDefaultInstance(prop);
        MimeMessage msg = new MimeMessage(session);
        msg.setSubject("党员管理系统通知");
        Multipart parts = new MimeMultipart();
        BodyPart body = new MimeBodyPart();
        body.setContent("<meta http-equiv=Content-Type content=text/html; charset=UTF-8>" + content, "text/html;charset=UTF-8");
        parts.addBodyPart(body);
        msg.setRecipients(Message.RecipientType.TO, addr);
        msg.setContent(parts);
        msg.saveChanges();
        Transport transport = session.getTransport("smtp");
        transport.connect(prop.getProperty("mail.smtp.host"), prop.getProperty("mail.smtp.user"), prop.getProperty("passwd"));
        transport.sendMessage(msg, msg.getRecipients(Message.RecipientType.TO));
        transport.close();
    }
}

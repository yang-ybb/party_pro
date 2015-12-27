package org.party.notify;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

public class DailyCheck{
    private DailyCheck(){};
    private static Map<Integer, Thread> all_task = new HashMap<Integer, Thread>();
    private static Integer counter = 0;
    private static Map<Integer, String> time_stamp = new HashMap<Integer, String>();
    private static final Format format = new SimpleDateFormat("yyyyMMdd");
    private static boolean pause_flag = false;
    private static final _Thread inner_thread = new _Thread();
    private static boolean running_flag = false;
    public static synchronized Integer appendTask(Thread task) {
        System.out.println("append " + counter.toString());
        all_task.put(counter, task);
        return counter++;
    }
    private static String getStamp() {
        return format.format(new java.util.Date());
    }
    public static synchronized boolean removeTask(Integer taskId) {
        return all_task.remove(taskId) != null;
    }
    private static class _Thread extends Thread{
        @Override
        public void run() {
            System.out.println("service started");
            String now_stamp = getStamp();
            while (true) {
                try {java.lang.Thread.sleep(300000);} catch(Exception e) {}
                if (pause_flag) {
                    continue;
                }
                System.out.println("begin check loop");
                for (Map.Entry<Integer, Thread> task : all_task.entrySet()) {
                    String pre_date = time_stamp.get(task.getKey());
                    //TODO for debug
                    if (pre_date == null || !pre_date.equals(now_stamp) || true){
                        time_stamp.put(task.getKey(), now_stamp);
                        task.getValue().start();
                    }
                }
            }
        }
    }
    private static void startService() {
        if (running_flag) {
            inner_thread.notify();
            return;
        }
        inner_thread.run();
    }
    public static void pauseService() {
        pause_flag = true;
    }
    public static void resumeService() {
        pause_flag = false;
    }
    public static void main(String[] args) {
        System.out.println("BEGIN");
        EmailNotifyTask task = new EmailNotifyTask();
        Integer id = DailyCheck.appendTask(task);
        DailyCheck.startService();
        while(true) {}
    }
}

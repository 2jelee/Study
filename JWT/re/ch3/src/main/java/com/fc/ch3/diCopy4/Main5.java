package com.fc.ch3.diCopy4;

import com.google.common.reflect.ClassPath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Component class Car{
//    @Autowired
    @Resource
    Engine engine;
    @Autowired
    Door door;

    @Override
    public String toString() {
        return "Car{" +
                "engine=" + engine +
                ", door=" + door +
                '}';
    }
}
@Component class SportsCar extends Car{ }
@Component class Truck extends Car{ }
@Component class Engine { }
@Component class Door { }

class AppContext{
    Map map; // 객체 저장소

    AppContext() {
        map = new HashMap();
        doComponntScan();
        doAutowired();
        doResource();
    }

    private void doResource() {
        // *** map에 저장된 객체의 iv 중에 @Resource 붙어 있으면 map에서 iv "이름" 맞는 객체를 찾아서 연결(객체의 주소를 iv 저장)
        try {
            for (Object bean: map.values()) {
                for (Field field : bean.getClass().getDeclaredFields()){
                    if(field.getAnnotation(Resource.class)!=null){ // "byName"
                        field.set(bean, getBean(field.getName())); // car.engine = obj;
                    }
                }
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    private void doAutowired() {
        // *** map에 저장된 객체의 iv 중에 @Autowired가 붙어 있으면 map에서 iv "타입"에 맞는 객체를 찾아서 연결(객체의 주소를 iv 저장)
        try {
            for (Object bean: map.values()) {
                for (Field field : bean.getClass().getDeclaredFields()){
                    if(field.getAnnotation(Autowired.class)!=null){ // byType
                        field.set(bean, getBean(field.getType())); // car.engine = obj;
                    }
                }
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    private void doComponntScan() {
        // 1. 패키지 내 클래스 목록 가져온다.
        // 2. 반복문으로 클래스를 하나씩 읽어와서 @Component가 붙어있는지 확인
        // 3. @Component가 붙어있으면 객체를 생성하여 map에 저장
        try {
            ClassLoader classLoader = AppContext.class.getClassLoader();
            ClassPath classPath = ClassPath.from(classLoader);

            Set<ClassPath.ClassInfo> set = classPath.getTopLevelClasses("com.fc.ch3.diCopy4");
            for (ClassPath.ClassInfo classInfo:set) {
                Class clazz = classInfo.load();
                Component component = (Component) clazz.getAnnotation(Component.class);
                if(component!=null){
                    String id = StringUtils.uncapitalize(classInfo.getSimpleName());
                    map.put(id, clazz.newInstance());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // [by Name]으로 검색
    Object getBean(String key){
        return map.get(key);
    }

    // [by Type]으로 검색
    Object getBean(Class clazz){
        for (Object obj: map.values() ) {
            if(clazz.isInstance(obj))
                return obj;
        }
        return null;
    }
}

public class Main5 {
    public static void main(String[] args) throws Exception {
        AppContext ac = new AppContext();
        Car car = (Car)ac.getBean("car"); // by Name으로 객체 검색
        Engine engine = (Engine)ac.getBean("engine"); // by Type으로 객체 검색
        Door door = (Door)ac.getBean(Door.class);

        // 수동으로 객체 연결 -> 주석처리 시 null : carCar{engine=null, door=null}
//        car.engine = engine;
//        car.door = door;

        System.out.println("car" + car);
        System.out.println("engine" + engine);
        System.out.println("door" + door);
    }
}

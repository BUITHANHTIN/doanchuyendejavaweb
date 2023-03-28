package com.laptrinhjavaweb.utils;

public class ObjectUtils {
    public static <T> T getObject(Object param, Class<T> tClass) {
        if (param != null) {
            if (tClass.getTypeName().equals("java.lang.Long")) {
                param = param != "" ? Long.parseLong(param.toString()) : null;
            } else if (tClass.getTypeName().equals("java.lang.Double")) {
                param = param != "" ? Double.parseDouble(param.toString()) : null;
            } else if (tClass.getTypeName().equals("java.lang.Integer")) {
                param = param != "" ? Integer.parseInt(param.toString()) : null;
            } else if (tClass.getTypeName().equals("java.lang.String")) {
                param = param != "" ? param.toString() : null;
            }
            return tClass.cast(param);
        }
        return null;

    }

}

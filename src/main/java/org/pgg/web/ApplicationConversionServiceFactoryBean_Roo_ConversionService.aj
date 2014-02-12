// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.pgg.web;

import org.pgg.domain.Foo;
import org.pgg.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Foo, String> ApplicationConversionServiceFactoryBean.getFooToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.pgg.domain.Foo, java.lang.String>() {
            public String convert(Foo foo) {
                return new StringBuilder().append(foo.getBar()).toString();
            }
        };
    }
    
    public Converter<Long, Foo> ApplicationConversionServiceFactoryBean.getIdToFooConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, org.pgg.domain.Foo>() {
            public org.pgg.domain.Foo convert(java.lang.Long id) {
                return Foo.findFoo(id);
            }
        };
    }
    
    public Converter<String, Foo> ApplicationConversionServiceFactoryBean.getStringToFooConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.pgg.domain.Foo>() {
            public org.pgg.domain.Foo convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Foo.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getFooToStringConverter());
        registry.addConverter(getIdToFooConverter());
        registry.addConverter(getStringToFooConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}

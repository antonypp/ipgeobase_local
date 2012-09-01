require 'ipgeobase_local/inline'

module IpgeobaseLocal
  module Ext
    inline do |builder|
      builder.prefix <<-INLINE
        #include <stdio.h>
        #include <unistd.h>
        #include <sys/time.h>
        #define OBJECT_SIZE 40
      INLINE

      builder.c <<-INLINE

        VALUE internal_lookup(char* ip_s){
          VALUE meta_data = rb_ary_new();
          char country[OBJECT_SIZE] = "Russia";
          char region[OBJECT_SIZE] = "Uln obl";
          char city[OBJECT_SIZE] = "Ulyanovsk";

          rb_ary_push(meta_data, rb_str_new2(country));
          rb_ary_push(meta_data, rb_str_new2(region));
          rb_ary_push(meta_data, rb_str_new2(city));
          return meta_data;
        }
      INLINE
    end
  end
end

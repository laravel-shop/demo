FROM centos
WORKDIR /www
ADD ./ssh/ /root/.ssh/
RUN chmod 400 /root/.ssh/id_rsa \
&& chmod 400 /root/.ssh/id_rsa.pub \
&& chmod 400 /root/.ssh/known_hosts
# ADD ./ssh/id_rsa.pub /root/.ssh/id_rsa.pub
# ADD ./ssh/known_hosts /root/.ssh/known_hosts
RUN  yum install git -y && git clone git@gitee.com:allet_liability/laravel-shop.git \
&& git clone git@gitee.com:allet_liability/laravel-shop-admin.git

FROM node:8-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \ 
    apk add --no-cache git  && apk add --no-cache libc6-compat 
WORKDIR /root/
COPY --from=0 /www/laravel-shop-admin ./laravel-shop-admin
RUN yarn config set registry 'https://registry.npm.taobao.org' && cd  /root/laravel-shop-admin \
&& yarn && yarn run build:prod

FROM phusion/baseimage:latest

FROM phusion/baseimage:latest
WORKDIR /www
COPY --from=0 /www/laravel-shop ./laravel-shop/
COPY --from=1 /root/laravel-shop-admin/dist ./laravel-shop-admin/
# # FROM centos
# # RUN useradd wk
# # # COPY ./.ssh /home/wk
# # # COPY ./env /home/wk
# # RUN yum update -y && yum install git -y 
# # USER wk
# # # RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
# # #     && . $NVM_DIR/nvm.sh \
# # #     && nvm install 8 \
# # #     && nvm use 8 \
# # #     && git clone git@gitee.com:allet_liability/laravel-shop.git  \
# # #     && git clone git@gitee.com:allet_liability/laravel-shop-admin.git
# CMD ["/bin/bash"]
# # WORKDIR /www/wwwdata
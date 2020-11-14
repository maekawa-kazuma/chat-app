#開発しているアプリのrubyのバージョンを指定(分からない方は、ターミナルにてruby -vで確認しましょう。)
FROM ruby:2.6.5

#パッケージのインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && mkdir /myapp

#作業ディレクトリの指定
WORKDIR /myapp

#アプリのgemfileやgemfile.lockを読み込んでbundle installで反映
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /chatapp/Gemfile.lock
RUN gem install bundler
RUN bundle install

#ホストのアプリケーションディレクトリ内をすべてコンテナmyappにコピー
COPY . /chatapp

#ポートの送信(localhost:3000でアクセスするための記述)
EXPOSE 3000

#実行するコマンドや引数を定義している。(後々docker runコマンドを実行する際に動く)
CMD ["rails", "server", "-b", "0.0.0.0"]

#Could not find tzinfo-1.2.7 in any of the sources tzinfo-1.2.7がバンドルインストールされていない！！ キャッシュでbundle installされない場合があるようなのでdocker-compose build --no-cacheでなおる場合あり。が治らず,,,,結論ローカル(デフォルトの開発環境でいじったgemfileをbundle installで更新していなかったため生じたエラーであった)
#Dockerコマンドが上手く動かなくなった時は、docker for macを再起動すると治ること多い。自分は、dockerコンテナを削除できなくなった際に、こちらの再起動手法で治りました！
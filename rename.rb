### 複数のファイルをリネーム、連番つけたい!
### 初めて(?)作る実用性のあるRubyプログラム
### 2017.03.10 Nanami
### ______________________________________________________________________________


# カレントディレクトリを変更 chdir メソッド

def chdir(dir)
  Dir.chdir("/home/e5428/"+dir) # ~/ 以降を入力
end

# ファイル名の変更,連番つけ rename メソッド

def rename(after,i=1,ext)                  # 引数 => 変更後の名前,連番(初期値1),拡張子
  dir = Dir.glob("*")                      # カレントディレクトリにある隠しファイル以外のすべてのファイル名を取得
  dir.sort!                                # カレントディレクトリ(Array)をソート(破壊的なメソッド)
   dir.each do |name|                      # ブロック付きメソッドは File.close を省略可
     num = format("%02d",i)                # 桁数の足りない分,０で穴埋め
     File.rename(name,(after + num + ext)) # 名前の変更 (before,after)
     i += 1                                # カウントアップ
   end
end


print("Dir => ") # 移動
dir = gets.chomp
 chdir(dir)

 p Dir.pwd         # パスを出力
  dir_before = Dir.glob("*")
 p dir_before.sort # ファイル名を昇順にソートして出力

print("New name      => ")
 after = gets.chomp
print("Serial number => ")
 i     = gets.chomp.to_i # 連番の初期値(数値として受け取る)
print("extension     => ")
 ext   = gets.chomp

rename(after,i,ext)

  dir_after = Dir.glob("*")
 p dir_after.sort # 変更後のファイル名を昇順にソートして出力
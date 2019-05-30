# CoreOS Vagrant

## Fork from

https://github.com/coreos/coreos-vagrant


## CoreOSをスタートアップ

1) 必要ソフトウェアをインストール

* [VirtualBox][virtualbox] 4.3.10 or greater.
* [Vagrant][vagrant] 1.6.3 or greater.

[virtualbox]: https://www.virtualbox.org/
[vagrant]: https://www.vagrantup.com/downloads.html

2) リポジトリをクローン

```shell
git clone https://github.com/coreos/coreos-vagrant/
cd coreos-vagrant
```

3) 共有フォルダを作成

```shell
mkdir ../share
```

4) スタートアップ、SSH

```shell
vagrant up
vagrant ssh
```

## VirtualMachine変更Tips

* メモリ割当てを増やす・減らす

Vagrantfile
```diff
-$vm_memory = 4096
+$vm_memory = 1024
```

* ポートマッピングを増やす・減らす

Vagrantfile
```diff
$forwarded_ports = {
  80   => 80,
  81   => 81,
  8025 => 8025,
  443  => 443,
  3306 => 3306,
-  3000  => 3000
+  3000  => 3000,
+  3001  => 3001
}
```

From: NagyZ <nagyz@piarista-kkt.sulinet.hu>
Message-ID: <Pine.LNX.4.44.0212231927280.31788-100000@server.piarista-kkt.sulinet.hu>
MIME-Version: 1.0
Subject: [linux-lvm] vgcreate bug?
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Dec 23 12:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

so..
i did:
(with 1.0.6 tools)

dd if=/dev/zero of=/testlvmimage bs=1024k count=300
losetup /dev/loop0 /testlvmimage
pvcreate /dev/loop
vgcreate test /dev/loop0
lvcreate -l 8 -n testlv test
mkfs.ext3 /dev/test/testlv

then copy some files..

vgchange -an
and (with lvm2 tools):
vgconvert -M2 test

then:
debian:~# mount /dev/test/testlv /teszt
mount: /dev/test/testlv is not a valid block device

so..
any idea? :)

check http://tom.tdc.hu/~nagyz/lvm

thnx!

NagyZ

Message-ID: <400CD3A6.9070201@kapp-coburg.de>
From: Roland Morgenroth <Roland.Morgenroth@kapp-coburg.de>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010105050809080008040201"
Subject: [linux-lvm] LVM and HP SecurePath
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
Date: Tue Jan 20 08:42:05 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.
--------------010105050809080008040201
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

hi,

i cannot use LVM, after activating HP SecurePath (failover and load balancing driver).
lvmdiskscan does not see the devices:

kappco1:~ # lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/cciss/c0d0p1 [          1 GB] Primary   [0x82]
lvmdiskscan -- /dev/cciss/c0d0p2 [      15.95 GB] Primary  LINUX native partition [0x83]
lvmdiskscan -- 1 disk
lvmdiskscan -- 0 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 2 partitions
lvmdiskscan -- 0 LVM physical volume partitions

but they exist:
kappco1:~ # fdisk -l /dev/sda /dev/sdb

Disk /dev/sda: 64 heads, 32 sectors, 262144 cylinders
Units = cylinders of 2048 * 512 bytes

    Device Boot    Start       End    Blocks   Id  System
/dev/sda1             1    262144 268435440    5  Extended
/dev/sda5             1    262144 268435424   8e  Linux LVM

Disk /dev/sdb: 64 heads, 32 sectors, 262144 cylinders
Units = cylinders of 2048 * 512 bytes

    Device Boot    Start       End    Blocks   Id  System
/dev/sdb1             1    262144 268435440    5  Extended
/dev/sdb5             1    262144 268435424   8e  Linux LVM

i can put a reiserFS on a single partition and use it:
kappco1:~ # df -l
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/cciss/c0d0p2     16723404   2833480  13889924  17% /
shmfs                  1034212         0   1034212   0% /dev/shm
/dev/sda5            268427228   2841496 265585732   2% /data


what is wrong?

my config:
HP Proliant DL380
2 QLOGIC 2340 FC HBA
HP EVA3000 2 TByte

UnitedLinux 1.0 SP2a
HP SecurePath 3.0b
LVM 1.05 / 1.0.8

--------------010105050809080008040201
Content-Type: text/x-vcard; charset=utf8;
 name="Roland.Morgenroth.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Roland.Morgenroth.vcf"

begin:vcard
fn:Morgenroth, Roland
n:Morgenroth;Roland
org:KAPP GmbH Werkzeugmaschinenfabrik;C-ITE
adr;quoted-printable:;;Callenberger Stra=C3=9Fe 52;Coburg;Bayern;96450;Deutschland
email;internet:Roland.Morgenroth@kapp-coburg.de
tel;work:+49 9561 866371
tel;fax:+49 9561 866271
tel;cell:+49 172 8393602
version:2.1
end:vcard


--------------010105050809080008040201--

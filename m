Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-ID: <Dt978977869982.28492@mail3>
From: jkcwong@mail.hongkong.com
Subject: [linux-lvm] root fs on lvm - kernel panic
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
Date: Mon Oct 21 23:49:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

hi guys,

i need help.  thanks.

i have installed trustix on my pc (2 disks) then changed from ext2 to reiserfs and booting ok.  this is the base system.  now i want to migrate to lvm.  the config is as below:
trustix 1.5 (kernel 2.4.19 with lvm and reiserfs compiled in)
/dev/hdb1, 100mb, /boot, reiserfs
/dev/hdb2, 4gb, /, reiserfs
/dev/hdb3, 256mb, swap

i have created the following on /dev/hda:
/dev/hda1, 100mb, /boot, reiserfs
/dev/hda2, 6gb, /dev/vg00
/dev/hda3, swap

under /dev/vg00 i have a lvol0 as the new root.

i have copied the files across from hdb to hda.  when i boot (from hdb) i can mount all the partitions (includings lvols).  when i try to boot from /dev/hda i will get a kernel panic error... i have created a ram disk using lvmcreate_initrd....

in my new lilo.conf, it has:
root=/dev/vg00/lvol0

what have i missed?

----------------------------------------------
\305w\252\357\250\317\245\316 hongkon.com \271q\244l\266l\245\363\250t\262\316 
Thank you for using hongkong.com Email system

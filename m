Message-Id: <200306260753.h5Q7rm4J014403@ruby.ridersoft.net>
From: lvm@ruby.ridersoft.net
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bound1056614028"
Subject: [linux-lvm] vgscan and initrd
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
Date: Thu Jun 26 09:30:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

--bound1056614028
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi, I come seeking sage advice :)

Anyways, I've been busy installing a new Linux system using Gentoo. I am running this on a spare box, Duron 800 w 300mb, with the harddisk connected to the Promise ATA 100 onboard controller as /dev/hde8.

Al goes well, and I create the following partitions

/dev/hde6      swap
/dev/hde7      ext3 fs     /boot
/dev/hde8      lvm

I also create the pv on /dev/hde8 and a logical volume at /dev/lv/ide

/dev/lv/ide is my /

From my running livecd I then chroot'ed into /dev/lv/ide, and then the troubles began. When I run vgscan when chroot'ed it doesn't find any volume groups. When I run vgchange, i claims that the VDGA record doesn't match the kernel, and urges me to run vgscan, running vgscan doesn't solve this problem since it doesn't find the volume groups.

ls -l /dev/lv/ide shows me that my volume group indeed doesn't excist. However, the mount command shows me that /dev/lv/ide is mounted at root. So in summary, I can't find the volumegroup, even tough I am working on/in it.

I decided to go ahead anyways, and created a initrd using lvmcreate_initrd (based on the kernel i made, 2.4.21 ) it does this, and when I boot it loads this initrd as it is supposed to. It neatly finds my /dev/hda and /dev/hdb cdroms, and once insmod'ed it also find /dev/hde, but the it runs vgscan and finds no volumegroups, that causes vgchange to not find anything either. That causes the kernel to panic, since it cannot find root.

Weird thing is, if I boot with any other rescue/livecd, such as SuSE rescue, knoppix or gentoo live cd, I can vgscan and vgchange -ay to find my volume group and logical volume. But once chroot'ed or booting to my new system, I cannot and will not find it.

Does anyone have any suggestions on why vgscan doesn't find anything and how to solve this ?

Many thanx in advance, I have been strugling with this one for almost a week now, and I am out of options. I have been able to install lvm as root on quite a few systems before, including a LFS system, but right now, I am stumped.

best regards
Mark


When I boot from a livecd image, such as 

--bound1056614028--

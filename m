MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <E18ZBW0-00068b-00@gw.pe1mhp.ampr.org>
From: "Jan H. van Gils" <janvg@vgnet.nl>
Subject: [linux-lvm] Unable to mount root fs after kernel upgrade
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
Date: Thu Jan 16 09:00:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

	Hi,

Thanks for reading this message.

I have the following problem.
I am running Debian with a 2.4.18-bf2.4 kernel and installed the LVM
packages change everythink to use LVM and it works fine.

Here is an aoutput from my df -k :
/dev/vg00/root          126931     50679     69699  43% /
/dev/hda1                15522      8125      6596  56% /boot
/dev/vg00/usr           507748    278396    203138  58% /usr
/dev/vg00/var          1032088    281092    698568  29% /var
/dev/vg00/tmp            63461        17     60168   1% /tmp
/dev/vg00/home          761623    297976    432190  41% /export/home
/dev/vg00/data         4128448   2784472   1134264  72% /export/data

Now I want to do the following:
Change the kernel version to 2.4.20-686 using the package manager from debian.

This is what I did:

apt-get install kernel-image-2.4.20-686

created a new initrd image using lvmcreate_initrd 2.4.20-686

vi /etc/lilo.conf
And added the new kernel image to lilo.conf

image=/boot/vmlinuz-2.4.20-686
        label=Linux-2.4.20
        read-only
        root=/dev/vg00/root
        initrd=/boot/initrd-lvm-2.4.20-686.gz
        append="ramdisk_size=8192"

I runned lilo and it installed fine.

Now when I reboot the system and try to boot the new kernel I get the following
message :
Kernel panic: VFS: Unable to mount root fs on 3a:00

Somebody have any idea on how to solve this problem ?

Greetz Jan
-- 
With regards Jan H. van Gils
Internet web-page http://www.VGNet.NL/
Internet e-mail address JanVG@VGNet.NL
RIPE Whois JHG5-RIPE, 6BONE Whois JHG1-6BONE

From: Thorsten Sauter <sar@viastore.de>
Subject: Re: [linux-lvm] Rescue cd for lvm 1.0.3 (fwd)
Message-Id: <Pine.A32.4.33.0202261321320.16246-100000@as1.viastore.de>
MIME-Version: 1.0
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
Date: Tue Feb 26 06:27:07 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


Hello all,

again a little question. i have currently the following configuration:

# fdisk -l /dev/hda
/dev/hda1	1	1115		8e Linux LVM

/dev/hda1 => rootvg

rootvg
   /dev/rootvg/root		/
   /dev/rootvg/usr		/usr
   /dev/rootvg/boot             /boot

Why this configuration is so bad? Is it better to leave the /boot on an
"normal" ext2 filesystem? But, what files need the kernel from /boot to
bootup the system correctly? I think the kernel will be stored in the
master boot record with lilo?
And all files from /boot are accessable, after the ramdisk was loaded.

Btw. linux boot up succesfull, on my other system, where the /boot is on
an logival volume.

Any hints?

Thx
Thorsten

---------- Forwarded message ----------
Date: Tue, 26 Feb 2002 11:08:16 -0000
From: William Blunn <bill@tao-group.com>
Reply-To: linux-lvm@sistina.com
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Rescue cd for lvm 1.0.3

> not really a lvm problem, but after moving my system to boot from an
> root-lvm, my lilo stops with the LI error. I think, rewriting the lilo
> could help, but how can I access my system datas?

"boot from an root-lvm" ... sounds dodgy to me.

You can have the *root* filesystem "/" on an LVM volume.

However the *boot* filesystem should be /boot, which should be a small
ext2 partition mounted directly on a partition.

Bill
-- 
William H. Blunn - bill+linuxlvm@tao-group.com
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

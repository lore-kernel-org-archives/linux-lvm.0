Message-ID: <3EBA9EAC.3070006@free.fr>
From: Emmanuel Varagnat <emmanuel.varagnat@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] hard drive crash info please
References: <1052416232.17357.32.camel@randy.randyperkins.com>
In-Reply-To: <1052416232.17357.32.camel@randy.randyperkins.com>
Content-Transfer-Encoding: 7bit
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
Date: Thu May  8 13:14:05 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Randy Perkins wrote:
> hello,
> 	I have a lvm setup of 5 PV (disks), 1 VG,  and 1 LV.  one of the drives
> just started clicking, and is not recognizable by the bios. Now when i
> boot up my volume group is not recognized.

I did have the same problem a long time ago. So I started to write a 
tool that would try to recover some the data from the remaining data 
available. I lost the first disk of set of 3 disk...
This is quite finished.
It uses the capability of LVM2 to deal with 'partial' VG.
It only works with ext2/ext3 filesystems and require another (temporary) 
disk where recovered data will be written.

The URL is at : http://coredump.free.fr/linux/e2retrieve.php

I also did a floppy disk with the essential (kernel 2.4.19 with LVM2 
patch, LVM2 tools, Busybox and e2retrieve).

-=( manu )=-

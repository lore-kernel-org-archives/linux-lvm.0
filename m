Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A481B89@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] vgcreate
Date: Mon, 2 Jul 2001 21:14:41 -0500 
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Can you run vgcreate -v volname /dev/hde11, and give more verbose output?
also, some disks, after setting the type, you may actually need to reboot so
the kernel recognizes it properly. It could also be that it's an logical
drive on an extended partition too. 

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Joe Morris [mailto:heartboy@nycap.rr.com]
> Sent: Monday, July 02, 2001 5:33 PM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] vgcreate
> 
> 
> Hey everyone, I'm new to this list adn have a question 
> regarding LVM.  I 
> wanted to experiment with LVM, so I went into fdisk and 
> changed /dev/hde11's 
> type to 8e.  I then ran
> pvcreate /dev/hde11
> 
> To make sure everything went okay, I ran pvscan:
> pvscan -- inactive PV 
> "/dev/ide/host2/bus0/target0/lun0/part11" is in no VG  
> [9.76 GB]
> 
> Things were looking up until I ran vgcreate:
> vgcreate experiment /dev/hde11
> vgcreate -- no valid physical volumes in command line  
> 
> I tried disabling devfs and got the same things.  I'm using 
> kernel 2.4.5 and 
> have LVM 0.9.1-beta7.  I made sure to patch the kernel and 
> replace all the 
> get_blocksize's with get_sect_size (or something like that, I 
> forget).  Can 
> anyone help me?  Thanks!
> Joe
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 

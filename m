Return-Path: <heartboy@nycap.rr.com>
From: Joe Morris <heartboy@nycap.rr.com>
Date: Mon, 2 Jul 2001 18:33:06 -0400
MIME-Version: 1.0
Message-Id: <01070218330601.01439@alb-66-66-254-86>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vgcreate
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
To: linux-lvm@sistina.com

Hey everyone, I'm new to this list adn have a question regarding LVM.  I 
wanted to experiment with LVM, so I went into fdisk and changed /dev/hde11's 
type to 8e.  I then ran
pvcreate /dev/hde11

To make sure everything went okay, I ran pvscan:
pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/part11" is in no VG  
[9.76 GB]

Things were looking up until I ran vgcreate:
vgcreate experiment /dev/hde11
vgcreate -- no valid physical volumes in command line  

I tried disabling devfs and got the same things.  I'm using kernel 2.4.5 and 
have LVM 0.9.1-beta7.  I made sure to patch the kernel and replace all the 
get_blocksize's with get_sect_size (or something like that, I forget).  Can 
anyone help me?  Thanks!
Joe

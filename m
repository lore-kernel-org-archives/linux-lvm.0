Message-Id: <25E4CA13D679FF48BC30769420220971467A2C@nd1-clusa.local.bunnings.com.au>
From: Colin Coe <CCoe@bunnings.com.au>
MIME-Version: 1.0
Subject: [linux-lvm] Implementation questions
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
Date: Mon Dec 17 22:00:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi all

I need to set up a bunch of Linux machines of approximately the following
specs:
- PII 400
- 2 x 20GB HDD
- 256 MB  RAM
- RedHat 7.2

What I want is to use software raid (mirroring) and LVM.  How do I do this
from scratch?  I have looked but can't find a howto on this.  I have
attempted to do this but have run into several problems:
- During RH7.2 install you can choose to install to /dev/md but not LVM
- Once you have installed the OS there is no (easy/intuitive) way to get the
LVM in place

As I have about 130 of these to do, I am toying with the idea of installing
a cut-down Linux system with XFS, LAM, md and ramdisk support and making a
bootable CD-ROM which I can then use to configure the system how I want it.


Thats the plan at the moment, has anyone got a better idea? 


TIA


Colin Coe
AIX/Linux Systems Administrator
Bunnings Building Supplies Pty Ltd



**************************************************************************
Bunnings Legal Disclaimer: 

1) 	This document is confidential and may contain legally privileged 
	information. If you are not the intended recipient you must not 
	read, copy, distribute or act in reliance on it.
	If you have received this document in error, please telephone
	us immediately on (08) 9365-1555. 

2)	All e-mails sent to and sent from Bunnings Building Supplies are
	scanned for content. Any material deemed to contain inappropriate
	subject matter will be reported to the e-mail administrator of
	all parties concerned.

**************************************************************************

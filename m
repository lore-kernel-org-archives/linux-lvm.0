Return-Path: <shahi_aman@yahoo.com>
Message-ID: <20010801152451.41897.qmail@web14403.mail.yahoo.com>
Date: Wed, 1 Aug 2001 08:24:51 -0700 (PDT)
From: Aman Shahi <shahi_aman@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] using LVM from two machines
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
To: linux-lvm@sistina.com

Hi,
I have LVM installed on two machines, both of which
are connected to the same storage(RAID BOX). Now I
need to do LVM operations from different machines at
different times. I will try to put a scenario and my
problem.

Lets say I have 2 disks( disk1, disk2). I have two
machines M1 and M2. Both machine see all the disks. If
I create a VG called VG1 on disk1 from M1, and do a
vgscan on M2, the VG VG1 can be seen from both the
machines. I then create VG called VG2 from M2 on
disk2.

So basically I created 2 VG's from two different
machines, but both is visible on both machines. 

Now if I delete a VG from a machine from one machine,
any LVM operations from the other machine fails with
the message "VGDA in kernel and LVMTAB are not
consistent". I manually removed /dev/VG1 and /etc/lvm*
from the other machine and did a vgscan , but still I
get the message "VGDA in kernel and lvmtab are
inconsistent, please run vgscan". Running vgscan does
not help.

How can I modify this VGDA in kernel in the other
machine so that any LVM operation on one machine can
be reflected in the other machine. Or can I do
something like  "deactivating" the data that is kept
in the kernel, so that the LVM just relies on the
information in the disks, or something like that. I
mean I need to be able to use LVM from two different
machine as if they were one.

regards,
Aman Shahi.

__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/

Return-Path: <iain@g7iii.junglelink.co.uk>
Date: Tue, 2 Jan 2001 14:28:37 +0000
From: Iain Young <iain@g7iii.junglelink.co.uk>
Message-ID: <20010102142837.A1294@g7iii.junglelink.co.uk>
Mime-Version: 1.0
Subject: [linux-lvm] pvcreate (appears to) work, but then pvdisplay and vgcreate fail
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

Hi Everyone,

I have rather a strange problem for you, and was hoping someone had
come across it before.

I have LVM 0.91, and am running a stock 2.4.0-prerelease on SPARC 
(although I have had the same symptons on previous 2.4 test kernels)

I managed to compile the user space tools, and the required kernel
components.

Anyway, on with it: I can do a pvcreate, both on a whole disk,
and a partition with no problem, However an attempt to do either
a pvdisplay, or vgcreate on that PV fails, with the following errors:

vgcreate -- ERROR "pv_read(): PV identifier invalid" reading physical volumes

pvdisplay -- ERROR "pv_read(): LVM structure version" no VALID physical volume "/dev/scsi/host0/bus0/target1/lun0/disc"

Now, I am running devfs, so is LVM OK with that ? Or is that where my problem
is ?

A Strange thing is that if I go back into fdisk after doing (a supposidly
successfull) pvcreate, it moans that the label is corrupt blah blah, so
pvcreate must be writing _something_ to the disk.

Has anyone had similar experiences to this ? I couldn't find anything
in the FAQs, apart from the old problem of forgetting to pvcreate before
vgcreate or vgextend :)


Thanks in Advance

Iain

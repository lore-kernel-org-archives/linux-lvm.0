Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0UFiT9m023730
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2012 10:44:29 -0500
Received: from inet07.hamilton.harte-lyne.ca (inet07.hamilton.harte-lyne.ca
	[216.185.71.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0UFiSD8029654
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2012 10:44:28 -0500
Received: from webmail.harte-lyne.ca (inet04.hamilton.harte-lyne.ca
	[216.185.71.24])
	by inet07.hamilton.harte-lyne.ca (8.13.1/8.13.1) with ESMTP id
	q0UFiLBZ014563
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2012 10:44:21 -0500
Message-ID: <c7cbb6bbd7b1bb221f1939dc180f29cd.squirrel@webmail.harte-lyne.ca>
Date: Mon, 30 Jan 2012 10:44:19 -0500
From: "James B. Byrne" <byrnejb@harte-lyne.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Cannot delete lv
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

CentOS-6.2

lvm2-2.02.87-6.el6

qemu-kvm-0.12.1.2-2.209.el6_2.1

I have encountered a problem deleting logical volumes
associated with kvm guests that have been removed.  These
guest virtual machines were deleted because somehow each
had become able to see some of the VirtIO disks assigned
as physical volumes to the others.

It was suggested to me that this may have been caused by
attempting to add a new VirtIO disk created through
virt-manager as a physical device before it was initially
partitioned.  Surprisingly, if this is indeed the case,
virt-manager does not initially partition VirtIO disks, as
it does IDE virtual disks.

However, whatever the proximate or root causes are, when
the damaged guests were removed via virt-manager, together
with their storage, the guest vms were removed but the
lvremove command failed to remove the assigned storage:

 /sbin/lvremove -f /dev/vg_vhost01/lv_vm_base
    Can't remove open logical volume "lv_vm_base"

This pattern of failure repeated because the device showed
that was opened by two processes.

[root@vhost01 ~]#  dmsetup info -c vg_vhost01-lv_vm_base
Name                  Maj Min Stat Open Targ Event  UUID
vg_vhost01-lv_vm_base 253   5 L--w    2    1      0
LVM-gXMt00E1RDjpSX3INLZ35Prtg66aX36BeAOlKIkmfSNQRNol3Hni920R4YVaZr52

However, these processes seem to be invisible to me:

[root@vhost01 ~]#
[root@vhost01 ~]# fuser /dev/vg_vhost01/lv_vm_base
[root@vhost01 ~]#
[root@vhost01 ~]# lsof /dev/vg_vhost01/lv_vm_base
[root@vhost01 ~]#
[root@vhost01 ~]# umount /dev/vg_vhost01/lv_vm_base
umount: /dev/vg_vhost01/lv_vm_base: not mounted
[root@vhost01 ~]#
[root@vhost01 ~]# /sbin/lvremove -f
/dev/vg_vhost01/lv_vm_base
  Can't remove open logical volume "lv_vm_base"
[root@vhost01 ~]#

It was suggested on the centos-virt mailing list that I
try using dmsetup to suspend this device:

[root@vhost01 ~]# dmsetup suspend vg_vhost01-lv_vm_base
[root@vhost01 ~]#
[root@vhost01 ~]# dmsetup info -c vg_vhost01-lv_vm_base
Name                  Maj Min Stat Open Targ Event  UUID
vg_vhost01-lv_vm_base 253   5 L-sw    2    1      0
LVM-gXMt00E1RDjpSX3INLZ35Prtg66aX36BeAOlKIkmfSNQRNol3Hni920R4YVaZr52
[root@vhost01 ~]#

Which apparently had no effect:

[root@vhost01 ~]#  dmsetup info -c vg_vhost01-lv_vm_base
Name                  Maj Min Stat Open Targ Event  UUID
vg_vhost01-lv_vm_base 253   5 L-sw    2    1      0
LVM-gXMt00E1RDjpSX3INLZ35Prtg66aX36BeAOlKIkmfSNQRNol3Hni920R4YVaZr52

However, now when I run lvremove, the command simply
becomes unresponsive and does not return, even when a ^C
interrupt is attempted.

[root@vhost01 ~]#  /sbin/lvremove -f
/dev/vg_vhost01/lv_vm_base

^C
^C


On another terminal, after some 15 minutes of waiting, I
see this:

[root@vhost01 ~]# ps -ef | grep remove
root      1460   307  0 10:07 pts/0    00:00:00
/sbin/lvremove -f /dev/vg_vhost01/lv_vm_base


How do I delete these logical volumes, for there are three
of them?

-- 
***          E-Mail is NOT a SECURE channel          ***
James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
Harte & Lyne Limited          http://www.harte-lyne.ca
9 Brockley Drive              vox: +1 905 561 1241
Hamilton, Ontario             fax: +1 905 561 0757
Canada  L8E 3C3

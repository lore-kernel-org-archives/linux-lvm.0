Return-Path: <bs@infologic.fr>
Message-ID: <3A560D35.917C2EAA@infologic.fr>
Date: Fri, 05 Jan 2001 19:06:45 +0100
From: Benoit SERRA <bs@infologic.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgextend problem
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

That's my setup :

3 2.2 Gb SCSI drives
1 (/dev/sda) is used for the system
the 2 others will be used for LVM testing

When I do :

pvcreate /dev/sd[bc]1
vgcreate datavg /dev/sd[bc]1

Ok that's fine it work
VG is usable, and I can create LVs on it

But if I do :

pvcreate /dev/sdb1
pvcreate /dev/sdc1
vgcreate datavg /dev/sdb1
vgextend datavg /dev/sdc1

I always get a segfault on the vgextend, with a kernel trap.
When I do a pvdisplay /dev/sdc1, the drive is marked as unusable.

I'm using LVM 0.9 with 2.2.16 kernel.

Regards .

Benoit

Return-Path: <raheesom@navpoint.com>
Message-Id: <200104252211.f3PMBK026102@west.navpoint.com>
Subject: Re: [linux-lvm] I need to convert my root file system to LVM
	(adding a 2nd disk as well).
From: Rupert Heesom <raheesom@navpoint.com>
In-Reply-To: <20010425083538.B806@tykepenguin.com>
References: <200104241645.f3OGjE001662@west.navpoint.com> 
	<20010425083538.B806@tykepenguin.com>
Date: 25 Apr 2001 13:03:29 -0400
Mime-Version: 1.0
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

On 25 Apr 2001 08:35:38 +0100, Patrick Caulfield wrote:
> On Tue, Apr 24, 2001 at 11:39:02AM -0400, Rupert Heesom wrote:
> If you're not very familiar with LVM I recommend you have a play with it on the
> new disk before attempting to convert the root filesystem though.

I'm playing around with LVM on my 2nd spare disk (/dev/sdb).

The partitions are that disk now are -
/dev/sdb1, /dev/sdb2

I've created Vol Grp "vg" (/dev/vg), and Log Vol "lvol1"
(/dev/vg/lvol1).

I'm now trying to take one of the partitions out of the LV.  I'm hoping
that I can run a command something like lvreduce /dev/sdb2 lvol1 (reduce
lvol1 by taking /dev/sdb2 out of the vol), but the only way I can see of
reducing lvol1 is by specifying the Mbs to reduce the LV by.   If I do
this (specify the size of /dev/sdb2), how do I know that the LV will
give it's space back to /dev/sdb2?
It could easily give space back to /dev/sdb1 as well.

The part in the HOWTO about removing an old disk should help, but it
doesn't.  It talks about vgextending to add the new disk into the VG,
then vgreducing to take the old disk out of the VG.
When I try to "vgreduce vg /dev/sdb2", I'm told that /dev/sdb2 is still
active.
How do I de-activate /dev/sdb2?

I think I'm getting the idea of all this slowly, but am still pretty
confused overall!!

As I see it, this is the general idea of the software layers handling
the disks -

LVM:   LV
LVM:   VG
Disk:   PV

LV:  Volume space within a VG which is used by users (usually 1 LV per
VG for nice big volumes).
VG:  Group of PVs.
PV:   partitions on disk (1 or more to a disk)

-- 

regs
rupert

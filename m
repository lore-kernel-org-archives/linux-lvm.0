Return-Path: <anders@schlund.de>
Date: Sun, 17 Jun 2001 14:11:27 +0200
From: Anders Henke <anders@schlund.de>
Message-ID: <20010617141127.E10287@schlund.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] multiple vg using the same name
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

I'm currently thinking about clustering our storage arrays into a san structure
and how to organize usually identical systems with lvm. I'd like to avoid 
giving each host a different name for its VG in order to have an identical
/etc/fstab on every machine (you don't want to alter a mount-option for a
single mountpoint on hundreds of machines by hand or by sed).

I've x machines with x local LVM installations. Each machine uses e.g. 
/dev/vg/spool as a LV. These local LVs have been installed the usual way
(pvcreate, vgcreate, lvcreate), so each VG has its own UUID and the LVM
should use the suitable UUIDs to gather the PVs to the suitable VG.

Our idea is to take these PVs via a FC-SAN into one structure, the individual
hosts can only see 'their' storage, but failover-nodes can see every PV in 
the SAN so they can completely take a failed node offline (kick the big, red
power button), remount its LV and perform a full take-over.

What happens if the physical volumes of one machine becomes additionaly
available to a second machine, so that the second machine has to see
e.g. 2, 4 or 8 logical volumes with originally the same name (/dev/vg/spool)? 

-lvm completely crashes 
-only one vg shows up
-the VGs or LVs are temporarily being renamed when doing 'vgscan -a'
-the VGs or LVs are permanently being renamed when doing 'vgscan -a'

What happens if one machine failes, doesn't perform a umount/'vgchange -a n'?
Does the failover-node have a chance to use this VG/LV?

I now that somehow I have to figure a way out which VG belongs to which machine,
but this may be solved via a map of each machines VG UUID, although just
offering a /dev/vg_${hostname}/spool and 'seeing' the VG might be also cool :-)


Anders
-- 
Schlund + Partner AG              Systemadministration and Security
Erbprinzenstrasse 4-12            v://49.721.91374.50
D-76133 Karlsruhe                 f://49.721.91374.212

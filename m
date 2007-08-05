Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l758SIGM025453
	for <linux-lvm@redhat.com>; Sun, 5 Aug 2007 04:28:18 -0400
Received: from mx00.upc.ro (ns00.upc.ro [85.186.249.30])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l758SBe9005751
	for <linux-lvm@redhat.com>; Sun, 5 Aug 2007 04:28:12 -0400
Message-ID: <46B58A15.6040401@upc.ro>
Date: Sun, 05 Aug 2007 11:28:05 +0300
From: Imre Gergely <imre.gergely@upc.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove with nbd
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


hi

i have a bit of a problem with pvmove. it may not be pvmove's fault,
we'll see.
i have two systems, sysA and sysB. on sysA i have a VG with 3 PVs (say
sda,sdb,sdc). i've exported these two block devices thru nbd, and i've
imported them on sysB as nbd0, nbd1, nbd2.

on sysB i can see the "exported" VG, i can mount the LVs, it's working
fine. now i add a 4th PV local on sysB, so in the VG i have it like this:

nbd0, nbd1, nbd2, sda (this one is the local PV).

now i want to move everythin from nbd* to this new local sda, and then
remove all the nbd*s from the VG. practically this would mean that i've
moved the VG from one machine to another through the network.

but the pvmove is not really working. it just hangs, and stays in D when
i look at it with 'ps'. and no disk activity whatsoever. i cant kill the
process, i cant do anything, sort of a reboot, after which i can do a
pvmove --abort, but nothing more, because whatever i want to do, the LVM
related stuff just hangs again (im guessing that's because pvmove wants
to resume the moving operation). one CPU always stays in 100% i/o wait
during this.

the LVs in the VG are NOT mounted and are unused during the move, noting
is mounted. so basically this would be a remote pvmove, from one system
to another through nbd export.

obviously i'm missing something, or this can't be done.

any other ideas on how i could do this without physically moving the
storage from sysA to sysB ?

[root@emailro nbd-2.8.8]# pvmove -v -n log /dev/nbd2 /dev/sdd
    Finding volume group "zerg"
    Archiving volume group "zerg" metadata (seqno 12).
    Creating logical volume pvmove0
    Moving 1920 extents of logical volume zerg/log
    Found volume group "zerg"
    Creating zerg-log
    Loading zerg-log table
    Resuming zerg-log (253:2)
    Updating volume group metadata
    Creating volume group backup "/etc/lvm/backup/zerg" (seqno 13).
    Found volume group "zerg"
    Found volume group "zerg"
    Suspending zerg-log (253:2)
    Found volume group "zerg"
    Creating zerg-pvmove0
    Loading zerg-pvmove0 table
    Resuming zerg-pvmove0 (253:3)

'ps output, filtered:

11650 pts/0    D<L+   0:00 pvmove -v -n log /dev/nbd2 /dev/sdd
11666 ?        S<     0:00 [kcopyd]

sysA is centos 4.4 with kernel 2.6.9-42.0.8.plus.c4smp, nbd 2.8.8 and
LVM version

[root@email ~]# lvm
lvm> version
  LVM version:     2.02.06 (2006-05-12)
  Library version: 1.02.07 (2006-05-11)
  Driver version:  4.5.0

and sysB is centos 5.0 with kernel 2.6.18-8.1.6.el5.centos.plus, nbd
2.8.8 and LVM version

[root@emailro ~]# lvm
lvm> version
  LVM version:     2.02.16-RHEL5 (2006-12-14)
  Library version: 1.02.13 (2006-11-28)
  Driver version:  4.11.0

the systems have fibrechannel connected SAN storages, but would guess
that's not so important. between the two systems there is at least a
200Mbps connection, with no network problems.

any help greatly appreciated.

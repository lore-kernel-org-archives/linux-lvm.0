Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0NAn3112726
	for <linux-lvm@redhat.com>; Mon, 23 Jan 2006 05:49:03 -0500
Received: from host226.mediatransfer.com (host226.mediatransfer.com
	[194.174.226.226])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0NAn2Nb021546
	for <linux-lvm@redhat.com>; Mon, 23 Jan 2006 05:49:03 -0500
Received: from localhost (localhost [127.0.0.1])
	by host226.mediatransfer.com (Postfix) with ESMTP id C6FBA1D0007
	for <linux-lvm@redhat.com>; Mon, 23 Jan 2006 11:48:56 +0100 (CET)
Received: from host226.mediatransfer.com ([127.0.0.1])
	by localhost (internmx [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29081-08 for <linux-lvm@redhat.com>;
	Mon, 23 Jan 2006 11:48:56 +0100 (CET)
Received: from [192.168.0.32] (host237.mediatransfer.com [194.174.226.237])
	by host226.mediatransfer.com (Postfix) with ESMTP id 4CE891D0005
	for <linux-lvm@redhat.com>; Mon, 23 Jan 2006 11:48:56 +0100 (CET)
Message-ID: <43D4B498.4000306@mediatransfer.com>
Date: Mon, 23 Jan 2006 11:48:56 +0100
From: Falk Hackenberger - MediaTransfer AG Netresearch & Consulting
	<f.hackenberger@mediatransfer.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2 with clusterlock  problems with snapshot
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

hello,

i plan to setup a fileserver with 2 nodes for ha and 1 san-device for
storege.

Bescause the san-device have noch snapshot option (budget), ihave to
snapshot with lvm2 for backup.

so my testsetup with onde node works fine, exept the snapshot.
if I try to snapshot I get

root@kain ~]# lvcreate -L1G -s  -n snap /dev/data/home
    Logging initialised at Mon Jan 23 11:37:41 2006

    Set umask to 0077
    Loaded external locking library liblvm2clusterlock.so
    Setting chunksize to 16 sectors.
    Finding volume group "data"
    Archiving volume group "data" metadata (seqno 112).
    Creating logical volume snap
    Creating volume group backup "/etc/lvm/backup/data" (seqno 113).
    Zeroing start of logical volume "snap"
  Error locking on node kain.mediatransfer.de: Internal lvm error, check
syslog
  Problem reactivating origin home
    Wiping internal VG cache

the logfile says:
device/dev-io.c:456   Closed /dev/sdb1
cluster_locking.c:412   Locking
0kqnkigkyVKpwYzD03xTbAFQdsuqKApjX09CQG8r0oa0gx7SDFu8KcNjZIYs5DZL at 0x1e
cluster_locking.c:360   Error locking on node kain.mediatransfer.de:
Internal lvm error, check syslog
lvcreate.c:776   Problem reactivating origin home
lvcreate.c:814   <backtrace>
cluster_locking.c:412   Locking V_data at 0x6
filters/filter-persistent.c:181   Dumping persistent device cache to
/etc/lvm/.cache
cache/lvmcache.c:574   Wiping internal VG cache


creates a new logical volume without problems works.

any hints?
I use CentOS release 4.2

thanks Falk

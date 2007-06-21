Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5LEt1LB021894
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 10:55:01 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5LEsxtJ007866
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 10:54:59 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l5LEssi9000953
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 10:54:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l5LEssZH017735
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 10:54:54 -0400
Date: Thu, 21 Jun 2007 10:54:54 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Message-ID: <Pine.LNX.4.44.0706211046300.17457-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Backup with snapshots
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I have been manually running this script to make backups of a live 
application system:
-----------lvbackup------------------
#!/bin/sh
if test "$#" -lt 2; then
  echo "Usage: $0 SRCLV DESTDIR"
  exit 2
fi
lvpath="$1"
media="$2"
shift 2
if test -e "${media}/BMS_BACKUP_V1"; then
        :
else
  echo "${media} is not formatted as a backup drive"
  exit 1
fi

lvname="${lvpath##*/}"
lvname="${lvname##*-}"
snapname="${lvname}_SNAP"
snappath="${lvpath}_SNAP"
tmpdir="/mnt/${snapname}"
destdir="${media}/${lvname}/current"

lvcreate -s -L 2G -n "$snapname" "$lvpath" || exit 1
mkdir -p "$tmpdir" "$destdir"
mount -r "$snappath" "$tmpdir"
mount -o remount,rw "${media}"
rsync -ravXHx "$@" "${tmpdir}/" "${destdir}"
umount "$tmpdir"
mount -r -o remount,ro "${media}"
lvremove "$snappath"
---------------------------------------------

My question concerns the last line.  I asks me if I really want
to remove the LV.

1) Is it intended usage to create and destroy snapshots every day like this?
2) Am I missing a step?  Am I supposed to deactivate the snapshot first?
3) If I deactivate it, can I leave it allocated, and will it resync with
   source LV when I reactivate it?
4) Or am I just supposed to use "-f" on the lvremove?  How do I ensure
   that no stray processes still have the LV open.  The umount will fail
   if stray processes are still in the filesystem, but will the lvremove -f
   still fail if something has the block device open?

I just feel nervous turning scripts that change LVs loose in cron, and
want to make it as safe as possible.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

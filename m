Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3PA0rO31760
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2005 06:00:53 -0400
Received: from twoflower.innovation.uni-bremen.de
	(twoflower.innovation.uni-bremen.de [134.102.108.175])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3PA0ppg020014
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2005 06:00:51 -0400
Received: from localhost (localhost [127.0.0.1])
	by twoflower.innovation.uni-bremen.de (Postfix) with ESMTP id
	19D1B2E4E9
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2005 12:01:04 +0200 (CEST)
Received: from twoflower.innovation.uni-bremen.de ([127.0.0.1])
	by localhost (twoflower [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 30416-15 for <linux-lvm@redhat.com>;
	Mon, 25 Apr 2005 12:00:55 +0200 (CEST)
Received: from fawkes (fawkes.innovation.uni-bremen.de [134.102.108.198])
	by twoflower.innovation.uni-bremen.de (Postfix) with ESMTP id
	D37812DCF9
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2005 12:00:55 +0200 (CEST)
From: "Mailhelp" <mailhelp@innovation.uni-bremen.de>
Date: Mon, 25 Apr 2005 12:00:42 +0200
Message-ID: <OFEDJAPNAKOPGMNGCONBMEJDEKAA.mailhelp@innovation.uni-bremen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshot creation fails (in some cases)
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

Dear list,
Since I couldn't find any clue to what is wrong with my system (or
lvcreate?) [searched list archives, Google, how-to] someone reading this
list might be able to help me or give me a hint.
The Problem: Creating snapshots will fail under certain circumstances: a)
the snapshot is > 512MB (fails in aprox. 99.9%), b) the snapshots is < 512MB
(fails in aprox. 0.1%). I can't figure out, why creating of >512MB snapshots
in rare cases does not fail.
# lvcreate -L516M -s -n mysnap /dev/system/lv_home
  LV system/mysnap in use: not removing
  Couldn't deactivate new snapshot.

/dev/sysem/ shows mysnap. But I can't mount it (mount: filesystem unknown).

# lvdisplay
  --- Logical volume ---
  LV Name                /dev/system/mysnap
  VG Name                system
  LV UUID                LUVE4M-wC4g-YqhI-2gw4-wgfq-P2G0-2k82Ih
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                516,00 MB
  Current LE             129
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:7

Executing lvcreate -vvv does not help. Syslog might be of help: if creation
fails, I only get one entry:
/etc/hotplug.d/block/50-hwscan.hotplug[16398]: new block device /block/dm-7

If creation does not fail, it will show up four entries:
/etc/hotplug.d/block/50-hwscan.hotplug[16540]: new block device /block/dm-7
/etc/hotplug.d/block/50-hwscan.hotplug[16582]: new block device /block/dm-8
/etc/hotplug.d/block/50-hwscan.hotplug[16621]: new block device /block/dm-7
/etc/hotplug.d/block/50-hwscan.hotplug[16611]: new block device /block/dm-9


My distribution: SuSE 9.3 on two S-ATA drives.
If I can give any further information, please let me know.

Thanks in advance.

	Jens Potthast

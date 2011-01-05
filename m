Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p057c7B0017561
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 02:38:07 -0500
Received: from web39308.mail.mud.yahoo.com (web39308.mail.mud.yahoo.com
	[66.94.238.175])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id p057buXf023174
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 02:37:56 -0500
Message-ID: <581831.19828.qm@web39308.mail.mud.yahoo.com>
Date: Tue, 4 Jan 2011 23:11:16 -0800 (PST)
From: Brian Neu <proclivity76@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] snapshot pools, lvm roadmap
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

  For many years, I've greatly desired a snapshotting solution which goes above 
and beyond the current lvm features.  I'd love to see the ability to instantiate 
a storage pool for creating snapshots, with either a first-in-first-out or even 
some other method for bumping snapshots when the pool fills up.  The 
inefficiency of the former style of lvm snapshots in both space and speed and 
the cumbersome nature of managing them has kept me looking for alternatives. 
 Btrfs isn't quite there yet and may not be through 2011 or beyond.  zfs-fuse 
can't seem to act as a volume manager and I'm having problems with crashes. 
 Frustrated, I'm turning back to lvm.

   So now I'm looking at the lvm wiki and I'm seeing "shared exception store". 
 Can someone fill me in on the current status of this effort as the wiki was 
last updated in May-2009 ?

Thanks!

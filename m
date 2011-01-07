Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p07JSmpQ007370
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2011 14:28:48 -0500
Received: from web39303.mail.mud.yahoo.com (web39303.mail.mud.yahoo.com
	[66.94.238.170])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id p07JSb7v012895
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2011 14:28:38 -0500
Message-ID: <963006.39922.qm@web39303.mail.mud.yahoo.com>
References: <581831.19828.qm@web39308.mail.mud.yahoo.com>
	<Pine.LNX.4.64.1101051343590.3928@bmsred.bmsi.com>
	<413157.10262.qm@web39310.mail.mud.yahoo.com>
	<4D25EAB4.6050606@cfl.rr.com>
	<Pine.LNX.4.64.1101061943130.14845@bmsred.bmsi.com>
Date: Fri, 7 Jan 2011 11:01:56 -0800 (PST)
From: Brian Neu <proclivity76@yahoo.com>
In-Reply-To: <Pine.LNX.4.64.1101061943130.14845@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] snapshot pools, lvm roadmap
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> I'm not sure what "Volume Shadow Copy"  actually does, but we use DRBD (Data
> Replicating Block Device) to remotely  mirror block devices - which could be
> marketed as "Volume Shadow Copy". 
 
MS's VSS is their implementation of snapshots at the fs level.  For instance, 
you can set the C drive to back up to a D drive, allocating 80GB for all C drive 
snapshots.  Snapshots are removed automatically on a First-In, First-Out basis 
as the storage ceiling is reached.  Because the storage is shared, they can also 
be deduplicated for speed and storage efficiency.  Again, this has been in place 
since 2003.

As I understand LVM now, each snapshot must have individual storage allocated. 
 When that ceiling is reached, the snapshot must still be manually removed. 
 Since snapshot storage can't be shared, copied blocks must be written to every 
active snapshot, causing both a space and speed inefficiency.

I'm familiar with DRBD and have implemented it on HA systems.  It's great, but 
has nothing to do with the shared snapshots storage I desire for Linux.

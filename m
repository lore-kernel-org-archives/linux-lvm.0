Received: from mx2.redhat.com (ext-mx01.rdu.redhat.com [10.11.45.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p08GH8Bx027978
	for <linux-lvm@redhat.com>; Sat, 8 Jan 2011 11:17:08 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.8/8.13.8) with ESMTP id p08GH7wZ008660
	for <linux-lvm@redhat.com>; Sat, 8 Jan 2011 11:17:07 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p08GH550023190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 8 Jan 2011 11:17:05 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p08GH5BL023035
	for <linux-lvm@redhat.com>; Sat, 8 Jan 2011 11:17:05 -0500
Date: Sat, 8 Jan 2011 11:17:05 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <963006.39922.qm@web39303.mail.mud.yahoo.com>
Message-ID: <Pine.LNX.4.64.1101081111220.22994@bmsred.bmsi.com>
References: <581831.19828.qm@web39308.mail.mud.yahoo.com>
	<Pine.LNX.4.64.1101051343590.3928@bmsred.bmsi.com>
	<413157.10262.qm@web39310.mail.mud.yahoo.com>
	<4D25EAB4.6050606@cfl.rr.com>
	<Pine.LNX.4.64.1101061943130.14845@bmsred.bmsi.com>
	<963006.39922.qm@web39303.mail.mud.yahoo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 7 Jan 2011, Brian Neu wrote:

> > I'm not sure what "Volume Shadow Copy"  actually does, but we use DRBD (Data
> > Replicating Block Device) to remotely  mirror block devices - which could be
> > marketed as "Volume Shadow Copy". 
>  
> MS's VSS is their implementation of snapshots at the fs level.  For instance,
> you can set the C drive to back up to a D drive, allocating 80GB for all C
> drive snapshots.  Snapshots are removed automatically on a First-In,
> First-Out basis as the storage ceiling is reached.  Because the storage is
> shared, they can also be deduplicated for speed and storage efficiency.

Then the open equivalents would be Btrfs and Zumastor on LVM.  I think ZFS
does what you want also (and is enterprise ready on Solaris).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

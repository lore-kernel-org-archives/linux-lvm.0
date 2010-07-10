Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6A11D5i008983
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 21:01:14 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6A113Ik007190
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 21:01:04 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o6A113KE007274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 21:01:03 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o6A1133I029578
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 21:01:03 -0400
Date: Fri, 9 Jul 2010 21:01:02 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <1278722281.8612.37@raydesk1.bettercgi.com>
Message-ID: <Pine.LNX.4.64.1007092051070.29512@bmsred.bmsi.com>
References: <AANLkTikfqJRdgmf2ib9pz23p2IAz-fogXaSzfCv0tgEB@mail.gmail.com>
	<1278722281.8612.37@raydesk1.bettercgi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] efficiently copying snapshot data.
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

On Fri, 9 Jul 2010, Ray Morris wrote:

> >How can I efficiently copy only the snapshot?
> 
> rsync.  Mount the snapshot, mount the copy of the source LV
> on the other machine, and rsync from the snapshot to the copy.
> You'll probably need to use "kpartx" to make the partitions
> with the LVs visible.

That doesn't do what he wants.  He wants to copy only the COW blocks.
He has physical servers with the same master LV for VMs on each,
and he wants to migrate a VM by copying only the blocks that have 
changed from the master LV.

The COW table is an LV, so it is probably doable with dmsetup: needs
to deactivate snapshot, turn COW table into a regular LV, and activate that.
Copy to a regular LV on the target system, and then do some dmsetup 
and metadata magic to turn the LV (which is a copy of a COW table) into a
snapshot of the master LV with the COW already populated.

I don't think such a utility exists.  Sounds like a good bounty project.

However, there are other projects designed to sync LVs remotely by
copying only changed blocks.  I believe that the ZumaStor extension
to LVM does what he wants.  ZumaStor will also make the multiple
snapshots of the master LV more efficient, especially when updating the master.
It keeps one shared COW for all snapshots.  Standard snapshots keep
a COW for each snapshot.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

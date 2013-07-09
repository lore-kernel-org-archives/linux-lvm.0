Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r69HxQJG013432
	for <linux-lvm@redhat.com>; Tue, 9 Jul 2013 13:59:26 -0400
Received: from nm2-vm9.access.bullet.mail.gq1.yahoo.com
	(nm2-vm9.access.bullet.mail.gq1.yahoo.com [216.39.63.240])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r69HxPko018696
	for <linux-lvm@redhat.com>; Tue, 9 Jul 2013 13:59:25 -0400
Message-ID: <1373392764.87229.YahooMailBasic@web181505.mail.ne1.yahoo.com>
Date: Tue, 9 Jul 2013 10:59:24 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <51DC0E38.7060903@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Very slow i/o after snapshotting
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

I don't know the internals of a VMware snapshot (aka journal disk) but what's the impact to writing to an LVM snapshot if the original is never written to again? Think of the original LV as a "golden master" and I create 10 snapshots of it and each DomU is presented with a snapshot device as it's /dev/hda. Does the indirection even work?

I would have thought that the metadata in the snapshot device would have a bitmap (corresponding to specified "page" size) wherein the bitmap completely covered the original device and whenever a write got sent to the base block device (and the original copied to the snap) the flag would get updated such that reads to the snapshot device computes the "page" address of the desired block, checks the flag and if set, reads from the master device, otherwise find it in the snapshot (b-tree search? or hash+linked-list?)

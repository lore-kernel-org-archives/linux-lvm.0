Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B47435D6A6
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 02:23:57 +0000 (UTC)
Received: from sonic317-21.consmr.mail.gq1.yahoo.com
	(sonic317-21.consmr.mail.gq1.yahoo.com [98.137.66.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 12549C057FA7
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 02:23:56 +0000 (UTC)
Date: Wed, 13 Sep 2017 02:23:54 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1771452279.913055.1505269434212@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1771452279.913055.1505269434212.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, matthew patton <pattonme@yahoo.com>

I don't recall seeing an actual, practical, real-world example of why this issue got broached again. So here goes.

Create a thin LV on KVM dom0, put XFS/EXT4 on it, lay down (sparse) files as KVM virtual disk files.
Create and launch VMs and configure to suit. For example a dedicated VM for each of web server, a Tomcat server, and database. Let's call it a 'Stack'.
You're done configuring it.

You take a snapshot as a "restore point".
Then you present to your developers (or customers) a "drive-by" clone (snapshot) of the LV in which changes are typically quite limited (but could go up to full capacity) worth of overwrites depending on how much they test/play with it. You could have 500 such copies resident. Thin LV clones are damn convenient and mostly "free" and attractive for that purpose.

At some point one of those snapshots gets launched as, or converted into a production instance. Or if you rather, a customer purchases it and now you must be able to guarantee that it can do a full overwrite of it's space and that any interaction with the underlying thin pool trumps all the other ankle-biters (demo, dev, qa, trial) that might also be resident. Lesser snapshots will necessarily be evicted (destroyed) until the volume reaches some pre-defined level of reserved space that is now solely used for quick point-in-time restore points of the remaining instances. These snaps are retained for some amount of time and likely spooled off to a backup location. If thinPool pressure gets too high the oldest restore points (snapshots) get destroyed.

In any given ThinPool there may be multiple Stacks or flavors/versions of same.

I believe the pseudo-script provided earlier this afternoon suffices to implement the above.

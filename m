Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8E7NVbK009032
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2011 03:23:31 -0400
Received: from serenity (serenity.lbt-schoeftner.at [78.47.33.233])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8E7NPDB020955
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2011 03:23:26 -0400
Received: from [10.63.0.6] (helo=ripley.lbt-schoeftner.rmu)
	by serenity with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.74)
	(envelope-from <rmu@unfoo.net>) id 1R3joa-0007Hu-FQ
	for linux-lvm@redhat.com; Wed, 14 Sep 2011 09:23:24 +0200
Received: from boltzmann.local ([10.63.2.214])
	by ripley.lbt-schoeftner.rmu with esmtp (Exim 4.71)
	(envelope-from <rmu@unfoo.net>) id 1R3jw1-0005Gb-55
	for linux-lvm@redhat.com; Wed, 14 Sep 2011 09:31:05 +0200
Message-ID: <4E70566A.1040501@unfoo.net>
Date: Wed, 14 Sep 2011 09:23:22 +0200
From: =?ISO-8859-1?Q?Robert_Sch=F6ftner?= <rmu@unfoo.net>
MIME-Version: 1.0
References: <4E6E6BDE.1040301@unfoo.net>
	<alpine.LRH.2.00.1109121706310.19095@bmsred.bmsi.com>
	<4E6E8476.6030609@unfoo.net>
In-Reply-To: <4E6E8476.6030609@unfoo.net>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] harddisk dies while pvmove is in progress
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Am 2011-09-13 00:15, schrieb Robert Sch=EF=BF=BDftner:
> my plan is to edit the latest archived meta-data, remove the
> pvmove-mirror, exchange the segment pointing to the missing device
> with the mirrored segment, and vcfgrestore it, if no better idea comes
> up. the saved metadata confirms that the segment belonging to LV
> "shares" was completely mirrored before the harddisk died, so all the
> needed data is there.
For the record: finally, I edited the last metadata-backup, put the
successfully mirrored segment on the raid into the LV (instead of the
pvmovesomething mirror), removed references to pvmove, the damaged PV
and the "homevideo" LV, vgcfgrestored the config, rebooted, and
everything works.

Robert

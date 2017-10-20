Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2544417AA7
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 00:12:21 +0000 (UTC)
Received: from sonic302-22.consmr.mail.gq1.yahoo.com
	(sonic302-22.consmr.mail.gq1.yahoo.com [98.137.68.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97ACF83F3F
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 00:12:20 +0000 (UTC)
Date: Fri, 20 Oct 2017 00:12:16 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <541215543.377417.1508458336923@mail.yahoo.com>
MIME-Version: 1.0
References: <541215543.377417.1508458336923.ref@mail.yahoo.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

> It is just a backup server,

Then caching is pointless. Furthermore any half-wit caching solution can detect streaming read/write and will deliberately bypass the cache. Furthermore DD has never been a useful benchmark for anything. And if you're not using 'odirect' it's even more pointless.

> Server has 2x SSD drives by 256Gb each

and for purposes of 'cache' should be individual VD and not waste capacity on RAID1. Your controller's battery-backed RAM is for write-back purposes if you want to play that game. Cache is disposable. You can yank the power cord out of the drive and the software will continue. Now if you were TIERing, that's a different topic and depends on the implementation whether or not you can lose a device. The good ones make sure the SSD can disappear and nothing bad happens.

> 10x 3Tb drives.  In addition  there are two
> MD1200 disk arrays attached with 12x 4Tb disks each.  All

Raid5 for this size footprint is NUTs. Raid6 is the bare minimum.

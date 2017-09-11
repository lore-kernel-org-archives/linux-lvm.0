Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7926E600C4
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 22:56:57 +0000 (UTC)
Received: from sonic310-22.consmr.mail.gq1.yahoo.com
	(sonic310-22.consmr.mail.gq1.yahoo.com [98.137.69.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3E062C9710
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 22:56:56 +0000 (UTC)
Date: Mon, 11 Sep 2017 22:56:53 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <832949972.1610294.1505170613541@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <832949972.1610294.1505170613541.ref@mail.yahoo.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> Let me de-tour by using ZFS as an example

with the obvious caveat that in ZFS the block layer and the file layers are VERY tightly coupled. LVM and the block layer see eye-to-eye but ext4 et. al. have absolutely (almost?) no clue what's going on beneath it and thus LVM is making (false) guarantees that the filesystem is relying upon to actually be true.

IMO Thin-Pool is like waving around a lit welding torch - it's incredibly useful to do certain tasks but you can easily burn yourself and the building down if you don't handle it properly.

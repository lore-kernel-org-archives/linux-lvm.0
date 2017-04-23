Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6368917CE6
	for <linux-lvm@redhat.com>; Sun, 23 Apr 2017 17:45:04 +0000 (UTC)
Received: from nm1-vm4.bullet.mail.gq1.yahoo.com
	(nm1-vm4.bullet.mail.gq1.yahoo.com [98.136.218.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B4FF61D0A
	for <linux-lvm@redhat.com>; Sun, 23 Apr 2017 17:45:02 +0000 (UTC)
Date: Sun, 23 Apr 2017 17:45:00 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <971194068.8176464.1492969500597@mail.yahoo.com>
MIME-Version: 1.0
References: <971194068.8176464.1492969500597.ref@mail.yahoo.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] new multipath device mistakenly replaced another PV
 in existing volume group
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
Content-Type: text/plain; charset="iso-8859-1"
To: David Teigland <teigland@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

> I made a fix to zero out read buffer on a read miss at backend.=C2=A0

how many more land mines like this exist? One *ALWAYS* zero buffers before =
use.

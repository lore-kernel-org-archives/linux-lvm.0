Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 392D278DDD
	for <linux-lvm@redhat.com>; Mon, 18 Dec 2017 18:53:09 +0000 (UTC)
Received: from sonic316-8.consmr.mail.gq1.yahoo.com
	(sonic316-8.consmr.mail.gq1.yahoo.com [98.137.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1377881E09
	for <linux-lvm@redhat.com>; Mon, 18 Dec 2017 18:53:08 +0000 (UTC)
Date: Mon, 18 Dec 2017 18:53:06 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <72381975.739900.1513623186634@mail.yahoo.com>
MIME-Version: 1.0
References: <72381975.739900.1513623186634.ref@mail.yahoo.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvm filter regex format
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> =C2=A0  https://github.com/jthornber/lvm2-ejt/blob/master/libdm/regex/par=
se_rx.h
=20
not to be ungrateful but why on earth would one NOT use the glibc standard =
regex library? Nobody cares about pointless optimization. Surprises like "w=
ell, we only implemented most of the spec" are what drives people nuts!

I agree this particular length-based match is rather odd but there are plen=
ty of useful examples I am sure that could benefit from {x,y} notation.

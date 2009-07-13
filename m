Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6DH5TJv023792
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 13:05:29 -0400
Received: from purple.vermeer.tv (62-167-19-84.nbiserv.com [84.19.167.62] (may
	be forged))
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6DH5ER5006909
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 13:05:15 -0400
Received: from [192.168.1.122] (ip226-64-212-87.adsl2.static.versatel.nl
	[87.212.64.226])
	by purple.vermeer.tv (Postfix) with ESMTPSA id 31610120127
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 19:04:59 +0200 (CEST)
Subject: Re: [linux-lvm] LVM mirroring or mdadm
From: Koen Vermeer <koen@vermeer.tv>
In-Reply-To: <200907131732.20178.imobachgs@banot.net>
References: <200907131732.20178.imobachgs@banot.net>
Date: Mon, 13 Jul 2009 19:06:04 +0200
Message-Id: <1247504764.4530.20.camel@blue.colorful.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 2009-07-13 at 17:32 +0100, Imobach Gonz=C3=A1lez Sosa wrote:
> I've got a pair of identical Seagate disks on a server and I'm considerin=
g=20
> using a software RAID (RAID1). I was thinking of setting up LVM on a mdad=
m=20
> RAID, but I've read that LVM has support itself for mirroring.
> So, what is the better approach? Using LVM mirroring capabilities or putt=
ing=20
> the LVM on a mdadm RAID 1?

I faced the same dilemma and chose RAID instead of LVM mirroring. The
reason is that LVM requires an extra log partition when doing mirroring.
(In fact, this is not strictly true, but otherwise it will rebuild the
mirror after each reboot.) The log partition doesn't have to be big, but
I didn't like the additional tinkering.

If there exists some easy way around the extra partition, I'd probably
switch to an LVM-only solution. But for now, it's LVM-over-RAID for me.

Koen

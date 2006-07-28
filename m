Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6SMjZWc025742
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 18:45:35 -0400
Received: from mail.informatik.uni-luebeck.de (cs3.informatik.uni-luebeck.de
	[141.83.143.73])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6SMjXMt001056
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 18:45:34 -0400
Received: from [85.233.18.124] (ip-124-18.travedsl.de [85.233.18.124])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.informatik.uni-luebeck.de (Postfix) with ESMTP id B8C6D20150
	for <linux-lvm@redhat.com>; Sat, 29 Jul 2006 00:45:22 +0200 (CEST)
Message-ID: <44CA9398.6010506@forouher.de>
Date: Sat, 29 Jul 2006 00:45:44 +0200
From: Dariush Forouher <dariush@forouher.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Strange pvmove problem
References: <44C9E4BD.9070204@forouher.de>
	<44CA0D67.5000008@conterra.de>	<44CA1479.8080909@forouher.de>
	<44CA269C.6040802@conterra.de>
In-Reply-To: <44CA269C.6040802@conterra.de>
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

I was able to workaround the problem by creating a new LV (which I
placed exactly on those PVs which I intended to keep) and then moving
all files to the the new LV by hand. This way I didn't have to use pvmove.

Anyway, thanks for your help!

ciao
Dariush

Dieter St=EF=BF=BDken wrote:
> Dariush Forouher wrote:
>> Uhm, this is the file created right before I started pvmove:
> ....
>=20
> seems the pvmove was not even started because of a problems
> with the underlaying device-mapper:
>=20
>>  device-mapper: reload ioctl failed: Invalid argument
>=20
> sorry, no idea :-(
>=20
> any  messages from syslog / dmesg?
> does it work while LV not active (i.E. boot from rescue CD)?
>=20
> Dieter.
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

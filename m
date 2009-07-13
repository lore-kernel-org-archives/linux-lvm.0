Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6DHFJnk029722
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 13:15:19 -0400
Received: from mail-bw0-f219.google.com (mail-bw0-f219.google.com
	[209.85.218.219])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6DHEvEt013625
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 13:14:58 -0400
Received: by bwz19 with SMTP id 19so603965bwz.3
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 10:14:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1247504764.4530.20.camel@blue.colorful.local>
References: <200907131732.20178.imobachgs@banot.net>
	<1247504764.4530.20.camel@blue.colorful.local>
From: Diego Jacobi <jacobidiego@gmail.com>
Date: Mon, 13 Jul 2009 19:14:37 +0200
Message-ID: <5de034af0907131014w1c424d83rc4d6034804b5e395@mail.gmail.com>
Subject: Re: [linux-lvm] LVM mirroring or mdadm
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

Hi.


For te mirrorlog you can partition your new disk with 2 lvm
partitions. One for logs.
A mirror log are normally 4 Mb for each mirror, at least in my current syst=
em.
I maked a 1Gb partition only for logs and it is way too much, but 1 Gb
in current disks is nothing.
You could make a 200 Mb partition and it will still being way too much.
And the rest of the disk for boot, swap and lvm.

Having mirroring in LVM is great, you will only use 1 tool for
everything and it is much more flexible, however, i dont know yet how
to do parallel readings in linux, and i cant find any information
about it.
Si if you want raid for improving read speed, i cant help you yet, but
if you want it to duplicate your data, then i would recommend lvm for
flexibility.

Cheers.
Diego



2009/7/13 Koen Vermeer <koen@vermeer.tv>:
> On Mon, 2009-07-13 at 17:32 +0100, Imobach Gonz=EF=BF=BDlez Sosa wrote:
>> I've got a pair of identical Seagate disks on a server and I'm consideri=
ng
>> using a software RAID (RAID1). I was thinking of setting up LVM on a mda=
dm
>> RAID, but I've read that LVM has support itself for mirroring.
>> So, what is the better approach? Using LVM mirroring capabilities or put=
ting
>> the LVM on a mdadm RAID 1?
>
> I faced the same dilemma and chose RAID instead of LVM mirroring. The
> reason is that LVM requires an extra log partition when doing mirroring.
> (In fact, this is not strictly true, but otherwise it will rebuild the
> mirror after each reboot.) The log partition doesn't have to be big, but
> I didn't like the additional tinkering.
>
> If there exists some easy way around the extra partition, I'd probably
> switch to an LVM-only solution. But for now, it's LVM-over-RAID for me.
>
> Koen
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4PLgKFg004870
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 17:42:20 -0400
Received: from amsfep19-int.chello.nl (amsfep17-int.chello.nl [213.46.243.15])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4PLgF0r008606
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 17:42:16 -0400
Received: from laguna.nwhq.nl ([213.46.145.128]) by amsfep19-int.chello.nl
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP
	id <20060525214209.QXTT24171.amsfep19-int.chello.nl@laguna.nwhq.nl>
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 23:42:09 +0200
Received: from [127.0.0.1] (velsatis.nwhq.nl [192.168.100.33])
	by laguna.nwhq.nl (8.13.6/8.13.4) with ESMTP id k4PLg9h0010149
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 23:42:09 +0200
Message-ID: <447624AB.5040409@neuroweave.nl>
Date: Thu, 25 May 2006 23:42:03 +0200
From: Joep Blom <jlblom@neuroweave.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] booting from an LV
References: <4472E235.6020707@neuroweave.nl>	<20060523105821.GA6491@percy.comedia.it>	<4472EE4E.9050208@neuroweave.nl>	<4473ED42.1060702@wanadoo.fr>	<4474B6E8.9010106@neuroweave.nl>	<4474D256.8080603@chaos.ao.net>	<4474D94B.7010504@neuroweave.nl>
	<44761EB9.2000901@conterra.de>
In-Reply-To: <44761EB9.2000901@conterra.de>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dieter St=EF=BF=BDken wrote:

> Joep Blom wrote:
>
>> Harik,
>> I couldn't agree more. IMHO it's a bloody shame we still have to work=20
>> with a misconcept of over 25 years to start any OS (I'm not familiar=20
>> with the Mac but I presume it's equally oldfashioned).
>> Joep
>
>
> be careful:
> precisely Apple is a step further than most Linux systems today:
> they already use EFI, the next generation BIOS, see:
> http://en.wikipedia.org/wiki/Extensible_Firmware_Interface
> EFI even defines an enhanced partitioning concept called GPT.
>
> But I still fail to see, why I have to create any partition on my
> disks if I have LVM instead. It should make partitions obsolete!
> On the other hand I don't see neither Lilo nor Grub will provide
> a solution without any DOS partition table, soon. As I refuse to turn
> back booting from floppy disks, I currently think about booting from
> a cheap USB Stick instead. It may hold my /boot system with an LVM
> aware kernel and may even carry a small rescure system.
> Dieter
>
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
Dieter,
I didn't know that of Apple. That's very interesting. I know there are=20
already for over a year talks about completely different kind of=20
bootstrap loader+ advanced programming tools such as EFI you mentioned=20
but until now no motherboards has appeared for Intel/AMD processors with=20
it.
Your solution of booting from an USB stick is what I intend to do with=20
my firewall: a stand-alone memory-only system (I'm a little paranoid=20
with respect to security) running LEAF (the Bering-uclib variant) but=20
it's an idea for workstations as well as USB sticks become very cheap.
Joep

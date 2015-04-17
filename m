Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3HFblnx013278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2015 11:37:47 -0400
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by mx1.redhat.com (Postfix) with ESMTPS id 99B7A66
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2015 15:37:45 +0000 (UTC)
Received: from [192.168.0.11] (unknown [82.66.78.161])
	(Authenticated sender: georges.giralt)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5478682289
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2015 17:35:37 +0200 (CEST)
Message-ID: <553128C6.10606@free.fr>
Date: Fri, 17 Apr 2015 17:37:42 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
References: <441219761.721822832.1429205868173.JavaMail.root@zimbra39-e7.priv.proxad.net>
	<5530C11B.8040401@redhat.com>
In-Reply-To: <5530C11B.8040401@redhat.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Booting through LVM. Possible ?
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Thank you Zdenek. You confirm what I thought.
As this is my machine, it is not for experimenting. ;-)
So I'll make an EXT4 formated /boot primary partition and use everything=20
else for LVM .....

Le 17/04/2015 10:15, Zdenek Kabelac a =EF=BF=BDcrit :
> Dne 16.4.2015 v 19:37 georges.giralt@free.fr napsal(a):
>> Hello !
>> I've got this new laptop which has a traditional disk and an M.2 NGFF=20
>> SSD disk. So for the first time I'll plan to use LVM on a laptop. (I=20
>> constantly use LVM at work on bare metal or virtual systems).
>> The disk of my laptop is 4K sector size, GPT partitioned with an EFI=20
>> partition for some utilities and Windows boot, and the SSD can be=20
>> partitioned.
>> As I plan to install a very recent Ubuntu LTS release I wonder is I=20
>> still need a plain partition for the /boot or if current Grub version=20
>> can handle /boot out of an lvm lv ?
>> I've seen a lot of negative answer so I ask "at the source" ;-)
>> Thank you in advance for your answer.
>
> I'd strongly recommend to use separate  /boot partition.
>
> Lvm2 does not support grub - although some distributions pretends so=20
> and in some cases, like plain linear volume, it somehow works...
>
> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--=20
If the only tool you have is a hammer, you tend to see every problem as a n=
ail.
                 Abraham Maslow
A British variant :
Any tool can serve as a hammer but a screwdriver makes the best chisel.

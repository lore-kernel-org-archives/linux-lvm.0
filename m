Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r64HM28W032369
	for <linux-lvm@redhat.com>; Thu, 4 Jul 2013 13:22:02 -0400
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r64HLv9i026488
	for <linux-lvm@redhat.com>; Thu, 4 Jul 2013 13:21:59 -0400
Received: from [192.168.0.2] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161]) (Authenticated sender: georges.giralt)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 208374C8038
	for <linux-lvm@redhat.com>; Thu,  4 Jul 2013 19:21:53 +0200 (CEST)
Message-ID: <51D5AF30.3040004@free.fr>
Date: Thu, 04 Jul 2013 19:21:52 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
References: <694672986.201875226.1372861755810.JavaMail.root@zimbra39-e7.priv.proxad.net>
	<1372877653.37850.YahooMailNeo@web181502.mail.ne1.yahoo.com>
	<51D5384B.3070503@redhat.com>
In-Reply-To: <51D5384B.3070503@redhat.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Resising underlying array
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

Hello !
Today was a terrible day at work. So I did not touch my array nor LVM.
But I thought about it.
As I will resize the first disk partition, I'll touch the beginning of=20
the PV (which is built on the mirror made of the second disk partitions).
So I wonder if LVM is "dumb" and won't notice that the first blocks are=20
not the old first blocks (provided that the underlying array is synced),=20
or if the LVM layer will loudly complain because the former blocks of=20
the beginning of the PV have moved (Am I right or wrong here ??) ???
I've to admit that I'm reluctant to touch this server, given the day I=20
had today...
So I beg, another time, for your advice.
Thanks for your help !
Le 04/07/2013 10:54, Bryn M. Reeves a =EF=BF=BDcrit :
> On 07/03/2013 07:54 PM, matthew patton wrote:
>>> 200 MB for /boot was sensible years ago but now is a joke.
>> since when? All you need is 2 kernels. Have Linux 3.x kernels gotten
>> out of hand? I only use RHEL/Centos5 and 6 and I've never even come
>> close to running out.
> It partly depends on the distro and features you use - e.g. Fedora has
> preupgrade which uses /boot as temporary storage. This requires
> considerably more space than was required in the past (if you are going
> to use the feature - otherwise, carry on regardless :).
>
> Regards,
> Bryn.
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

Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r63Jc4Rq005377
	for <linux-lvm@redhat.com>; Wed, 3 Jul 2013 15:38:04 -0400
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r63Jbxb2013223
	for <linux-lvm@redhat.com>; Wed, 3 Jul 2013 15:38:01 -0400
Received: from [192.168.0.2] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161]) (Authenticated sender: georges.giralt)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1FE554C8164
	for <linux-lvm@redhat.com>; Wed,  3 Jul 2013 21:37:53 +0200 (CEST)
Message-ID: <51D47D90.4010104@free.fr>
Date: Wed, 03 Jul 2013 21:37:52 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
References: <694672986.201875226.1372861755810.JavaMail.root@zimbra39-e7.priv.proxad.net>
	<1372877653.37850.YahooMailNeo@web181502.mail.ne1.yahoo.com>
In-Reply-To: <1372877653.37850.YahooMailNeo@web181502.mail.ne1.yahoo.com>
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


Le 03/07/2013 20:54, matthew patton a =EF=BF=BDcrit :
>
>> 200 MB for /boot was sensible years ago but now is a joke.
> since when? All you need is 2 kernels. Have Linux 3.x kernels gotten out =
of hand? I only use RHEL/Centos5 and 6 and I've never even come close to ru=
nning out.
>
>> reduce the PV size without harm. But I'm unable to decide on a workflow =
and
>> loosing data or downtime are not acceptable options...
> then don't bother.
>
>> So I'm begging your help on a suitable workflow to make this happen.
>
> A. tell the customer "too bad" buy newer/bigger hard drives already and b=
uild new layout on new disks and DD/RSYNC data to new layout
>
> Or if you like to play with fire:
> * reduce filesystem size
> * lvresize down to match
> * resize MD member device (eg. http://webapp5.rrz.uni-hamburg.de/SuSe-Dok=
umentation/manual/sles-manuals_en/manual/raidresize.html)
> * create partition out of newly available slack space (use kpartx and you=
 should avoid a reboot)
> * pvcreate on new partition, add to VG and grow LV into new space
> * resize filesystem
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
Hello Matthew,
Actually my volume group has a big lot of free PE. (the 320 Gb disk are=20
only used for the OS and a couple of administrative accounts for the=20
server, so even the /home is small.... )
So I think I could avoid the resizing of the file systems.... All data=20
is stored elsewhere.
This is why I thought I could do it online without too much risk. Of=20
course I will not do this on Friday ;-)

--=20
If the only tool you have is a hammer, you tend to see every problem as a n=
ail.
                 Abraham Maslow
A British variant :
Any tool can serve as a hammer but a screwdriver makes the best chisel.

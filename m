Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7B88Li2026711
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2011 04:08:21 -0400
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7B88FnP016280
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2011 04:08:20 -0400
Received: from [192.168.1.4] (unknown [82.66.78.161])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 818024C8038
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2011 10:08:11 +0200 (CEST)
Message-ID: <4E438DEA.50901@free.fr>
Date: Thu, 11 Aug 2011 10:08:10 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
References: <CAMN6oRmKSkiBqLwGjVyCFnoqGPbQYk=TTukFO_GdKO-M3FdcMw@mail.gmail.com>
In-Reply-To: <CAMN6oRmKSkiBqLwGjVyCFnoqGPbQYk=TTukFO_GdKO-M3FdcMw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Securing against data lost
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Le 10/08/2011 13:40, Sun_Blood a =EF=BF=BDcrit :
> Hi
>
> Hope someone have time to answer this because google is not giving me
> the answers I need.
>
> I have just started to use LVM(a few years later then everyone) and
> I'm wondering how I can protect my self from failure to the LVM setup.
> Before when I had for example 3 harddisk at 200gb each (/dev/sd[b-d])
> with one partition each and a disk failed I would maximum lose 200gb.
> Now with LVM the LV is 600gb I'm worried that I can loose all if one
> disk have a problem.
>
> So how can I protect myself from this?
> What happens if I accidental destroys the LVM information?
> What happens if the first disk fails do I lose everything on the two
> second disk too?
>
> Best regards
> Martin
Hello !

Having 3 disk make a RAID a good idea. This will prevent loosing one
disk and loosing all data.
Then making propoer backup prevent from accidental human error or
catastrophic failure.
IMHO you should use a RAID 5 on your disks (either hardware RAID or
software MD RAID) and then build your PV, VG, and LV on top of this
array. Of course, you SHOULD monitor this array to ensure it is running
fine .....
Disk are cheap now, so you should have done this already.
But as other have said, proper backup IS the way to survive....

--=20
If the only tool you have is a hammer, you tend to see every problem as a n=
ail.
                Abraham Maslow
A British variant :
Any tool can serve as a hammer but a screwdriver makes the best chisel.=20

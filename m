Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2PJ0XDJ018637
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 15:00:42 -0400
Received: from mail.bmsi.com (mail.bmsi.com [68.106.146.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2PJ0VPc020917
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 15:00:32 -0400
Received: from melissa.gathman.org (melissa.gathman.org
	[IPv6:2001:470:8:809::1003]) (authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id r2PJ0SGF031704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 15:00:28 -0400
Message-ID: <51509ECB.4050901@bmsi.com>
Date: Mon, 25 Mar 2013 15:00:27 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
In-Reply-To: <533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] vg disappeared after replacing disc in raid10
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
To: linux-lvm@redhat.com

Long ago, Nostradamus foresaw that on 03/25/2013 10:04 AM, Bj=EF=BF=BDrn
Nadrowski would write:
> After replacing a disc in my raid10 system (ubuntu 12.04), my volume grou=
p (that contained all my data and my system) was gone.
>
> Problem description is here:
>
> http://ubuntuforums.org/showthread.php?t=3D2128504
>
> I managed to retrieve the metadata of the volume group and the logical vo=
lumes underneath, but I did not succeed using
>
> vgcfgrestore=20
>
> successfully in order to regain access to my data.
>
> It seems I might have to try dmsetup, but I am afraid I might destroy my =
data if I use it. I have no experience with that program.
>
No immediate help, but I would have been more paranoid under knoppix,
and checked for the volume group (vgscan) *before* failing the bad disk,
and *before* adding the replacement.  Running pvs at those points would
be advisable also.

I just installed a customer system with raid10, so I am *very*
interested in what went wrong.  I have only used raid1 to this point,
and have been *very* impressed with the improved performance of 4 disks
with raid10 vs. 2 with raid1.=20

Here is a theory to toss out:  raid10 on 3 disks can tolerate only 1
disk failure.  Maybe there were 2?  Maybe replaced the wrong drive?=20

Does pvs show the raid10 drive as a PV?  There is no point trying to use
vgcfgrestore until you have some PVs to restore it to.
Where did you find the metadata?  From a backup?  From the beginning of
the raid10 drive?

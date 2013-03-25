Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2PKPIWH018187
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 16:25:18 -0400
Received: from mail-bk0-f54.google.com (mail-bk0-f54.google.com
	[209.85.214.54])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2PKPFeo019160
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 16:25:15 -0400
Received: by mail-bk0-f54.google.com with SMTP id q16so644062bkw.27
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 13:25:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: "=?iso-8859-1?Q?Bj=F6rn_Nadrowski?=" <bjrnfrdnnd@gmail.com>
In-Reply-To: <51509ECB.4050901@bmsi.com>
Date: Mon, 25 Mar 2013 21:25:11 +0100
Message-Id: <244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks for the answer.=20
I am sorry I will not be able to point you to the exact problem that caused=
 the disruption of the volume group.=20
I did not make any checks before I started disassembling and reassembling t=
he array.=20

I did recreate the physical volume and the volume group using pvcreate and =
vgcreate, please see the description of the problem=20
on ubuntuforums for further details.

I now have a volume group vol0, but still no logical volumes, and vgcfgrest=
ore still does not work.
If you have any hints as to what to do now, I would be most delighted.

=20
On Mar 25, 2013, at 20:00 , Stuart D Gathman <stuart@bmsi.com> wrote:

> Long ago, Nostradamus foresaw that on 03/25/2013 10:04 AM, Bj=EF=BF=BDrn
> Nadrowski would write:
>> After replacing a disc in my raid10 system (ubuntu 12.04), my volume gro=
up (that contained all my data and my system) was gone.
>>=20
>> Problem description is here:
>>=20
>> http://ubuntuforums.org/showthread.php?t=3D2128504
>>=20
>> I managed to retrieve the metadata of the volume group and the logical v=
olumes underneath, but I did not succeed using
>>=20
>> vgcfgrestore=20
>>=20
>> successfully in order to regain access to my data.
>>=20
>> It seems I might have to try dmsetup, but I am afraid I might destroy my=
 data if I use it. I have no experience with that program.
>>=20
> No immediate help, but I would have been more paranoid under knoppix,
> and checked for the volume group (vgscan) *before* failing the bad disk,
> and *before* adding the replacement.  Running pvs at those points would
> be advisable also.
>=20
> I just installed a customer system with raid10, so I am *very*
> interested in what went wrong.  I have only used raid1 to this point,
> and have been *very* impressed with the improved performance of 4 disks
> with raid10 vs. 2 with raid1.=20
>=20
> Here is a theory to toss out:  raid10 on 3 disks can tolerate only 1
> disk failure.  Maybe there were 2?  Maybe replaced the wrong drive?=20
>=20
> Does pvs show the raid10 drive as a PV?  There is no point trying to use
> vgcfgrestore until you have some PVs to restore it to.
> Where did you find the metadata?  From a backup?  From the beginning of
> the raid10 drive?
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

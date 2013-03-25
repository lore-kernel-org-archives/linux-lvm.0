Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2PKkuQV006485
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 16:46:56 -0400
Received: from mail-bk0-f42.google.com (mail-bk0-f42.google.com
	[209.85.214.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2PKksl7030949
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 16:46:55 -0400
Received: by mail-bk0-f42.google.com with SMTP id jc3so497026bkc.29
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 13:46:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: "=?iso-8859-1?Q?Bj=F6rn_Nadrowski?=" <bjrnfrdnnd@gmail.com>
In-Reply-To: <5150B555.4010207@bmsi.com>
Date: Mon, 25 Mar 2013 21:46:51 +0100
Message-Id: <0FEAF33E-7395-4820-9732-AFE70D3B5877@googlemail.com>
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
	<244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
	<5150B555.4010207@bmsi.com>
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

You are certainly right.=20
However, I have no clue what to do.=20
The pvcreate was a hint given on the lvm pages at redhat. It should only ha=
ve overwritten the UUID in the metadata, nothing else.=20
Recreation of the volume group seemed  a good idea as I only had one volume=
 group on the pv and therefore I did not see how this could have destroyed =
anything.
The (human-readable) data at the beginning of the device /dev/md127 is stil=
l there and does display the same information. Please see my posting
on ubuntuforums for more details.=20
Did you look that up? Do you have any idea what I can do?

I am anyways prepared to give up in the foreseeable future. This would be a=
 major blow to me, this computer contained a lot of
old programs and information - but as it goes, I never looked up most of it.
There are some programs on which I was working at the moment, loss of those=
 would be my major inconvenience at the moment.=20
But as my data recovery attempts seem to go nowhere, I will have to stop tr=
ying some day.




On Mar 25, 2013, at 21:36 , Stuart D Gathman <stuart@bmsi.com> wrote:

> Long ago, Nostradamus foresaw that on 03/25/2013 04:25 PM, Bj=EF=BF=BDrn
> Nadrowski would write:
>>=20
>> I did recreate the physical volume and the volume group using pvcreate a=
nd vgcreate, please see the description of the problem=20
>> on ubuntuforums for further details.
>>=20
> That was not a good idea.  You've now written over the major clue to
> what happened.   Examining the beginning of the PV for the metadata -
> perhaps offset or scrambled because of some inadvertent change to the
> raid10 parameters - should have been your major priority!
>=20
> Theory 2: the md driver on the knoppix CD is an earlier version that
> puts metadata at the end of the volume, instead of at the beginning.=20
> This would change the offsets of your metadata and extents.  It would
> not see the newer md raid metadata, and create a new drive.  I'm not
> sure if this theory is consistent with your history.
>=20
> I *strongly* advise not doing any more writing to this device until you
> know *exactly* what happened.
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

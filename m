Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q4JG0sN7032389
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 12:00:54 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4JG0rRa014727
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 12:00:53 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q4JG0q0k006421
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 12:00:52 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by bmsred.bmsi.com (8.14.4/8.14.4) with ESMTP id q4JFwmuE021762
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 11:58:48 -0400
Date: Sat, 19 May 2012 11:58:48 -0400 (EDT)
From: Stuart D Gathman <stuart@bmsi.com>
In-Reply-To: <CAGQjrKYrgcx+y8M6NnLGZK5Z+hNpH3Fp4E2EysnKGZuObaFuBA@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.1205191151180.21730@bmsred.bmsi.com>
References: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
	<20120517181350.2922a70b@bettercgi.com>
	<4FB623AC.9060900@redhat.com>
	<CAGQjrKYrgcx+y8M6NnLGZK5Z+hNpH3Fp4E2EysnKGZuObaFuBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463799287-156242858-1337443128=:21730"
Subject: Re: [linux-lvm] lvreduce nightmare
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
To: LVM general discussion and development <linux-lvm@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463799287-156242858-1337443128=:21730
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Long ago, Nostradamus foresaw that on May 18, tariq wali would write:

> Appreciate the response although I realized a messed up large volume =EF=
=BF=BDlvm
> requires time and which I didn't have in this case and resorted to backup
> and recreated volumes all over new .=EF=BF=BD

You get lots of bonus points for actually having that backup!  Too many
people posting here in panic have no such option...

> I realize I went wrong with resize2fs thinking that it would reduce my lvm
> by 100G but it actually reduced the total volume size to 100G , i-e an lvm
> of 1.7T
>=20
> resize2fs /dev/vg0/data 100G ( i thought it would reduce the by 100G but
> dropped the block device size to total of 100G )
>=20
> so to i guess to do this right i should have=EF=BF=BD
>=20
> resize2fs /dev/vg0/data=EF=BF=BD1.6T or (1600G)
>=20
> and then lvreduce -n data -L 100G /dev/vg0/data ( to reduce the lvm by 100
> )=EF=BF=BD

I'm pretty sure resize2fs would have complained about the impossible
task you set it, and exited with an error code before doing anything.
The *real* problem was then reducing the LV with the (unresized) fs.
The fsadm script used to check for and prevent this kind of error.

> I even tried the vgcfgrestore on the archived lvm metadata file but that
> just restored the metadata (back to original volume size however I still =
had
> a bad file system ) .

Even after reducing the LV, perfect recovery was still possible (before
allocating/extending any other LVs) by vgcfgrestore.  The point of
no return was nearly reached when you then ran e2fsck on the truncated fs.
You could still have escaped unscathed if you hadn't answered 'yes'
to its offer to "fix" the superblocks....
---1463799287-156242858-1337443128=:21730--

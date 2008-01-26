Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0Q9Oofo012935
	for <linux-lvm@redhat.com>; Sat, 26 Jan 2008 04:24:50 -0500
Received: from snefru.openlib.org (wuecon195.wustl.edu [128.252.177.195])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0Q9OHva010493
	for <linux-lvm@redhat.com>; Sat, 26 Jan 2008 04:24:17 -0500
Date: Sat, 26 Jan 2008 15:23:56 +0600
From: Thomas Krichel <krichel@openlib.org>
Message-ID: <20080126092356.GA7036@trabbi.openlib.org>
References: <47990DD2.1020001@math-info.univ-paris5.fr>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <47990DD2.1020001@math-info.univ-paris5.fr>
Subject: Re: [linux-lvm] naive questions
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



  Fran=EF=BF=BDois Patte writes

> I would like to change my linux install and I need to modify /home which
> is now like this:
>=20
> __________________________|__________
>          sdc1                 sdb2 =3D 4126 extends
>=20
> If I reduce /home by 4127 extends may I be sure that /home will now stay
> on sdc1 only?
>=20

  I am not an expert.

  Here is a set of instructions how to do it, step-by-step.
  I have used them in the past. The aim, I understand is
  to set up a logical volume for /home, that contains
  no other disk than sdc1. Let /dev/sdc1 be 100=20
  gibabytes large, for illustration

  1. check your volume. Say, it's called vg1-lv1, and
  say it's ext2 or ext3

e2fsck -f -y /dev/mapper/vg1-lv1

  2. resize the file system

resize2fs -pf /dev/mapper/vg1-lv1 100G
=20
  where 100 is the size of home, assumed here.
  That resizes the file system with ext, of course,
  if you use another file  system type there will be
  another command.

  3. reduce the logical volume

lvreduce -L 100G /dev/vg1/lv1

  4. Now look at=20

pvdisplay

  5. If sdb2 is 0% used, go to step 6, else run=20

pvmove /dev/sdb2

  6 you can now reduce the disk from the volume.

vgreduce vg1 /dev/sdb2


> Was it possible to be aware of this before discoring it after
> install?

  I guess this is an issue of the O/S you are using.


> What happens if sdb disk crashes? Shall I loose all my data in
> /home?


  Not necessarily. If you find that /dev/sdb2 is getting
  bad, you get read/write errors, or you perform a=20
  badblock check on it, say, you can recover by=20
  reducing as described about. I have done this=20
  several times with good results.

  The big problem occurs of the first disk /dev/sdc1
  is in a bad shape such that you can not get to=20
  the filesystem anymore. This is what happened
  to me. I still have not fixed my problem, compounded
  by the fact that this accident occured shortly
  after I erased my backup by mistake.=20

  Unless you are a real disk expert, and you know lvm
  very well, I would only use lvm for building
  large disks to hold backup, and only when you
  are sure you are having two backups.

  Bonne chance!


  Thomas Krichel                    http://openlib.org/home/krichel
                                RePEc:per:1965-06-05:thomas_krichel
  phone: +7 383 330 6813                       skype: thomaskrichel

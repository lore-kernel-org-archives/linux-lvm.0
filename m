Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0SMOkO06239
	for <linux-lvm@redhat.com>; Fri, 28 Jan 2005 17:24:46 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.197])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0SMOeoC005815
	for <linux-lvm@redhat.com>; Fri, 28 Jan 2005 17:24:40 -0500
Received: by rproxy.gmail.com with SMTP id a41so957137rng
	for <linux-lvm@redhat.com>; Fri, 28 Jan 2005 14:24:35 -0800 (PST)
Message-ID: <a58063aa05012814245adc40d0@mail.gmail.com>
Date: Fri, 28 Jan 2005 14:24:35 -0800
From: "M. Matt Colgin" <mcolgin@gmail.com>
Subject: Re: [linux-lvm] vgcfgrestore after broken disk.
In-Reply-To: <20050128221220.GA14972@angelica.rajraj.net>
Mime-Version: 1.0
References: <20050128221220.GA14972@angelica.rajraj.net>
Content-Transfer-Encoding: quoted-printable
Reply-To: "M. Matt Colgin" <mcolgin@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

I actually just ran into this same problem, well a few different times
now in a month with crappy Maxtor and Western Digital drives (going
Seagate and never looking back, 5 year warranty)...

- First, turn off the computer. Don't put anymore wear and tear on the driv=
es
- Next, get yourself another drive >=3D 60GB, for the purpose of copying
the data from the bad drive to the good.
- Next, add a line to your lvm.conf and tell it to ignore the drive
when it's connected. This will prevent LVM from hosing your computer
during a boot, trying to mount the drive. I modified the following
line in lvm.conf. In my case, the drive was /dev/hdg
<snip>
filter =3D [ "r|/dev/hdg|", "r|/dev/hdg1|", "a/.*/" ]
</snip>
- Now that yuor machine is up and the bad and new drives are
connected. Get a hold of dd_rescue and dd_rhelp.
http://www.garloff.de/kurt/linux/ddrescue/
http://www.kalysto.org/utilities/dd_rhelp/index.en.html
- Your going to use dd_rhelp to read all of the data from the drive
(block by block using DD) to either the new drive or as a file. If
it's a drive that's 60GB, go ahead and do it straight to the drive. If
not, I would suggest making a filesystem on the new drive and writing
the data off to a file.

dd_rhelp is pretty easy. Assuming your bad drive is on /dev/hda and
your good one is on /dev/hdc and one to a filesystem, here's an
example command-line:
<snip>
dd_rhelp /dev/hda /dev/hdc
dd_rhelp /dev/hda /media/mynewhd/somefile.dd
</snip>

Read the FAQ on dd_rhelp, it uses dd_rescue to read data from all over
the disk, using different read patterns (including backwards). This
will get a lot of the data off, but be prepared to loose some. I had
this happen on my LVM2 array with 8 drives for a total of 1.2TB. Only
20% of the drive was readable, luckily I started a pvmove, but stupid,
as if I would have done this first, I would have gotten most of the
data off. (pvmove has some bugs in it's locking in the version that
comes with FC3).

Remember to hook the drives up as primary on seperate IDE controllers,
this will make sure things go as fast as they can.

Also, I had to change the number of error counts in dd_rhelp in order
to speed things up. Be prepared for it to take a while, I started it
off before a trip to Whistler, after 5 days of running, dd_rhelp was
still going, but running into unreadable sectors all the time. The
timeout can take 30-60 seconds per sector (not sure of the timeout
value).

Good luck.

On Fri, 28 Jan 2005 23:12:20 +0100, David R=EF=BF=BDhr <david@rohr.se> wrot=
e:
> I have a three disk LVM vg-group and lv-filesystem. With two 120Gb and
> one 60Gb. Using about 225Gb all together. Seems like my 60Gb disk has
> totaly crashed and I've tried everything to get the remaining data off
> the disks but nothing seems to work. Please, send me some light and say
> that their is a way to save some of the data?
>=20
> jasmin:/etc/lvm/archive# vgcfgrestore --debug -f fs_00001.vg fs
>   /dev/hdc: read failed after 0 of 4096 at 0: Input/output error
>   /dev/hdc: read failed after 0 of 4096 at 0: Input/output error
> Couldn't find device with uuid 'aizHaQ-iAXy-yMqL-d2wM-RIRM-7oWl-50cLy4'.
> Couldn't find all physical volumes for volume group fs.
> Restore failed.
>=20
> Can I reduce the "missing" disk and safe the data of the two disks
> remaining some how? I can live with loosing a couple of Gb of data, but
> not the entire 225Gb....
>=20
>     LVM version:     2.00.32 (2004-12-22)
>     Library version: 1.00.07-ioctl (2003-11-21)
>     Driver version:  4.1.0
>=20
> /d
>=20
> --
> If you want to program in C, program in C.  It's a nice language.  I
> use it occasionally...   :-)
>              -- Larry Wall in <7577@jpl-devvax.JPL.NASA.GOV >
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com=20
> https://www.redhat.com/mailman/listinfo/linux-lvm=20
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/=20
>

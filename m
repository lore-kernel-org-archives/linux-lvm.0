Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pBSA3kpK025947
	for <linux-lvm@redhat.com>; Wed, 28 Dec 2011 05:03:46 -0500
Received: from mail-gx0-f174.google.com (mail-gx0-f174.google.com
	[209.85.161.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBSA3iVw015835
	for <linux-lvm@redhat.com>; Wed, 28 Dec 2011 05:03:45 -0500
Received: by ggdk6 with SMTP id k6so10619260ggd.33
	for <linux-lvm@redhat.com>; Wed, 28 Dec 2011 02:03:44 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 28 Dec 2011 11:03:44 +0100
Message-ID: <CABYYHWFYi0hzVc6Z8BYVYwhZmyFAFroMTi7aQetc72doQw08cw@mail.gmail.com>
From: peter.bieshaar@gmail.com
Content-Type: multipart/alternative; boundary=0016e68ef3db78df1704b5241db2
Subject: [linux-lvm] How to find out the location of PE's
Reply-To: peter@bieshaar.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--0016e68ef3db78df1704b5241db2
Content-Type: text/plain; charset=ISO-8859-1

Due to a hardware mistake (dvd and hdu as IDE-master ??) I lost complete
disk- and therefor lvm administration on SATA disks.
- In other words I cannot see the partition- or PV/VG and LV
administration.
- So, fdisk or (pv|vg|lv)display can't give information.

lvm was initiated under ubuntu 11.04 or 10.10, a recent lvm2 version was
installed.

On one disk I tried to create a partition (without creating a filesystem
of-course :) ) but no pv-information was shown, using pvdisplay. I didn't
dare to do this on my RAID1 (md) disks.
I can read the disks with strings and dd, and saw content of scripts and
documents. So the content/data is still on the disks.

My chosen strategy to recover the LV's, is finding the PE's, pickthem
up and place them in a blob on another filesystem. So I can mount -o loop
that blob and restructure the disks.

My problem now is how to find these information. The web gives a lot of
information how to setup, but almost none on technical issues like this.

Can someone give me a hint on how this (the PE's) technically is being
organized (pointer -> pointer structures??) and where and how to search
these on the disk. So I can write a C-thingy to accomplish my strategy. If
someone already has something like this, or examples,

-- 
Regards,

Peter Bieshaar

--0016e68ef3db78df1704b5241db2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Due to a hardware mistake (dvd and hdu as IDE-master ??) I lost comple=
te disk- and therefor lvm administration on SATA disks. </div>
<div>- In other words I cannot see the partition- or PV/VG and LV administr=
ation. </div>
<div>- So, fdisk or (pv|vg|lv)display can&#39;t give information. </div>
<div>=A0</div>
<div>lvm was initiated under ubuntu 11.04 or 10.10, a recent lvm2 version w=
as installed. </div>
<div>=A0</div>
<div>On one disk I tried to create a partition (without creating a filesyst=
em=A0 of-course :) ) but no pv-information was shown, using pvdisplay. I di=
dn&#39;t dare to do this on my RAID1 (md) disks.</div>
<div>I can read the disks with strings and dd, and saw content of scripts a=
nd documents. So the content/data is still on the disks.</div>
<div>=A0</div>
<div>My chosen strategy to recover the LV&#39;s, is finding the PE&#39;s, p=
ickthem up=A0and place them in a blob on=A0another filesystem. So=A0I can m=
ount -o loop that blob and restructure the disks.</div>
<div>=A0</div>
<div>My problem now is how to find these information. The web gives a lot o=
f information how to setup, but almost none on technical issues like this. =
</div>
<div>=A0</div>
<div>Can someone give me a hint on how this (the PE&#39;s) technically is b=
eing organized (pointer -&gt; pointer structures??) and where and how to se=
arch these on the disk. So I can write a C-thingy to accomplish my strategy=
. If someone already has something like this, or examples, =A0<br clear=3D"=
all">
<br>-- <br></div>
<div>Regards,<br><br>Peter Bieshaar</div>

--0016e68ef3db78df1704b5241db2--

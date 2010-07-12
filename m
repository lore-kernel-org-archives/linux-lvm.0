Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6CIw96l004848
	for <linux-lvm@redhat.com>; Mon, 12 Jul 2010 14:58:09 -0400
Received: from mail-pv0-f174.google.com (mail-pv0-f174.google.com
	[74.125.83.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6CIvx4X028067
	for <linux-lvm@redhat.com>; Mon, 12 Jul 2010 14:57:59 -0400
Received: by pvc7 with SMTP id 7so2202557pvc.33
	for <linux-lvm@redhat.com>; Mon, 12 Jul 2010 11:57:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1007081510460.10077@bmsred.bmsi.com>
References: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
	<AANLkTikCxnSq4nyGf8V_uC5AqejaFwr7DgJuCcA4wY62@mail.gmail.com>
	<AANLkTilASQnpv7d0oB5NELpMQ7yzfWYIFjeooVtX8WPv@mail.gmail.com>
	<Pine.LNX.4.64.1007051420360.11654@bmsred.bmsi.com>
	<20100706161745.GB31734@us.ibm.com>
	<AANLkTinATF8nv02K4F0SQiR1OGg0rZ3P5lpsITcB-RYb@mail.gmail.com>
	<Pine.LNX.4.64.1007081459130.10077@bmsred.bmsi.com>
	<Pine.LNX.4.64.1007081510460.10077@bmsred.bmsi.com>
Date: Mon, 12 Jul 2010 11:57:58 -0700
Message-ID: <AANLkTikgXu9hKUQ7rq7_8KauyvrKGgDASxeyBM08GRXW@mail.gmail.com>
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd32f0ccac5e1048b3554c6
Subject: Re: [linux-lvm] Rebuilding ext4 filesystem on an LV
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

--000e0cd32f0ccac5e1048b3554c6
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 8, 2010 at 12:13 PM, Stuart D. Gathman <stuart@bmsi.com> wrote:

> On Thu, 8 Jul 2010, Stuart D. Gathman wrote:
>
> > Method 2:
> > With both new and failed drive connected, use dd_rescue or equivalent to
> > copy (most/some of) the failed drive to the new drive.  Remove failed
> > drive and bring up VG.  If UUID was not readable on failed drive, use
> > pvcreate to restore it on new drive.
>
>
(Question: does new drive need to be same physical size? can Or can I just
create a new partition with the old size - new drive is bigger.)

The real problem seems to be that the LV appears to the LVM as not
formatted. I am guessing this is because not only the partition got trashed,
but also the superblock(s)  data. I have tried to find backup superblocks,
but I keep getting the ioctl error, even from mke2fs. I will try dd_rescue -
I have to install it, since it is not by default.

I added a new drive to the LV, and tried pvmove, but, I got the ioctl error
again with that.

I should mention that an external case-free USB adapter is the best way
> to attempt recovery of failed drives.  You can even run the IDE/SATA/Power
> cable to a box in the freezer (and the USB adapter can sit on top of the
> freezer and a long USB cable go to your computer) - which often helps
> recover
> data from failing drives.
>
>
If the mountain won't come to Mohammed... I can always just get a large bag
of ice and (carefully wrapped up in waterproof cover) put the drive into it.
Will try that also :-).

FWIW: I did run dmsetup _table, and from /var/log/messages:

____________
Jul 12 09:17:25 Elmer kernel: device-mapper: ioctl: error adding target to
table
Jul 12 09:24:16 Elmer kernel: device-mapper: table: device 253:3 too small
for target
____________

Couple of thoughts:
* Using dd_rescue, is there a utility that can read through the physical
blocks on the drive, searching for something that looks like a superblock?

* Or, is it possible to physically disconnect the bad drive, bring up the
remainder of the LV with the hope of recovering whatever data was on those
drives. Att this point, I am resigned to the fact that the first drive is
dead or on its last gasp (SMARTD says something like: "Danger (Will
Robinson!) drive failure imminent. Back up data immediately.)" But the other
drives in the LV should have something on them still. Right?

As always thanks for the help.

             Stuart D. Gathman <stuart@bmsi.com>
>    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
>
"All consuming fires of hell" - very loose translation from Mozart's
unfinished Mass for the Dead :-)

ken

--000e0cd32f0ccac5e1048b3554c6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Thu, Jul 8, 2010 at 12:13 PM, Stuart =
D. Gathman <span dir=3D"ltr">&lt;<a href=3D"mailto:stuart@bmsi.com">stuart@=
bmsi.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;">
<div class=3D"im">On Thu, 8 Jul 2010, Stuart D. Gathman wrote:<br>
<br>
&gt; Method 2:<br>
&gt; With both new and failed drive connected, use dd_rescue or equivalent =
to<br>
&gt; copy (most/some of) the failed drive to the new drive. =A0Remove faile=
d<br>
&gt; drive and bring up VG. =A0If UUID was not readable on failed drive, us=
e<br>
&gt; pvcreate to restore it on new drive.<br>
<br></div></blockquote><div><br>(Question: does new drive need to be same p=
hysical size? can Or can I just create a new partition with the old size - =
new drive is bigger.)<br><br>The real problem seems to be that the LV appea=
rs to the LVM as not formatted. I am guessing this is because not only the =
partition got trashed, but also the superblock(s)=A0 data. I have tried to =
find backup superblocks, but I keep getting the ioctl error, even from mke2=
fs. I will try dd_rescue - I have to install it, since it is not by default=
.<br>
<br>I added a new drive to the LV, and tried pvmove, but, I got the ioctl e=
rror again with that.<br><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;">
<div class=3D"im">
</div>I should mention that an external case-free USB adapter is the best w=
ay<br>
to attempt recovery of failed drives. =A0You can even run the IDE/SATA/Powe=
r<br>
cable to a box in the freezer (and the USB adapter can sit on top of the<br=
>
freezer and a long USB cable go to your computer) - which often helps recov=
er<br>
data from failing drives.<br>
<div><div></div><div class=3D"h5"><br></div></div></blockquote><div><br>If =
the mountain won&#39;t come to Mohammed... I can always just get a large ba=
g of ice and (carefully wrapped up in waterproof cover) put the drive into =
it. Will try that also :-).<br>
<br>FWIW: I did run dmsetup _table, and from /var/log/messages:<br><br>____=
________<br>Jul 12 09:17:25 Elmer kernel: device-mapper: ioctl: error addin=
g target to table<br>Jul 12 09:24:16 Elmer kernel: device-mapper: table: de=
vice 253:3 too small for target<br>
____________<br>
<br>Couple of thoughts:<br>* Using dd_rescue, is there a utility that can r=
ead through the physical blocks on the drive, searching for something that =
looks like a superblock?<br><br>* Or, is it possible to physically disconne=
ct the bad drive, bring up the remainder of the LV with the hope of recover=
ing whatever data was on those drives. Att this point, I am resigned to the=
 fact that the first drive is dead or on its last gasp (SMARTD says somethi=
ng like: &quot;Danger (Will Robinson!) drive failure imminent. Back up data=
 immediately.)&quot; But the other drives in the LV should have something o=
n them still. Right?<br>
<br>As always thanks for the help.<br><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, =
204, 204); padding-left: 1ex;"><div><div class=3D"h5">
 =A0 =A0 =A0 =A0 =A0 =A0 =A0Stuart D. Gathman &lt;<a href=3D"mailto:stuart@=
bmsi.com">stuart@bmsi.com</a>&gt;<br>
 =A0 =A0Business Management Systems Inc. =A0Phone: 703 591-0911 Fax: 703 59=
1-6154<br>
&quot;Confutatis maledictis, flammis acribus addictis&quot; - background so=
ng for<br>
a Microsoft sponsored &quot;Where do you want to go from here?&quot; commer=
cial.<br>
<br></div></div></blockquote><div><br>&quot;All consuming fires of hell&quo=
t; - very loose translation from Mozart&#39;s unfinished Mass for the Dead =
:-)<br></div><br></div>ken<br>

--000e0cd32f0ccac5e1048b3554c6--

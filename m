Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p5T8lHms009714
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2011 04:47:17 -0400
Received: from ndmsnpf01.ndc.nasa.gov (ndmsnpf01.ndc.nasa.gov [198.117.0.121])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5T8lEkb019723
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2011 04:47:14 -0400
Received: from ndjsppt03.ndc.nasa.gov (ndjsppt03.ndc.nasa.gov [198.117.1.102])
	by ndmsnpf01.ndc.nasa.gov (Postfix) with ESMTP id 799792602A9
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2011 03:47:14 -0500 (CDT)
Received: from ndjshub02.ndc.nasa.gov (ndjshub02-pub.ndc.nasa.gov
	[198.117.1.161])
	by ndjsppt03.ndc.nasa.gov (8.14.4/8.14.4) with ESMTP id p5T8lEFg015549
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2011 03:47:14 -0500
From: "Stamper, Brian P. (ARC-D)[Stinger Ghaffarian Technologies Inc. (SGT
	Inc.)]" <brian.p.stamper@nasa.gov>
Date: Wed, 29 Jun 2011 03:47:11 -0500
Message-ID: <CA30349F.11C2A%brian.p.stamper@nasa.gov>
In-Reply-To: <4E00BA55.1000506@cfl.rr.com>
Content-Language: en
Content-Type: multipart/alternative;
	boundary="_000_CA30349F11C2Abrianpstampernasagov_"
MIME-Version: 1.0
Subject: [linux-lvm] Fedora 15 lvm root device not found
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

--_000_CA30349F11C2Abrianpstampernasagov_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I just upgraded a Fedora system from 13 to 15, and now I can't get it to bo=
ot.  I'm getting dumped to a dracut shell and getting the error dm-linear d=
evice lookup failed.  In the dracut output with debug on, I see dracut scan=
 my drives, and I see it find my 3 LVs, but it then tries to do something w=
ith them, I get the error, and it then fails out with root device not found=
 and drops me into dracut.

Here's the odd thing, booting off the rescue dvd my volumes are fine.  The =
LVM can be mounted no problem.

This makes me think that there's something missing from the kernel or initr=
d.  I can't really figure out what though.  I've gone through the output of=
 lsmod when running from the rescue dvd.  I've even build a few ramdisks in=
cluding all the modules that I thought might be related (dm, lvm, mdraid, d=
mraid, multipath).  I tried building them with mkinitrd -with=3Dmodule, and=
 I tried again with dracut -add=3Dmodules.  No change in results.

I'm not sure where to go from here.  I feel like the system can be rescued,=
 but I don't know how to work backward through dracut to find out why it's =
unable to find my root volume.  Any help would be appreciated.  Cross-posti=
ng to dm-devel.

Thanks,
-Brian

--_000_CA30349F11C2Abrianpstampernasagov_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML>
<HEAD>
<TITLE>Fedora 15 lvm root device not found</TITLE>
</HEAD>
<BODY>
<FONT FACE=3D"Calibri, Verdana, Helvetica, Arial"><SPAN STYLE=3D'font-size:=
11pt'>I just upgraded a Fedora system from 13 to 15, and now I can&#8217;t =
get it to boot. &nbsp;I&#8217;m getting dumped to a dracut shell and gettin=
g the error dm-linear device lookup failed. &nbsp;In the dracut output with=
 debug on, I see dracut scan my drives, and I see it find my 3 LVs, but it =
then tries to do something with them, I get the error, and it then fails ou=
t with root device not found and drops me into dracut.<BR>
<BR>
Here&#8217;s the odd thing, booting off the rescue dvd my volumes are fine.=
 &nbsp;The LVM can be mounted no problem.<BR>
<BR>
This makes me think that there&#8217;s something missing from the kernel or=
 initrd. &nbsp;I can&#8217;t really figure out what though. &nbsp;I&#8217;v=
e gone through the output of lsmod when running from the rescue dvd. &nbsp;=
I&#8217;ve even build a few ramdisks including all the modules that I thoug=
ht might be related (dm, lvm, mdraid, dmraid, multipath). &nbsp;I tried bui=
lding them with mkinitrd &#8212;with=3Dmodule, and I tried again with dracu=
t &#8212;add=3Dmodules. &nbsp;No change in results.<BR>
<BR>
I&#8217;m not sure where to go from here. &nbsp;I feel like the system can =
be rescued, but I don&#8217;t know how to work backward through dracut to f=
ind out why it&#8217;s unable to find my root volume. &nbsp;Any help would =
be appreciated. &nbsp;Cross-posting to dm-devel.<BR>
<BR>
Thanks,<BR>
-Brian</SPAN></FONT>
</BODY>
</HTML>


--_000_CA30349F11C2Abrianpstampernasagov_--

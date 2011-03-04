Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p24CJSRx003007
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 07:19:28 -0500
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p24CJJ1l010014
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 07:19:20 -0500
Received: by iyb26 with SMTP id 26so2264982iyb.33
	for <linux-lvm@redhat.com>; Fri, 04 Mar 2011 04:19:19 -0800 (PST)
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
	<Pine.LNX.4.64.1103031516340.14941@bmsred.bmsi.com>
	<OFA451250E.47639620-ON80257849.0038129E-80257849.0038324B@cardiff.ac.uk>
From: Scott Arthur <scott@scottatron.com>
Content-Type: multipart/alternative;
	boundary=Apple-Mail-1-958920403
In-Reply-To: <OFA451250E.47639620-ON80257849.0038129E-80257849.0038324B@cardiff.ac.uk>
Message-Id: <E9488659-0B3D-4B06-9AB8-49C0359B272A@scottatron.com>
Date: Sat, 5 Mar 2011 01:19:38 +1300
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (iPad Mail 8C148)
Subject: Re: [linux-lvm] Resizing underlying LVM partition after cloning to
	bigger disk
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


--Apple-Mail-1-958920403
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I did consider that as an easier option.

Based on what is said here: http://tldp.org/HOWTO/LVM-HOWTO/multpartitions.h=
tml if I don't have striped logical volumes and there's only one physical dr=
ive, can I expect any performance issues?

On 4/03/2011, at 11:13 PM, Lyn Rees <Rees@cardiff.ac.uk> wrote:

> Why don't you just make a new partition and add it to the VG, then expand t=
he LV. Isn't that the point of LVM?=20
> --------------------------------------------------
> Mr Lyn Rees
> Senior Engineer, UIG
> Information Services Computing Centre
> Cardiff University, 40-41 Park Place,
> Cardiff. CF10 3BB.
> --------------------------------------------------
> Contact numbers:
> (029) 2087 9188 (direct)
> (029) 2087 4875 (reception)
> (029) 2087 4285 (fax)
> --------------------------------------------------
> Email: rees@cardiff.ac.uk
> Web: www.cardiff.ac.uk=20
>=20
>=20
>=20
> From:        "Stuart D. Gathman" <stuart@bmsi.com>=20
> To:        LVM general discussion and development <linux-lvm@redhat.com>=20=

> Date:        03/03/2011 20:27=20
> Subject:        Re: [linux-lvm] Resizing underlying LVM partition after cl=
oning to bigger disk=20
> Sent by:        linux-lvm-bounces@redhat.com=20
>=20
>=20
>=20
> On Thu, 3 Mar 2011, Scott Arthur wrote:
>=20
> > Partition Table: msdos
> >=20
> > Number  Start   End     Size    Type      File system  Flags
> >  1      32.3kB  296MB   296MB   primary   ext4         boot
> >  2      296MB   1000GB  1000GB  extended
> >  5      296MB   1000GB  1000GB  logical                lvm
> >=20
> > I'm obviously wanting to expand the LVM partition to fill the remaining 1=
TB
> > of space.
> >=20
> > Am I able to simply use parted to resize the partition before doing a
> > pvresize etc?
> >=20
> > Or is it risky to resize the underlying LVM partition?
>=20
> You are getting to a size where msdos partition tables are risky.
> Don't they crap out at 2TB?
>=20
> --=20
>                       Stuart D. Gathman <stuart@bmsi.com>
>    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154=

> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--Apple-Mail-1-958920403
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=utf-8

<html><body bgcolor="#FFFFFF"><div>I did consider that as an easier option.</div><div><br></div><div><span class="Apple-style-span" style="-webkit-tap-highlight-color: rgba(26, 26, 26, 0.296875); -webkit-composition-fill-color: rgba(175, 192, 227, 0.230469); -webkit-composition-frame-color: rgba(77, 128, 180, 0.230469); ">Based on what is said here: <a href="http://tldp.org/HOWTO/LVM-HOWTO/multpartitions.html">http://tldp.org/HOWTO/LVM-HOWTO/multpartitions.html</a> </span>if I don't have striped logical volumes and there's only one physical drive, can I expect any performance issues?</div><div><br></div><div>On 4/03/2011, at 11:13 PM, Lyn Rees &lt;<a href="mailto:Rees@cardiff.ac.uk">Rees@cardiff.ac.uk</a>&gt; wrote:<br><br></div><div></div><blockquote type="cite"><div><font size="2" face="sans-serif">Why don't you just make a new partition
and add it to the VG, then expand the LV. Isn't that the point of LVM?</font>
<br><font size="2" face="sans-serif">--------------------------------------------------<br>
Mr Lyn Rees<br>
Senior Engineer, UIG<br>
Information Services Computing Centre<br>
Cardiff University, 40-41 Park Place,<br>
Cardiff. CF10 3BB.<br>
--------------------------------------------------<br>
Contact numbers:<br>
(029) 2087 9188 (direct)<br>
(029) 2087 4875 (reception)<br>
(029) 2087 4285 (fax)<br>
--------------------------------------------------<br>
Email: <a href="mailto:rees@cardiff.ac.uk"><a href="mailto:rees@cardiff.ac.uk">rees@cardiff.ac.uk</a></a><br>
Web: </font><a href="www.cardiff.ac.uk"><font size="2" face="sans-serif">www.cardiff.ac.uk</font></a>
<br>
<br>
<br>
<br><font size="1" color="#5f5f5f" face="sans-serif">From: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size="1" face="sans-serif">"Stuart D. Gathman"
&lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;</font>
<br><font size="1" color="#5f5f5f" face="sans-serif">To: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size="1" face="sans-serif">LVM general discussion
and development &lt;<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>&gt;</font>
<br><font size="1" color="#5f5f5f" face="sans-serif">Date: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size="1" face="sans-serif">03/03/2011 20:27</font>
<br><font size="1" color="#5f5f5f" face="sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size="1" face="sans-serif">Re: [linux-lvm]
Resizing underlying LVM partition after cloning to bigger disk</font>
<br><font size="1" color="#5f5f5f" face="sans-serif">Sent by: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size="1" face="sans-serif"><a href="mailto:linux-lvm-bounces@redhat.com">linux-lvm-bounces@redhat.com</a></font>
<br>
<hr noshade="">
<br>
<br>
<br><tt><font size="2">On Thu, 3 Mar 2011, Scott Arthur wrote:<br>
<br>
&gt; Partition Table: msdos<br>
&gt; <br>
&gt; Number &nbsp;Start &nbsp; End &nbsp; &nbsp; Size &nbsp; &nbsp;Type
&nbsp; &nbsp; &nbsp;File system &nbsp;Flags<br>
&gt; &nbsp;1 &nbsp; &nbsp; &nbsp;32.3kB &nbsp;296MB &nbsp; 296MB &nbsp;
primary &nbsp; ext4 &nbsp; &nbsp; &nbsp; &nbsp; boot<br>
&gt; &nbsp;2 &nbsp; &nbsp; &nbsp;296MB &nbsp; 1000GB &nbsp;1000GB &nbsp;extended<br>
&gt; &nbsp;5 &nbsp; &nbsp; &nbsp;296MB &nbsp; 1000GB &nbsp;1000GB &nbsp;logical
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;lvm<br>
&gt; <br>
&gt; I'm obviously wanting to expand the LVM partition to fill the remaining
1TB<br>
&gt; of space.<br>
&gt; <br>
&gt; Am I able to simply use parted to resize the partition before doing
a<br>
&gt; pvresize etc?<br>
&gt; <br>
&gt; Or is it risky to resize the underlying LVM partition?<br>
<br>
You are getting to a size where msdos partition tables are risky.<br>
Don't they crap out at 2TB?<br>
<br>
-- <br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; Stuart D. Gathman &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;<br>
 &nbsp; &nbsp;Business Management Systems Inc. &nbsp;Phone: 703 591-0911
Fax: 703 591-6154<br>
"Confutatis maledictis, flammis acribus addictis" - background
song for<br>
a Microsoft sponsored "Where do you want to go from here?" commercial.<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com"><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a></a><br>
</font></tt><a href="https://www.redhat.com/mailman/listinfo/linux-lvm"><tt><font size="2">https://www.redhat.com/mailman/listinfo/linux-lvm</font></tt></a><tt><font size="2"><br>
read the LVM HOW-TO at </font></tt><a href="http://tldp.org/HOWTO/LVM-HOWTO/"><tt><font size="2">http://tldp.org/HOWTO/LVM-HOWTO/</font></tt></a><tt><font size="2"><br>
</font></tt>
<br></div></blockquote><blockquote type="cite"><div><span>_______________________________________________</span><br><span>linux-lvm mailing list</span><br><span><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a></span><br><span><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a></span><br><span>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/"><a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></a></span></div></blockquote></body></html>
--Apple-Mail-1-958920403--

Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p24ADwpd011766
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 05:13:58 -0500
Received: from smtpout2.cf.ac.uk (smtpout2.cf.ac.uk [131.251.137.139])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p24ADnjk003440
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 05:13:49 -0500
Received: from mdomsmp01.cf.ac.uk ([10.255.228.22])
	by smtpout2.cf.ac.uk with esmtp (Exim 4.72)
	(envelope-from <Rees@cardiff.ac.uk>) id 1PvS15-0008M9-SB
	for linux-lvm@redhat.com; Fri, 04 Mar 2011 10:13:47 +0000
In-Reply-To: <Pine.LNX.4.64.1103031516340.14941@bmsred.bmsi.com>
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
	<Pine.LNX.4.64.1103031516340.14941@bmsred.bmsi.com>
MIME-Version: 1.0
Message-ID: <OFA451250E.47639620-ON80257849.0038129E-80257849.0038324B@cardiff.ac.uk>
From: Lyn Rees <Rees@cardiff.ac.uk>
Date: Fri, 4 Mar 2011 10:13:47 +0000
Content-Type: multipart/alternative;
	boundary="=_alternative 0038324980257849_="
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

This is a multipart message in MIME format.
--=_alternative 0038324980257849_=
Content-Type: text/plain; charset="US-ASCII"

Why don't you just make a new partition and add it to the VG, then expand 
the LV. Isn't that the point of LVM?
--------------------------------------------------
Mr Lyn Rees
Senior Engineer, UIG
Information Services Computing Centre
Cardiff University, 40-41 Park Place,
Cardiff. CF10 3BB.
--------------------------------------------------
Contact numbers:
(029) 2087 9188 (direct)
(029) 2087 4875 (reception)
(029) 2087 4285 (fax)
--------------------------------------------------
Email: rees@cardiff.ac.uk
Web: www.cardiff.ac.uk



From:   "Stuart D. Gathman" <stuart@bmsi.com>
To:     LVM general discussion and development <linux-lvm@redhat.com>
Date:   03/03/2011 20:27
Subject:        Re: [linux-lvm] Resizing underlying LVM partition after 
cloning to bigger disk
Sent by:        linux-lvm-bounces@redhat.com



On Thu, 3 Mar 2011, Scott Arthur wrote:

> Partition Table: msdos
> 
> Number  Start   End     Size    Type      File system  Flags
>  1      32.3kB  296MB   296MB   primary   ext4         boot
>  2      296MB   1000GB  1000GB  extended
>  5      296MB   1000GB  1000GB  logical                lvm
> 
> I'm obviously wanting to expand the LVM partition to fill the remaining 
1TB
> of space.
> 
> Am I able to simply use parted to resize the partition before doing a
> pvresize etc?
> 
> Or is it risky to resize the underlying LVM partition?

You are getting to a size where msdos partition tables are risky.
Don't they crap out at 2TB?

-- 
                       Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 
591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--=_alternative 0038324980257849_=
Content-Type: text/html; charset="US-ASCII"

<font size=2 face="sans-serif">Why don't you just make a new partition
and add it to the VG, then expand the LV. Isn't that the point of LVM?</font>
<br><font size=2 face="sans-serif">--------------------------------------------------<br>
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
Email: rees@cardiff.ac.uk<br>
Web: </font><a href=www.cardiff.ac.uk><font size=2 face="sans-serif">www.cardiff.ac.uk</font></a>
<br>
<br>
<br>
<br><font size=1 color=#5f5f5f face="sans-serif">From: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=1 face="sans-serif">&quot;Stuart D. Gathman&quot;
&lt;stuart@bmsi.com&gt;</font>
<br><font size=1 color=#5f5f5f face="sans-serif">To: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=1 face="sans-serif">LVM general discussion
and development &lt;linux-lvm@redhat.com&gt;</font>
<br><font size=1 color=#5f5f5f face="sans-serif">Date: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=1 face="sans-serif">03/03/2011 20:27</font>
<br><font size=1 color=#5f5f5f face="sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=1 face="sans-serif">Re: [linux-lvm]
Resizing underlying LVM partition after cloning to bigger disk</font>
<br><font size=1 color=#5f5f5f face="sans-serif">Sent by: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=1 face="sans-serif">linux-lvm-bounces@redhat.com</font>
<br>
<hr noshade>
<br>
<br>
<br><tt><font size=2>On Thu, 3 Mar 2011, Scott Arthur wrote:<br>
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
&nbsp; &nbsp; &nbsp; Stuart D. Gathman &lt;stuart@bmsi.com&gt;<br>
 &nbsp; &nbsp;Business Management Systems Inc. &nbsp;Phone: 703 591-0911
Fax: 703 591-6154<br>
&quot;Confutatis maledictis, flammis acribus addictis&quot; - background
song for<br>
a Microsoft sponsored &quot;Where do you want to go from here?&quot; commercial.<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
</font></tt><a href="https://www.redhat.com/mailman/listinfo/linux-lvm"><tt><font size=2>https://www.redhat.com/mailman/listinfo/linux-lvm</font></tt></a><tt><font size=2><br>
read the LVM HOW-TO at </font></tt><a href="http://tldp.org/HOWTO/LVM-HOWTO/"><tt><font size=2>http://tldp.org/HOWTO/LVM-HOWTO/</font></tt></a><tt><font size=2><br>
</font></tt>
<br>
--=_alternative 0038324980257849_=--

Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4L7K9x8026949
	for <linux-lvm@redhat.com>; Fri, 21 May 2010 03:20:10 -0400
Received: from smtpout1.cf.ac.uk (smtpout1.cf.ac.uk [131.251.137.125])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4L7K0Z9027321
	for <linux-lvm@redhat.com>; Fri, 21 May 2010 03:20:01 -0400
Received: from mdomsmp01.cf.ac.uk ([10.255.228.22])
	by smtpout1.cf.ac.uk with esmtp (Exim 4.69)
	(envelope-from <Rees@cardiff.ac.uk>) id 1OFMWV-0000uB-Ml
	for linux-lvm@redhat.com; Fri, 21 May 2010 08:19:59 +0100
In-Reply-To: <4BF62CBF.3070702@tlinx.org>
References: <4BF5A883.7060503@tlinx.org>	<20100521051021.GA1412@maude.comedia.it>
	<4BF62CBF.3070702@tlinx.org>
MIME-Version: 1.0
From: Lyn Rees <Rees@cardiff.ac.uk>
Message-ID: <OFCFCB47DB.6AADE92B-ON8025772A.0027DF7C-8025772A.0028479D@cardiff.ac.uk>
Date: Fri, 21 May 2010 08:19:58 +0100
Content-Type: multipart/alternative;
	boundary="=_alternative 002845228025772A_="
Subject: Re: [linux-lvm] Volume alignment over RAID
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
--=_alternative 002845228025772A_=
Content-Type: text/plain; charset="US-ASCII"

> 192.00K is listed as the start of each!  GRR...why would that
> be a default...I suppose it works for someone, but it's NOT a power of 
2! 
> Hmph!

192 is a multiplier of 64... so it's aligned - assuming you used the whole 
disk as a PV (you didn't partition the thing first).

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



From:   "Linda A. Walsh" <lvm@tlinx.org>
To:     LVM general discussion and development <linux-lvm@redhat.com>
Date:   21/05/2010 07:56
Subject:        Re: [linux-lvm] Volume alignment over RAID
Sent by:        linux-lvm-bounces@redhat.com



Luca Berra wrote:
> On Thu, May 20, 2010 at 02:24:19PM -0700, Linda A. Walsh wrote:
>> I'm a bit unclear as to where some units are applied in my RAID setup, 
but
>> was wondering how LVM interacted, could be, or should be setup so that
>> created volumes would be aligned properly on top of a RAID disk.
> note that if your rig uses fairly recent software data alignment should
> happen automagically.
---
                 So I'm told, but I like to verify, I'm paranoid :-)

>> I'm using a RAID 'chunk' size of 64k as suggested by the RAID 
documentation
>> and am using 6 disks to create a RAID6, giving 4 units of data/stripe. 
Does
> I suppose by raid you mean md, so i wonder what documentation you were
> looking at?
---
                 Well, doc in 2 different raid controllers LSI and rocket 
raid both
suggest 64K as a unit size (forget, their exact term).

> I think 64k might be small as a chunk size, depending on your array size
> you probably want a bigger size.
---
                 Really?  What are the trade offs?  Array size well 6 
disks and 4 of data.

> 
> Then, since with a six drive raid 6 stripe size is always a power of 2,
> answers are easy :)
---
                 I like easy...figure 4 should divide into most things.


>> this mean my logical volume needs to be aligned on a 64K boundary, or a 
256k
>> boundary? I.e. does 64k usually specify chunk/unit, or chunk/stripe?
> align to stripe size
> 
>> What do I need to do to make sure my logical volumes always line up on 
RAID
>> stripe boundaries?
> make the volume group with pe size multiple of stripe size
>> I've been using default logical volume parameters, which I think use an
>> allocation size measured in Megabytes, so does that imply I'm 
automatically
>> aligned (as 64k and 256k both divide into 1 Meg)
----
                 It's 4.0M, so not a problem...but this next one is:


>>  Or is some offset involved?
> run:
> pvs -o pv_name,pe_start



                 192.00K is listed as the start of each!  GRR...why would 
that
be a default...I suppose it works for someone, but it's NOT a power of 2! 
Hmph!

So each start is messed up.  Is there a way I can change the default on a 
per
volume basis? ...(yes: --datalignment; if I'd just read manpage
before shooting!)

(off to read manpage...thanks for the help....this is most unpleasant,
given I' just copied 1.3T (6 hours worth) of data on to this thing 
already...
looks like I was a bit too eager, but was out of disk space on old 
partition.
Oh well..).

*sigh*

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--=_alternative 002845228025772A_=
Content-Type: text/html; charset="US-ASCII"

<tt><font size=2>&gt; 192.00K is listed as the start of each! &nbsp;GRR...why
would that<br>
&gt; be a default...I suppose it works for someone, but it's NOT a power
of 2! <br>
&gt; Hmph!</font></tt>
<br>
<br><tt><font size=2>192 is a multiplier of 64... so it's aligned - assuming
you used the whole disk as a PV (you didn't partition the thing first).</font></tt>
<br>
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
&nbsp;</font><font size=1 face="sans-serif">&quot;Linda A. Walsh&quot;
&lt;lvm@tlinx.org&gt;</font>
<br><font size=1 color=#5f5f5f face="sans-serif">To: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=1 face="sans-serif">LVM general discussion
and development &lt;linux-lvm@redhat.com&gt;</font>
<br><font size=1 color=#5f5f5f face="sans-serif">Date: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=1 face="sans-serif">21/05/2010 07:56</font>
<br><font size=1 color=#5f5f5f face="sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=1 face="sans-serif">Re: [linux-lvm]
Volume alignment over RAID</font>
<br><font size=1 color=#5f5f5f face="sans-serif">Sent by: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=1 face="sans-serif">linux-lvm-bounces@redhat.com</font>
<br>
<hr noshade>
<br>
<br>
<br><tt><font size=2>Luca Berra wrote:<br>
&gt; On Thu, May 20, 2010 at 02:24:19PM -0700, Linda A. Walsh wrote:<br>
&gt;&gt; I'm a bit unclear as to where some units are applied in my RAID
setup, but<br>
&gt;&gt; was wondering how LVM interacted, could be, or should be setup
so that<br>
&gt;&gt; created volumes would be aligned properly on top of a RAID disk.<br>
&gt; note that if your rig uses fairly recent software data alignment should<br>
&gt; happen automagically.<br>
---<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
So I'm told, but I like to verify, I'm paranoid :-)<br>
<br>
&gt;&gt; I'm using a RAID 'chunk' size of 64k as suggested by the RAID
documentation<br>
&gt;&gt; and am using 6 disks to create a RAID6, giving 4 units of data/stripe.
&nbsp;Does<br>
&gt; I suppose by raid you mean md, so i wonder what documentation you
were<br>
&gt; looking at?<br>
---<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
Well, doc in 2 different raid controllers LSI and rocket raid both<br>
suggest 64K as a unit size (forget, their exact term).<br>
<br>
&gt; I think 64k might be small as a chunk size, depending on your array
size<br>
&gt; you probably want a bigger size.<br>
---<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
Really? &nbsp;What are the trade offs? &nbsp;Array size well 6 disks and
4 of data.<br>
<br>
&gt; <br>
&gt; Then, since with a six drive raid 6 stripe size is always a power
of 2,<br>
&gt; answers are easy :)<br>
---<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
I like easy...figure 4 should divide into most things.<br>
<br>
<br>
&gt;&gt; this mean my logical volume needs to be aligned on a 64K boundary,
or a 256k<br>
&gt;&gt; boundary? I.e. does 64k usually specify chunk/unit, or chunk/stripe?<br>
&gt; align to stripe size<br>
&gt; <br>
&gt;&gt; What do I need to do to make sure my logical volumes always line
up on RAID<br>
&gt;&gt; stripe boundaries?<br>
&gt; make the volume group with pe size multiple of stripe size<br>
&gt;&gt; I've been using default logical volume parameters, which I think
use an<br>
&gt;&gt; allocation size measured in Megabytes, so does that imply I'm
automatically<br>
&gt;&gt; aligned (as 64k and 256k both divide into 1 Meg)<br>
----<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
It's 4.0M, so not a problem...but this next one is:<br>
<br>
<br>
&gt;&gt; &nbsp;Or is some offset involved?<br>
&gt; run:<br>
&gt; pvs -o pv_name,pe_start<br>
<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
192.00K is listed as the start of each! &nbsp;GRR...why would that<br>
be a default...I suppose it works for someone, but it's NOT a power of
2! <br>
Hmph!<br>
<br>
So each start is messed up. &nbsp;Is there a way I can change the default
on a per<br>
volume basis? ...(yes: --datalignment; if I'd just read manpage<br>
before shooting!)<br>
<br>
(off to read manpage...thanks for the help....this is most unpleasant,<br>
given I' just copied 1.3T (6 hours worth) of data on to this thing already...<br>
looks like I was a bit too eager, but was out of disk space on old partition.<br>
Oh well..).<br>
<br>
*sigh*<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
</font></tt><a href="https://www.redhat.com/mailman/listinfo/linux-lvm"><tt><font size=2>https://www.redhat.com/mailman/listinfo/linux-lvm</font></tt></a><tt><font size=2><br>
read the LVM HOW-TO at </font></tt><a href="http://tldp.org/HOWTO/LVM-HOWTO/"><tt><font size=2>http://tldp.org/HOWTO/LVM-HOWTO/</font></tt></a><tt><font size=2><br>
</font></tt>
<br>
--=_alternative 002845228025772A_=--

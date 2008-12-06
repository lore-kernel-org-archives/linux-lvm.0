Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB607jLK022614
	for <linux-lvm@redhat.com>; Fri, 5 Dec 2008 19:07:45 -0500
Received: from web38304.mail.mud.yahoo.com (web38304.mail.mud.yahoo.com
	[209.191.125.20])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id mB607VeG024196
	for <linux-lvm@redhat.com>; Fri, 5 Dec 2008 19:07:31 -0500
Date: Fri, 5 Dec 2008 16:07:30 -0800 (PST)
From: Michael Jensen <beachhangar@yahoo.com>
Subject: Re: [linux-lvm] lvm utilities, metadata format, CRC (checksum)
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1469722005-1228522050=:99844"
Message-ID: <123739.99844.qm@web38304.mail.mud.yahoo.com>
Reply-To: beachhangar@yahoo.com,
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
To: linux-lvm@redhat.com

--0-1469722005-1228522050=:99844
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Attempts to use the lvm cli tools have not proven sucessful to date.
=A0
Here's the scenario -
=A0
- A master volume is presented to the host and is init'd for use with LVM a=
nd mounted (and cannot be dismounted).
- Sometime later a storage manged snapshot is created and then mapped (pres=
ented) to the same host.=A0 This LUN has identical data in the metadata are=
a (1st 256 sectors).=A0 The only blocks that are different would be where w=
rites have been made to the master since the snapshot was taken.
- a pvscan made after the snap is available to the host reports duplicate u=
uid,=A0 And it appears that it shifts the systems view of which=A0LUN is th=
e one representing the LVM volume if the snap LUN is a higher numbered LUN =
than the master.
- filtering the master out via the conf file and doing a scan (which purges=
 cache, etc)=A0has not helped as the master LUN is already known to LVM and=
 is mounted.
=A0
A couple of questions -
=A0
- what is the best tool to use to search all the archive files?
- what sequence are you suggesting with the tools that will avoid the dupli=
cate found??
=A0
thanks
mike


--- On Fri, 12/5/08, Alasdair G Kergon <agk@redhat.com> wrote:



On Fri, Dec 05, 2008 at 07:06:03AM -0800, Michael Jensen wrote:
> Earlier attempts at being able to get a storage based snapshot on the sam=
e
server as its master failed because -
> - the master is always mounted (production)
> - the utilities recognize both master and snap and declare duplicate
> - manual edits of the header and label field failed because both are
"wrapped" with CRC that is calculated and checked by the utilities

That was obfuscated deliberately to dissuade people from thinking it's OK
to
edit those fields directly on disk instead of using the supplied tools!

Search the list archives - the topic comes up regularly and you can do what
you need using the command line tools.

Alasdair
--=20
agk@redhat.com
=0A=0A=0A      
--0-1469722005-1228522050=:99844
Content-Type: text/html; charset=us-ascii

<table cellspacing="0" cellpadding="0" border="0" ><tr><td valign="top" style="font: inherit;"><DIV id=yiv1811536775>
<DIV>Attempts to use the lvm cli tools have not proven sucessful to date.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Here's the scenario -</DIV>
<DIV>&nbsp;</DIV>
<DIV>- A master volume is presented to the host and is init'd for use with LVM and mounted (and cannot be dismounted).</DIV>
<DIV>- Sometime later a storage manged snapshot is created and then mapped (presented) to the same host.&nbsp; This LUN has identical data in the metadata area (1st 256 sectors).&nbsp; The only blocks that are different would be where writes have been made to the master since the snapshot was taken.</DIV>
<DIV>- a pvscan made after the snap is available to the host reports duplicate uuid,&nbsp; And it appears that it shifts the systems view of which&nbsp;LUN is the one representing the LVM volume if the snap LUN is a higher numbered LUN than the master.</DIV>
<DIV>- filtering the master out via the conf file and doing a scan (which purges cache, etc)&nbsp;has not helped as the master LUN is already known to LVM and is mounted.</DIV>
<DIV>&nbsp;</DIV>
<DIV>A couple of questions -</DIV>
<DIV>&nbsp;</DIV>
<DIV>- what is the best tool to use to search all the archive files?</DIV>
<DIV>- what sequence are you suggesting with the tools that will avoid the duplicate found??</DIV>
<DIV>&nbsp;</DIV>
<DIV>thanks</DIV>
<DIV>mike</DIV>
<DIV><BR><BR>--- On <B>Fri, 12/5/08, Alasdair G Kergon <I>&lt;agk@redhat.com&gt;</I></B> wrote:<BR></DIV>
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: rgb(16,16,255) 2px solid"><BR><BR><PRE>On Fri, Dec 05, 2008 at 07:06:03AM -0800, Michael Jensen wrote:
&gt; Earlier attempts at being able to get a storage based snapshot on the same
server as its master failed because -
&gt; - the master is always mounted (production)
&gt; - the utilities recognize both master and snap and declare duplicate
&gt; - manual edits of the header and label field failed because both are
"wrapped" with CRC that is calculated and checked by the utilities

That was obfuscated deliberately to dissuade people from thinking it's OK
to
edit those fields directly on disk instead of using the supplied tools!

Search the list archives - the topic comes up regularly and you can do what
you need using the command line tools.

Alasdair
-- 
agk@redhat.com
</PRE></BLOCKQUOTE></DIV></td></tr></table><br>

      
--0-1469722005-1228522050=:99844--

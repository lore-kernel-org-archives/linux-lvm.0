Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBG31Xr30199
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 22:01:33 -0500
Received: from ausmail.coremetrics.com (jpm.clientdynamics.net [66.45.103.238]
	(may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBG31Xps024035
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 22:01:33 -0500
Message-ID: <85063BBE668FD411944400D0B744267A8889A2@ausmail.core.coremetrics.com>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] How to increase/decrease space
Date: Wed, 15 Dec 2004 21:01:26 -0600
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C4E31B.88A91120"
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
To: "'AdabalaP@schneider.com '" <AdabalaP@schneider.com>, 'LVM general discussion and development ' <linux-lvm@redhat.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C4E31B.88A91120
Content-Type: text/plain;
	charset="utf-8"

That only increases the device size, you also need to extend the partition
onto that larger device. e2fsadm will do it or you can fdisk it to the
larger size. (mind you this involves deleting and recreating the partition
in-memory not on disk, unless you make a mistake and do d 1 w, instead of d
1, then n p 1 <return><return><return>)

Anyhow, you really should look into extending the partition/LV itself now,
depending if you partitioned or not, or used an invalid extent specification

Austin
 

-----Original Message-----
From: AdabalaP@schneider.com
To: LVM general discussion and development
Sent: 12/15/2004 8:15 PM
Subject: Re: [linux-lvm] How to increase/decrease space


"lvextend"  did not help. 

 

My file system type is "ext3".

 

Here is output:

#df -m

...

/dev/mapper/VolGroup00-LogVol04    1985   1728   156    92%   /usr

...

 

#lvdisplay   VolGroup00/LogVol04

...

LV Size    2.45 GB

...

 

 

I did the following on /opt file system for testing, the results were
the same the filesystem did not get increased.

 

#umount /opt

#lvresize  -L +64 VolGroup00/LogVol07

#lvextend -L +64 VolGroup00/LogVol07

 

Any suggessions.

 

 

 

 
Jason Martin <jhmartin@toger.us>
Sent by: linux-lvm-bounces@redhat.com
12/15/2004 10:15 AM PST
Please respond to LVM general discussion and development

To: linux-lvm@redhat.com
cc: 
bcc: 
Subject: Re: [linux-lvm] How to increase/decrease space
 



On Wed, Dec 15, 2004 at 12:11:30PM -0600, AdabalaP@schneider.com wrote:
> (1) Added more space (350 meg) to /usr using the command "lvresize
-L+350".
> When i display the volume group using "lvdisplay" it shows 2.3 gb, But
when
> i use "df -m" it is still at 1.9 gb and 92% used state.
You've resized the volume but not the filesystem sitting on top
of it. Some filesystems can be resized online while others must
be unmounted. Some may not be resizable at all.

See http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html
<http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html> .

-Jason Martin
--
This message is PGP/MIME signed.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
<https://www.redhat.com/mailman/listinfo/linux-lvm> 
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
<http://tldp.org/HOWTO/LVM-HOWTO/> 

 <<C.DTF>>  <<ATT190653.txt>> 

------_=_NextPart_001_01C4E31B.88A91120
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dutf-8">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: [linux-lvm] How to increase/decrease space</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>That only increases the device size, you also need to =
extend the partition onto that larger device. e2fsadm will do it or you =
can fdisk it to the larger size. (mind you this involves deleting and =
recreating the partition in-memory not on disk, unless you make a =
mistake and do d 1 w, instead of d 1, then n p 1 =
&lt;return&gt;&lt;return&gt;&lt;return&gt;)</FONT></P>

<P><FONT SIZE=3D2>Anyhow, you really should look into extending the =
partition/LV itself now, depending if you partitioned or not, or used =
an invalid extent specification</FONT></P>

<P><FONT SIZE=3D2>Austin</FONT>
<BR><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: AdabalaP@schneider.com</FONT>
<BR><FONT SIZE=3D2>To: LVM general discussion and development</FONT>
<BR><FONT SIZE=3D2>Sent: 12/15/2004 8:15 PM</FONT>
<BR><FONT SIZE=3D2>Subject: Re: [linux-lvm] How to increase/decrease =
space</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>&quot;lvextend&quot;&nbsp; did not help. </FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>My file system type is &quot;ext3&quot;.</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>Here is output:</FONT>
</P>

<P><FONT SIZE=3D2>#df -m</FONT>
</P>

<P><FONT SIZE=3D2>...</FONT>
</P>

<P><FONT SIZE=3D2>/dev/mapper/VolGroup00-LogVol04&nbsp;&nbsp;&nbsp; =
1985&nbsp;&nbsp; 1728&nbsp;&nbsp; 156&nbsp;&nbsp;&nbsp; 92%&nbsp;&nbsp; =
/usr</FONT>
</P>

<P><FONT SIZE=3D2>...</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>#lvdisplay&nbsp;&nbsp; VolGroup00/LogVol04</FONT>
</P>

<P><FONT SIZE=3D2>...</FONT>
</P>

<P><FONT SIZE=3D2>LV Size&nbsp;&nbsp;&nbsp; 2.45 GB</FONT>
</P>

<P><FONT SIZE=3D2>...</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>I did the following on /opt file system for testing, =
the results were</FONT>
<BR><FONT SIZE=3D2>the same the filesystem did not get =
increased.</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>#umount /opt</FONT>
</P>

<P><FONT SIZE=3D2>#lvresize&nbsp; -L +64 VolGroup00/LogVol07</FONT>
</P>

<P><FONT SIZE=3D2>#lvextend -L +64 VolGroup00/LogVol07</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>Any suggessions.</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
<BR><FONT SIZE=3D2>Jason Martin &lt;jhmartin@toger.us&gt;</FONT>
<BR><FONT SIZE=3D2>Sent by: linux-lvm-bounces@redhat.com</FONT>
<BR><FONT SIZE=3D2>12/15/2004 10:15 AM PST</FONT>
<BR><FONT SIZE=3D2>Please respond to LVM general discussion and =
development</FONT>
</P>

<P><FONT SIZE=3D2>To: linux-lvm@redhat.com</FONT>
<BR><FONT SIZE=3D2>cc: </FONT>
<BR><FONT SIZE=3D2>bcc: </FONT>
<BR><FONT SIZE=3D2>Subject: Re: [linux-lvm] How to increase/decrease =
space</FONT>
<BR><FONT SIZE=3D2>&nbsp;</FONT>
</P>
<BR>
<BR>

<P><FONT SIZE=3D2>On Wed, Dec 15, 2004 at 12:11:30PM -0600, =
AdabalaP@schneider.com wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; (1) Added more space (350 meg) to /usr using =
the command &quot;lvresize</FONT>
<BR><FONT SIZE=3D2>-L+350&quot;.</FONT>
<BR><FONT SIZE=3D2>&gt; When i display the volume group using =
&quot;lvdisplay&quot; it shows 2.3 gb, But</FONT>
<BR><FONT SIZE=3D2>when</FONT>
<BR><FONT SIZE=3D2>&gt; i use &quot;df -m&quot; it is still at 1.9 gb =
and 92% used state.</FONT>
<BR><FONT SIZE=3D2>You've resized the volume but not the filesystem =
sitting on top</FONT>
<BR><FONT SIZE=3D2>of it. Some filesystems can be resized online while =
others must</FONT>
<BR><FONT SIZE=3D2>be unmounted. Some may not be resizable at =
all.</FONT>
</P>

<P><FONT SIZE=3D2>See <A =
HREF=3D"http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html" =
TARGET=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html</A></FON=
T>
<BR><FONT SIZE=3D2>&lt;<A =
HREF=3D"http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html" =
TARGET=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html</A>&gt; =
.</FONT>
</P>

<P><FONT SIZE=3D2>-Jason Martin</FONT>
<BR><FONT SIZE=3D2>--</FONT>
<BR><FONT SIZE=3D2>This message is PGP/MIME signed.</FONT>
</P>

<P><FONT =
SIZE=3D2>_______________________________________________</FONT>
<BR><FONT SIZE=3D2>linux-lvm mailing list</FONT>
<BR><FONT SIZE=3D2>linux-lvm@redhat.com</FONT>
<BR><FONT SIZE=3D2><A =
HREF=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" =
TARGET=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</A><=
/FONT>
<BR><FONT SIZE=3D2>&lt;<A =
HREF=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" =
TARGET=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</A>&=
gt; </FONT>
<BR><FONT SIZE=3D2>read the LVM HOW-TO at <A =
HREF=3D"http://tldp.org/HOWTO/LVM-HOWTO/" =
TARGET=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</A></FONT>
<BR><FONT SIZE=3D2>&lt;<A HREF=3D"http://tldp.org/HOWTO/LVM-HOWTO/" =
TARGET=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</A>&gt; </FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;&lt;&lt;C.DTF&gt;&gt;&nbsp; =
&lt;&lt;ATT190653.txt&gt;&gt; </FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C4E31B.88A91120--

Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l154uRUu011310
	for <linux-lvm@redhat.com>; Sun, 4 Feb 2007 23:56:27 -0500
Received: from mtao04.charter.net (mtao04.charter.net [209.225.8.178])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l154uQUT007467
	for <linux-lvm@redhat.com>; Sun, 4 Feb 2007 23:56:26 -0500
Received: from aa08.charter.net ([10.20.200.160]) by mtao04.charter.net
	(InterMail vM.6.01.06.03 201-2131-130-104-20060516) with ESMTP
	id <20070205045617.PQYD26114.mtao04.charter.net@aa08.charter.net>
	for <linux-lvm@redhat.com>; Sun, 4 Feb 2007 23:56:17 -0500
Received: from C35DCM01 ([68.189.135.84]) by aa08.charter.net with SMTP
	id <20070205045614.URVL1265.aa08.charter.net@C35DCM01>
	for <linux-lvm@redhat.com>; Sun, 4 Feb 2007 23:56:14 -0500
Mime-Version: 1.0
Date: 4 Feb 2007 20:54:28 -0800
References: <1170433559.18411.9.camel@beethoven.hq.office.ziprealty.com>
In-Reply-To: <1170433559.18411.9.camel@beethoven.hq.office.ziprealty.com>
Message-ID: <45C64802.80BB.0099.0@charter.net>
From: "Dwight Morgan" <dwightbulk@charter.net>
Subject: Re: [linux-lvm] LVM changing bios from legacy/IDE to AHCI/Sata
Content-Type: multipart/alternative; boundary="____VUKHQDNCIQOEHZTMBLLO____"
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--____VUKHQDNCIQOEHZTMBLLO____
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline; modification-date="Mon, 4 Feb 2007 12:54:31 -0800"

That took care of it.=20
Thanks much!

-Dwight

>>> On 2/2/2007 at 8:25 AM, in message <1170433559.18411.9.camel@beethoven.=
hq.office.ziprealty.com>, Michael Davis<mdavis@ziprealty.com> wrote:

I just ran into this problem.  After trying a whole bunch of things
(including importing/exporting) that didn't work, it turns out that all
it took was adding the ahci driver to the initrd image (mkinitrd
--preload ahci).

  Michael




On Fri, 2007-02-02 at 07:43 -0800, Dwight Morgan wrote:
> HTML document attachment (Text.htm)
> I am running LVM on FC6 2.6.19 and would like to switch over from
> Legacy/IDE in the intel 965 bios to AHCI/SATA.  Of course, as soon as
> I change the bios setting fedora won't boot as it can't find any
> volumes.  I can see how to export the LVM settings, change the text
> file from hda1 to sda1, and restore it.  But I figure the odds of me
> screwing this up are good, and I don't see a good recovery method.
> =20
> Any help on process/recovery?
> =20
> Thanks,
> -Dwight
> =20
> PS.  Same drive, nothing changing other than a bios setting.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--____VUKHQDNCIQOEHZTMBLLO____
Content-Type: multipart/related; boundary="____HSZEYTESRZRVLJJVHHDB____"


--____HSZEYTESRZRVLJJVHHDB____
Content-Type: text/html; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline; filename="Text.htm"; modification-date="Mon, 4
	Feb 2007 12:54:31 -0800"

<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Diso-8859-15=
">
<META content=3D"MSHTML 6.00.2900.3020" name=3DGENERATOR></HEAD>
<BODY style=3D"MARGIN: 4px 4px 1px; FONT: 10pt Tahoma">
<DIV>That took care of it.&nbsp;</DIV>
<DIV>Thanks much!</DIV>
<DIV>&nbsp;</DIV>
<DIV>-Dwight<BR><BR>&gt;&gt;&gt; On 2/2/2007 at 8:25 AM, in message =
&lt;1170433559.18411.9.camel@beethoven.hq.office.ziprealty.com&gt;, =
Michael Davis&lt;mdavis@ziprealty.com&gt; wrote:<BR></DIV>
<DIV style=3D"PADDING-LEFT: 7px; MARGIN: 0px 0px 0px 15px; BORDER-LEFT: =
#050505 1px solid; BACKGROUND-COLOR: #f3f3f3">I just ran into this =
problem.&nbsp; After trying a whole bunch of things<BR>(including =
importing/exporting) that didn't work, it turns out that all<BR>it took =
was adding the ahci driver to the initrd image (mkinitrd<BR>--preload =
ahci).<BR><BR>&nbsp; Michael<BR><BR><BR><BR><BR>On Fri, 2007-02-02 at =
07:43 -0800, Dwight Morgan wrote:<BR>&gt; HTML document attachment =
(Text.htm)<BR>&gt; I am running LVM on FC6 2.6.19 and would like to switch =
over from<BR>&gt; Legacy/IDE in the intel 965 bios to AHCI/SATA.&nbsp; Of =
course, as soon as<BR>&gt; I change the bios setting fedora won't boot as =
it can't find any<BR>&gt; volumes.&nbsp; I can see how to export the LVM =
settings, change the text<BR>&gt; file from hda1 to sda1, and restore =
it.&nbsp; But I figure the odds of me<BR>&gt; screwing this up are good, =
and I don't see a good recovery method.<BR>&gt;&nbsp; <BR>&gt; Any help on =
process/recovery?<BR>&gt;&nbsp; <BR>&gt; Thanks,<BR>&gt; -Dwight<BR>&gt;&nb=
sp; <BR>&gt; PS.&nbsp; Same drive, nothing changing other than a bios =
setting.<BR>&gt; _______________________________________________<BR>&gt; =
linux-lvm mailing list<BR>&gt; linux-lvm@redhat.com<BR>&gt; <A href=3D"http=
s://www.redhat.com/mailman/listinfo/linux">https://www.redhat.com/mailman/l=
istinfo/linux</A>-lvm<BR>&gt; read the LVM HOW-TO at <A href=3D"http://tldp=
.org/HOWTO/LVM">http://tldp.org/HOWTO/LVM</A>-HOWTO/<BR><BR>_______________=
________________________________<BR>linux-lvm mailing list<BR>linux-lvm@red=
hat.com<BR><A href=3D"https://www.redhat.com/mailman/listinfo/linux">https:=
//www.redhat.com/mailman/listinfo/linux</A>-lvm<BR>read the LVM HOW-TO at =
<A href=3D"http://tldp.org/HOWTO/LVM">http://tldp.org/HOWTO/LVM</A>-HOWTO/<=
BR></DIV></BODY></HTML>
--____HSZEYTESRZRVLJJVHHDB____--

--____VUKHQDNCIQOEHZTMBLLO____--

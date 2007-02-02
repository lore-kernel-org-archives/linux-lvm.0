Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l12HHB88008803
	for <linux-lvm@redhat.com>; Fri, 2 Feb 2007 12:17:11 -0500
Received: from ahlnx01.ah.org (host67.ah.org [66.60.186.67])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l12HH6Qc030954
	for <linux-lvm@redhat.com>; Fri, 2 Feb 2007 12:17:06 -0500
Received: from [10.35.1.204] (helo=C35ISD02)
	by ahlnx01.ah.org with smtp (Exim 4.50) id 1HD220-0002b6-2U
	for linux-lvm@redhat.com; Fri, 02 Feb 2007 09:17:00 -0800
Mime-Version: 1.0
Date: Fri, 2 Feb 2007 09:16:12 -0800
References: <1170433559.18411.9.camel@beethoven.hq.office.ziprealty.com>
In-Reply-To: <1170433559.18411.9.camel@beethoven.hq.office.ziprealty.com>
Message-ID: <45C3015C.81EB.0099.0@charter.net>
From: "Dwight Morgan" <dwightbulk@charter.net>
Subject: Re: [linux-lvm] LVM changing bios from legacy/IDE to AHCI/Sata
Content-Type: multipart/alternative; boundary="____AHXIZIYXHTPUQYTFQQUF____"
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


--____AHXIZIYXHTPUQYTFQQUF____
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline; modification-date="Sat, 2 Feb 2007 01:16:12 -0800"

Thanks!  I am not familiar with the details of that command, so I will do =
some digging and ask more questions if needed.

Thanks for the response!

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
--____AHXIZIYXHTPUQYTFQQUF____
Content-Type: multipart/related; boundary="____LLQGIZOZFJJSKZDSBMFM____"


--____LLQGIZOZFJJSKZDSBMFM____
Content-Type: text/html; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline; filename="Text.htm"; modification-date="Sat, 2
	Feb 2007 01:16:12 -0800"

<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Diso-8859-15=
">
<META content=3D"MSHTML 6.00.2900.3020" name=3DGENERATOR></HEAD>
<BODY style=3D"MARGIN: 4px 4px 1px; FONT: 10pt Tahoma">
<DIV>Thanks!&nbsp; I am not familiar with the details of that command, so =
I will do some digging and ask more questions if needed.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks for the response!</DIV>
<DIV>&nbsp;</DIV>
<DIV>-Dwight</DIV>
<DIV><BR>&gt;&gt;&gt; On 2/2/2007 at 8:25 AM, in message &lt;1170433559.184=
11.9.camel@beethoven.hq.office.ziprealty.com&gt;, Michael Davis&lt;mdavis@z=
iprealty.com&gt; wrote:<BR></DIV>
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
--____LLQGIZOZFJJSKZDSBMFM____--

--____AHXIZIYXHTPUQYTFQQUF____--

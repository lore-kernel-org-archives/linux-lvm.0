Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mATNlDqV023469
	for <linux-lvm@redhat.com>; Sat, 29 Nov 2008 18:47:13 -0500
Received: from web38307.mail.mud.yahoo.com (web38307.mail.mud.yahoo.com
	[209.191.125.23])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id mATNkvc7018007
	for <linux-lvm@redhat.com>; Sat, 29 Nov 2008 18:46:57 -0500
Date: Sat, 29 Nov 2008 15:46:56 -0800 (PST)
From: Michael Jensen <beachhangar@yahoo.com>
Subject: Re: [linux-lvm] building debug versions of lvm cli utilities
In-Reply-To: <C89D31C0-CD20-463C-B4D8-F9D6E1C0320B@souja.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-477399854-1228002416=:50560"
Message-ID: <144501.50560.qm@web38307.mail.mud.yahoo.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0-477399854-1228002416=:50560
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Very helpful - thanks Jason
=A0
Not trying to kill any bugs, just want to follow the activites of utilities=
 like pvscan and pvdisplay and display variable contents at certain points =
in the programs execution.=A0=20
=A0
Trying to get a clone (storage created)=A0of a LVM mounted volume (producti=
on - can't dismount) to be recognized as a different PV.=A0 It doesn't appe=
ar that I can use the existing utilities to change the uuid and VG name, et=
c as long as another instance of that volume is known and mounted by LVM.=
=A0 If its possible to do this on the same system while the original remain=
s mounted - that would be a great solution.
=A0
Thinking that I can programatically edit the uuid and names and then run a =
pvscan and have it picked up by LVM.
=A0


--- On Sat, 11/29/08, Jayson Vantuyl <kagato@souja.net> wrote:

From: Jayson Vantuyl <kagato@souja.net>
Subject: Re: [linux-lvm] building debug versions of lvm cli utilities
To: beachhangar@yahoo.com, "LVM general discussion and development" <linux-=
lvm@redhat.com>
Date: Saturday, November 29, 2008, 6:55 AM


The utilities run in userspace. =A0They communicate with devicemapper, whic=
h does all of the kernelspace heavy-lifting.


I've generally found that I can track down a lot of issues with strace as w=
ell, if you're just looking to see what they do to the system (i.e. if you'=
re not adding functionality or hunting a really deep bug).



On Nov 28, 2008, at 3:42 PM, Michael Jensen wrote:






I would like to know what the general procedure would be to create gdb (deb=
ug) versions of several LVM utilities - pvscan, pvdisplay.
=A0
I am using RH 4.7 and have the sources.
=A0
Can I use the kernel based on the distributed binaries?
=A0
compile=A0the sources and do a make with the appropriate options?
=A0
Then invoke the debug version of the utility with a dbg command?
=A0
=A0
Not sure if the utilities run in user or kernel space ?
=A0
Thanks,
Mike
=A0
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



--=A0
Jayson Vantuyl
kagato@souja.net



=0A=0A=0A      
--0-477399854-1228002416=:50560
Content-Type: text/html; charset=us-ascii

<table cellspacing="0" cellpadding="0" border="0" ><tr><td valign="top" style="font: inherit;"><DIV>Very helpful - thanks Jason</DIV>
<DIV>&nbsp;</DIV>
<DIV>Not trying to kill any bugs, just want to follow the activites of utilities like pvscan and pvdisplay and display variable contents at certain points in the programs execution.&nbsp; </DIV>
<DIV>&nbsp;</DIV>
<DIV>Trying to get a clone (storage created)&nbsp;of a LVM mounted volume (production - can't dismount) to be recognized as a different PV.&nbsp; It doesn't appear that I can use the existing utilities to change the uuid and VG name, etc as long as another instance of that volume is known and mounted by LVM.&nbsp; If its possible to do this on the same system while the original remains mounted - that would be a great solution.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thinking that I can programatically edit the uuid and names and then run a pvscan and have it picked up by LVM.</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR><BR>--- On <B>Sat, 11/29/08, Jayson Vantuyl <I>&lt;kagato@souja.net&gt;</I></B> wrote:<BR></DIV>
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: rgb(16,16,255) 2px solid">From: Jayson Vantuyl &lt;kagato@souja.net&gt;<BR>Subject: Re: [linux-lvm] building debug versions of lvm cli utilities<BR>To: beachhangar@yahoo.com, "LVM general discussion and development" &lt;linux-lvm@redhat.com&gt;<BR>Date: Saturday, November 29, 2008, 6:55 AM<BR><BR>
<DIV id=yiv1894261325>The utilities run in userspace. &nbsp;They communicate with devicemapper, which does all of the kernelspace heavy-lifting.
<DIV><BR></DIV>
<DIV>I've generally found that I can track down a lot of issues with strace as well, if you're just looking to see what they do to the system (i.e. if you're not adding functionality or hunting a really deep bug).</DIV>
<DIV><BR>
<DIV>
<DIV>On Nov 28, 2008, at 3:42 PM, Michael Jensen wrote:</DIV><BR class=Apple-interchange-newline>
<BLOCKQUOTE type="cite">
<TABLE cellSpacing=0 cellPadding=0 border=0>
<TBODY>
<TR>
<TD vAlign=top>
<DIV>I would like to know what the general procedure would be to create gdb (debug) versions of several LVM utilities - pvscan, pvdisplay.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I am using RH 4.7 and have the sources.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Can I use the kernel based on the distributed binaries?</DIV>
<DIV>&nbsp;</DIV>
<DIV>compile&nbsp;the sources and do a make with the appropriate options?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Then invoke the debug version of the utility with a dbg command?</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Not sure if the utilities run in user or kernel space ?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks,</DIV>
<DIV>Mike</DIV>
<DIV>&nbsp;</DIV></TD></TR></TBODY></TABLE><BR>_______________________________________________<BR>linux-lvm mailing list<BR><A href="mailto:linux-lvm@redhat.com" target=_blank rel=nofollow>linux-lvm@redhat.com</A><BR>https://www.redhat.com/mailman/listinfo/linux-lvm<BR>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</BLOCKQUOTE></DIV></DIV><BR>
<DIV><SPAN class=Apple-style-span style="WORD-SPACING: 0px; FONT: 12px Helvetica; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; border-spacing: 0px 0px; orphans: 2; widows: 2">
<DIV style="WORD-WRAP: break-word"><SPAN class=Apple-style-span style="WORD-SPACING: 0px; FONT: 12px Helvetica; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; border-spacing: 0px 0px; orphans: 2; widows: 2">
<DIV>--&nbsp;</DIV>
<DIV>Jayson Vantuyl</DIV>
<DIV><A href="mailto:kagato@souja.net" target=_blank rel=nofollow>kagato@souja.net</A></DIV>
<DIV><BR class=khtml-block-placeholder></DIV><BR class=Apple-interchange-newline></SPAN></DIV></SPAN></DIV><BR></DIV></BLOCKQUOTE></td></tr></table><br>



      
--0-477399854-1228002416=:50560--

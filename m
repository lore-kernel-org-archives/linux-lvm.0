Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB95ubBs029830
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 00:56:37 -0500
Received: from web38302.mail.mud.yahoo.com (web38302.mail.mud.yahoo.com
	[209.191.125.18])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id mB95uKAM012399
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 00:56:20 -0500
Date: Mon, 8 Dec 2008 21:56:20 -0800 (PST)
From: Michael Jensen <beachhangar@yahoo.com>
Subject: Re: [linux-lvm] lvm utilities, metadata format, CRC (checksum)
In-Reply-To: <20081206020138.GE26097@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-382756358-1228802180=:40587"
Message-ID: <173432.40587.qm@web38302.mail.mud.yahoo.com>
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

--0-382756358-1228802180=:40587
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

=A0
Below is a "cleaned up" version of the posting from Nov 2007 to clone a vol=
ume group.
Did I correctly interpret the instructions/text??
=A0
=A0
From: Alasdair G Kergon <agk redhat com>=20
To: LVM general discussion and development <linux-lvm redhat com>=20
Subject: Re: [linux-lvm] Steps to "clone" a volume group=20
Date: Thu, 22 Nov 2007 16:05:40 +0000=20
---------------------------------------------------------------------------=
-----
=A0

> 1. For each original PV, create a filter entry in /etc/lvm/lvm.conf to
> temporarily mask the PV from the LVM tools.

> 2. Create a temporary alternative lvm system directory holding=20
> a copy of lvm.conf that has filters to accept only
> the new copies of the PVs and set LVM_SYSTEM_DIR to use it.
> 3. Create the cloned PV(s)
> 4. Modify the cloned volume group name, ID and physical volume IDs to
> avoid name and UUID clashes between the original and cloned devices:
(with LVM_SYSTEM_DIR set)
=A0
> 5. Remove filtering rules & verify both VGs co-exist correctly
> 6. discard LVM_SYSTEM_DIR env var & directory

--- On Fri, 12/5/08, Alasdair G Kergon <agk@redhat.com> wrote:

From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm utilities, metadata format, CRC (checksum)
To: "Michael Jensen" <beachhangar@yahoo.com>
Cc: linux-lvm@redhat.com
Date: Friday, December 5, 2008, 6:01 PM

On Fri, Dec 05, 2008 at 04:07:30PM -0800, Michael Jensen wrote:
> - what is the best tool to use to search all the archive files?

Google.

> - what sequence are you suggesting with the tools that will avoid the
duplicate found??
 =A0
You're doing nothing new here - read the archives.

Alasdair
--=20
agk@redhat.com

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
=0A=0A=0A      
--0-382756358-1228802180=:40587
Content-Type: text/html; charset=us-ascii

<table cellspacing="0" cellpadding="0" border="0" ><tr><td valign="top" style="font: inherit;"><DIV>&nbsp;</DIV>
<DIV>Below is a "cleaned up" version of the posting from Nov 2007 to clone a volume group.</DIV>
<DIV>Did I correctly interpret the instructions/text??</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>From: Alasdair G Kergon &lt;agk redhat com&gt; <BR>To: LVM general discussion and development &lt;linux-lvm redhat com&gt; <BR>Subject: Re: [linux-lvm] Steps to "clone" a volume group <BR>Date: Thu, 22 Nov 2007 16:05:40 +0000 </DIV>
<DIV>--------------------------------------------------------------------------------</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>&gt; 1. For each original PV, create a filter entry in /etc/lvm/lvm.conf to<BR>&gt; temporarily mask the PV from the LVM tools.</DIV>
<DIV><BR>&gt; 2. Create a temporary alternative lvm system directory holding <BR>&gt; a copy of lvm.conf that has filters to accept only<BR>&gt; the new copies of the PVs and set LVM_SYSTEM_DIR to use it.</DIV>
<DIV>&gt; 3. Create the cloned PV(s)</DIV>
<DIV>&gt; 4. Modify the cloned volume group name, ID and physical volume IDs to<BR>&gt; avoid name and UUID clashes between the original and cloned devices:</DIV>
<DIV>(with LVM_SYSTEM_DIR set)<BR>&nbsp;<BR>&gt; 5. Remove filtering rules &amp; verify both VGs co-exist correctly</DIV>
<DIV>&gt; 6. discard LVM_SYSTEM_DIR env var &amp; directory<BR><BR>--- On <B>Fri, 12/5/08, Alasdair G Kergon <I>&lt;agk@redhat.com&gt;</I></B> wrote:<BR></DIV>
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: rgb(16,16,255) 2px solid">From: Alasdair G Kergon &lt;agk@redhat.com&gt;<BR>Subject: Re: [linux-lvm] lvm utilities, metadata format, CRC (checksum)<BR>To: "Michael Jensen" &lt;beachhangar@yahoo.com&gt;<BR>Cc: linux-lvm@redhat.com<BR>Date: Friday, December 5, 2008, 6:01 PM<BR><BR><PRE>On Fri, Dec 05, 2008 at 04:07:30PM -0800, Michael Jensen wrote:
&gt; - what is the best tool to use to search all the archive files?

Google.

&gt; - what sequence are you suggesting with the tools that will avoid the
duplicate found??
 &nbsp;
You're doing nothing new here - read the archives.

Alasdair
-- 
agk@redhat.com

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
</PRE></BLOCKQUOTE></td></tr></table><br>



      
--0-382756358-1228802180=:40587--

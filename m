Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJ9ntr29462
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 04:49:55 -0500
Received: from jinx.stc.ricplc.com (smtp.ricardo.co.uk [195.162.98.110])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAJ9noN2028331
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 04:49:51 -0500
From: "Gary Mansell" <Gary.Mansell@ricardo.com>
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
	boundary="=-2GtMXERp/22BELrP8vyS"
Message-ID: <1100857645.13422.99.camel@grma-lap>
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 19 Nov 2004 09:47:25 +0000
Subject: [linux-lvm] HA Fileserver configuration recommendation sought.
Reply-To: Gary.Mansell@ricardo.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

--=-2GtMXERp/22BELrP8vyS
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear all,

I currently run RHAS3.0 on a Dell PE2650 which is directly attached to
an EMC FC4500 2TB HW RAID 5 unit via two QLA2310F Fibre Channel cards. I
have EMC's Powerpath software installed to give me multiple paths to the
disk subsytem in case of controller or cable failure.=20

This configuration has served me well but is now about to be End Of
Life'd by Dell and I need to grow the storage. There is obviously quite
a price premium to pay for this sort of kit so I was hoping to find a
cheaper solution for the future.

I have seen the Nexsan ATABEAST which is a 16TB ATA array with dual
fibre channel controllers. It seems to be well liked and is reasonably
priced but my concern is how to achieve multiple paths to the disk. How
would you recommend achieving a highly available configuration with this
sort of disk subsystem?

Also, am I correct in thinking that the maximum filesystem size with
RHEL 3.0 is 2TB? Is it possible to get over this limitation with LVM or
some other method?

Any advice gladly received.

Thanks in advance

Gary Mansell
--=20

This e-mail and any files transmitted with it are confidential and =
intended
solely for the use of the individual or entity to whom they are =
addressed.
If you have received this e-mail in error please notify the sender =
immediately
and delete this e-mail from your system.  Please note that any views or =
opinions
presented in this e-mail are solely those of the author and do not =
necessarily
represent those of Ricardo (save for reports and other documentation =
formally
approved and signed for release to the intended recipient).  Only =
Directors
or Duly Authorised Officers are authorised to enter into legally binding
obligations on behalf of Ricardo unless the obligation is contained =
within
a Ricardo Purchase Order.

Ricardo may monitor outgoing and incoming e-mails and other =
telecommunications
on its e-mail and telecommunications systems.  By replying to this =
e-mail you
give consent to such monitoring.  The recipient should check this e-mail =
and
any attachments for the presence of viruses.  Ricardo accepts no =
liability for
any damage caused by any virus transmitted by this e-mail.  "Ricardo" =
means
Ricardo plc and its subsidiary companies.

Ricardo plc is a public limited company registered in England with =
registered
number 00222915.
The registered office of Ricardo plc is Bridge Works, Shoreham-by Sea,
West Sussex, BN43 5FG.
=20

--=-2GtMXERp/22BELrP8vyS
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset="utf-8"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
CHARSET=3DUTF-8">
  <META NAME=3D"GENERATOR" CONTENT=3D"GtkHTML/3.0.9">
</HEAD>
<BODY>
Dear all,<BR>
<BR>
I currently run RHAS3.0 on a Dell PE2650 which is directly attached to =
an EMC FC4500 2TB HW RAID 5 unit via two QLA2310F Fibre Channel cards. I =
have EMC's Powerpath software installed to give me multiple paths to the =
disk subsytem in case of controller or cable failure. <BR>
<BR>
This configuration has served me well but is now about to be End Of =
Life'd by Dell and I need to grow the storage. There is obviously quite =
a price premium to pay for this sort of kit so I was hoping to find a =
cheaper solution for the future.<BR>
<BR>
I have seen the Nexsan ATABEAST which is a 16TB ATA array with dual =
fibre channel controllers. It seems to be well liked and is reasonably =
priced but my concern is how to achieve multiple paths to the disk. How =
would you recommend achieving a highly available configuration with this =
sort of disk subsystem?<BR>
<BR>
Also, am I correct in thinking that the maximum filesystem size with =
RHEL 3.0 is 2TB? Is it possible to get over this limitation with LVM or =
some other method?<BR>
<BR>
Any advice gladly received.<BR>
<BR>
Thanks in advance<BR>
<BR>
Gary Mansell
--  <BR>
<BR>=20
<font size=3D1 font face=3D"arial" color=3Dnavy>This e-mail and any =
files transmitted with it are confidential and intended solely for the =
use of the individual or entity to=20

whom they are addressed.<BR>
If you have received this e-mail in error please notify the sender =
immediately and delete this e-mail from your system.  Please note that =
any views<BR>
or opinions presented in this e-mail are solely those of the author and =
do not necessarily represent those of Ricardo (save for reports and =
other<BR>
documentation formally approved and signed for release to the intended =
recipient).  Only Directors or Duly Authorised Officers are authorised =
to <BR>
enter into legally binding obligations on behalf of Ricardo unless the =
obligation is contained within a Ricardo Purchase Order.<BR>
<BR>
Ricardo may monitor outgoing and incoming e-mails and other =
telecommunications on its e-mail and telecommunications systems.  By =
replying to<BR>
this e-mail you give consent to such monitoring.  The recipient should =
check e-mail and any attachments for the presence of viruses.  Ricardo =
<BR>
accepts no liability for any damage caused by any virus transmitted by =
this e-mail.  "Ricardo" means Ricardo plc and its subsidiary =
companies.<BR>
<BR>
Ricardo plc is a public limited company registered in England with =
registered number 00222915.<BR>
The registered office of Ricardo plc is Bridge Works,Shoreham-by Sea, =
West Sussex, BN43 5FG.</font><BR>

</BODY>
</HTML>

--=-2GtMXERp/22BELrP8vyS--

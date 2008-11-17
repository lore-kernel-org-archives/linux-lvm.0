Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAHMwXgg026157
	for <linux-lvm@redhat.com>; Mon, 17 Nov 2008 17:58:33 -0500
Received: from web38304.mail.mud.yahoo.com (web38304.mail.mud.yahoo.com
	[209.191.125.20])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id mAHMwGvt031149
	for <linux-lvm@redhat.com>; Mon, 17 Nov 2008 17:58:16 -0500
References: <878853.96084.qm@web38301.mail.mud.yahoo.com>
	<20081115025515.GX30569@agk.fab.redhat.com>
Date: Mon, 17 Nov 2008 14:58:15 -0800 (PST)
From: Michael Jensen <beachhangar@yahoo.com>
Subject: Re: [linux-lvm] steps to clone a volume group
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-387316236-1226962695=:66521"
Message-ID: <165789.66521.qm@web38304.mail.mud.yahoo.com>
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

--0-387316236-1226962695=:66521
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

The information shown from a nov 2007 post has been very useful - much appr=
eciated.=0A=0AThere are some circumstances with the case I am working on th=
at complicates the process a bit.=0A=0AAfter having removed the master volu=
me from the host and presenting just a snapshot, I have been able to=A0chan=
ge the physical uuid, and rename the volume group.=A0If I then re-introduce=
 the master volume there is no conflict (no-duplicates) found by the lvm ut=
ilities and can mount both sucessfully.=0A=0AThe constraints I am operating=
 under require the master volume not to disappear - i.e.=A0production syste=
m and volume.=0A=0AIf I filter out the snapshot and leave the accept (a) po=
rtion - "a|.*|" in the filter line, then a conflict is reported by pvscan, =
but not between sda and sdb but between sdb and the device-mapper string th=
at appears to use the FC WWN.=A0 =0AIf I remove the accept portion then the=
re is no conflict during pvscan.=A0 =0AIf I attempt to do a --=0Apvchange -=
-uuid /dev/sda=0AFailed to read physical volume /dev/sda=0A0 physical volum=
es changed / 0 physical volumes not changed=0A=0AIs the filtered out device=
 name (/dev/sda) supposed to be available to the lvm utilities?=0A=0Athanks=
,=0Amike=0A=0A=0A=0A=0A________________________________=0AFrom: Alasdair G =
Kergon <agk@redhat.com>=0ATo: LVM general discussion and development <linux=
-lvm@redhat.com>=0ASent: Friday, November 14, 2008 6:55:15 PM=0ASubject: Re=
: [linux-lvm] Editing LVM 2 metadata=0A=0AOn Fri, Nov 14, 2008 at 06:37:51P=
M -0800, Michael Jensen wrote:=0A> I have a need to edit the metadata on an=
 LVM2 PV.=0A=0AWhy?=0A=0AIf you really have to, please do this using the su=
pplied tools - it's *much*=0Aeasier!=0A=0Avgcfgbackup gives you a text file=
, edit it, vgcfgrestore puts it back.=0A=0AIf you need to edit the label to=
o, careful use of pvcreate --restorefile --uuid=0Aplus vgcfgrestore lets yo=
u do that.=0A=0AAlasdair=0A-- =0Aagk@redhat.com=0A=0A______________________=
_________________________=0Alinux-lvm mailing list=0Alinux-lvm@redhat.com=
=0Ahttps://www.redhat.com/mailman/listinfo/linux-lvm=0Aread the LVM HOW-TO =
at http://tldp.org/HOWTO/LVM-HOWTO/=0A=0A=0A=0A      
--0-387316236-1226962695=:66521
Content-Type: text/html; charset=us-ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:times new roman, new york, times, serif;font-size:12pt"><DIV>The information shown from a nov 2007 post has been very useful - much appreciated.</DIV>
<DIV>&nbsp;</DIV>
<DIV>There are some circumstances with the case I am working on that complicates the process a bit.</DIV>
<DIV>&nbsp;</DIV>
<DIV>After having removed the master volume from the host and presenting just a snapshot, I have been able to&nbsp;change the physical uuid, and rename the volume group.&nbsp;If I then re-introduce the master volume there is no conflict (no-duplicates) found by the lvm utilities and can mount both sucessfully.</DIV>
<DIV>&nbsp;</DIV>
<DIV>The constraints I am operating under require the master volume not to disappear - i.e.&nbsp;production system and volume.</DIV>
<DIV>&nbsp;</DIV>
<DIV>If I filter out the snapshot and leave the accept (a) portion - "a|.*|" in the filter line, then a conflict is reported by pvscan, but not between sda and sdb but between sdb and the device-mapper string that appears to use the FC WWN.&nbsp; </DIV>
<DIV>If I remove the accept portion then there is no conflict during pvscan.&nbsp; </DIV>
<DIV>If I attempt to do a --</DIV>
<DIV>pvchange --uuid /dev/sda</DIV>
<DIV>Failed to read physical volume /dev/sda</DIV>
<DIV>0 physical volumes changed / 0 physical volumes not changed</DIV>
<DIV>&nbsp;</DIV>
<DIV>Is the filtered out device name (/dev/sda) supposed to be available to the lvm utilities?</DIV>
<DIV>&nbsp;</DIV>
<DIV>thanks,</DIV>
<DIV>mike<BR></DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif"><BR>
<DIV style="FONT-SIZE: 13px; FONT-FAMILY: arial, helvetica, sans-serif"><FONT face=Tahoma size=2>
<HR SIZE=1>
<B><SPAN style="FONT-WEIGHT: bold">From:</SPAN></B> Alasdair G Kergon &lt;agk@redhat.com&gt;<BR><B><SPAN style="FONT-WEIGHT: bold">To:</SPAN></B> LVM general discussion and development &lt;linux-lvm@redhat.com&gt;<BR><B><SPAN style="FONT-WEIGHT: bold">Sent:</SPAN></B> Friday, November 14, 2008 6:55:15 PM<BR><B><SPAN style="FONT-WEIGHT: bold">Subject:</SPAN></B> Re: [linux-lvm] Editing LVM 2 metadata<BR></FONT><BR>On Fri, Nov 14, 2008 at 06:37:51PM -0800, Michael Jensen wrote:<BR>&gt; I have a need to edit the metadata on an LVM2 PV.<BR><BR>Why?<BR><BR>If you really have to, please do this using the supplied tools - it's *much*<BR>easier!<BR><BR>vgcfgbackup gives you a text file, edit it, vgcfgrestore puts it back.<BR><BR>If you need to edit the label too, careful use of pvcreate --restorefile --uuid<BR>plus vgcfgrestore lets you do that.<BR><BR>Alasdair<BR>-- <BR><A href="mailto:agk@redhat.com"
 ymailto="mailto:agk@redhat.com">agk@redhat.com</A><BR><BR>_______________________________________________<BR>linux-lvm mailing list<BR><A href="mailto:linux-lvm@redhat.com" ymailto="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A><BR><A href="https://www.redhat.com/mailman/listinfo/linux-lvm" target=_blank>https://www.redhat.com/mailman/listinfo/linux-lvm</A><BR>read the LVM HOW-TO at <A href="http://tldp.org/HOWTO/LVM-HOWTO/" target=_blank>http://tldp.org/HOWTO/LVM-HOWTO/</A><BR></DIV></DIV></div><br>

      </body></html>
--0-387316236-1226962695=:66521--

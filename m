Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAF3V4gR011958
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 22:31:05 -0500
Received: from web38304.mail.mud.yahoo.com (web38304.mail.mud.yahoo.com
	[209.191.125.20])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id mAF3UnBj019626
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 22:30:50 -0500
References: <878853.96084.qm@web38301.mail.mud.yahoo.com>
	<20081115025515.GX30569@agk.fab.redhat.com>
Date: Fri, 14 Nov 2008 19:30:49 -0800 (PST)
From: Michael Jensen <beachhangar@yahoo.com>
Subject: Re: [linux-lvm] Editing LVM 2 metadata
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-683645265-1226719849=:64869"
Message-ID: <309738.64869.qm@web38304.mail.mud.yahoo.com>
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

--0-683645265-1226719849=:64869
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

The why is because I am attempting to use storage managed snapshots.=A0 The=
 storage can present the master volume and the snapshot as separate LUN's b=
ut they present identical contents in the header area (first 256 sectors...=
). So the effort is to modify the snapshot (doable with this storage) witho=
ut altering the contents of the master volume.=A0 Hopefully the snapshot wi=
th suitable edits to the UUID's would then pass vgscan test.=0A=0AI am chec=
king the tools now.=A0 One question - do the UUID's employ any sort of hash=
 or check-character scheme to ensure that they haven't been bit-picked or o=
therwise compromised by the storage??=0A=0AThanks,=0AMike=0A=0A=0A=0A=0A___=
_____________________________=0AFrom: Alasdair G Kergon <agk@redhat.com>=0A=
To: LVM general discussion and development <linux-lvm@redhat.com>=0ASent: F=
riday, November 14, 2008 6:55:15 PM=0ASubject: Re: [linux-lvm] Editing LVM =
2 metadata=0A=0AOn Fri, Nov 14, 2008 at 06:37:51PM -0800, Michael Jensen wr=
ote:=0A> I have a need to edit the metadata on an LVM2 PV.=0A=0AWhy?=0A=0AI=
f you really have to, please do this using the supplied tools - it's *much*=
=0Aeasier!=0A=0Avgcfgbackup gives you a text file, edit it, vgcfgrestore pu=
ts it back.=0A=0AIf you need to edit the label too, careful use of pvcreate=
 --restorefile --uuid=0Aplus vgcfgrestore lets you do that.=0A=0AAlasdair=
=0A-- =0Aagk@redhat.com=0A=0A______________________________________________=
_=0Alinux-lvm mailing list=0Alinux-lvm@redhat.com=0Ahttps://www.redhat.com/=
mailman/listinfo/linux-lvm=0Aread the LVM HOW-TO at http://tldp.org/HOWTO/L=
VM-HOWTO/=0A=0A=0A=0A      
--0-683645265-1226719849=:64869
Content-Type: text/html; charset=us-ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:times new roman, new york, times, serif;font-size:12pt"><DIV>The why is because I am attempting to use storage managed snapshots.&nbsp; The storage can present the master volume and the snapshot as separate LUN's but they present identical contents in the header area (first 256 sectors...). So the effort is to modify the snapshot (doable with this storage) without altering the contents of the master volume.&nbsp; Hopefully the snapshot with suitable edits to the UUID's would then pass vgscan test.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I am checking the tools now.&nbsp; One question - do the UUID's employ any sort of hash or check-character scheme to ensure that they haven't been bit-picked or otherwise compromised by the storage??</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks,</DIV>
<DIV>Mike<BR></DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif"><BR>
<DIV style="FONT-SIZE: 13px; FONT-FAMILY: arial, helvetica, sans-serif"><FONT face=Tahoma size=2>
<HR SIZE=1>
<B><SPAN style="FONT-WEIGHT: bold">From:</SPAN></B> Alasdair G Kergon &lt;agk@redhat.com&gt;<BR><B><SPAN style="FONT-WEIGHT: bold">To:</SPAN></B> LVM general discussion and development &lt;linux-lvm@redhat.com&gt;<BR><B><SPAN style="FONT-WEIGHT: bold">Sent:</SPAN></B> Friday, November 14, 2008 6:55:15 PM<BR><B><SPAN style="FONT-WEIGHT: bold">Subject:</SPAN></B> Re: [linux-lvm] Editing LVM 2 metadata<BR></FONT><BR>On Fri, Nov 14, 2008 at 06:37:51PM -0800, Michael Jensen wrote:<BR>&gt; I have a need to edit the metadata on an LVM2 PV.<BR><BR>Why?<BR><BR>If you really have to, please do this using the supplied tools - it's *much*<BR>easier!<BR><BR>vgcfgbackup gives you a text file, edit it, vgcfgrestore puts it back.<BR><BR>If you need to edit the label too, careful use of pvcreate --restorefile --uuid<BR>plus vgcfgrestore lets you do that.<BR><BR>Alasdair<BR>-- <BR><A href="mailto:agk@redhat.com"
 ymailto="mailto:agk@redhat.com">agk@redhat.com</A><BR><BR>_______________________________________________<BR>linux-lvm mailing list<BR><A href="mailto:linux-lvm@redhat.com" ymailto="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A><BR><A href="https://www.redhat.com/mailman/listinfo/linux-lvm" target=_blank>https://www.redhat.com/mailman/listinfo/linux-lvm</A><BR>read the LVM HOW-TO at <A href="http://tldp.org/HOWTO/LVM-HOWTO/" target=_blank>http://tldp.org/HOWTO/LVM-HOWTO/</A><BR></DIV></DIV></div><br>



      </body></html>
--0-683645265-1226719849=:64869--

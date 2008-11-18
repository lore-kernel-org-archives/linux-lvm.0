Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAI07Qrf022134
	for <linux-lvm@redhat.com>; Mon, 17 Nov 2008 19:07:26 -0500
Received: from web38302.mail.mud.yahoo.com (web38302.mail.mud.yahoo.com
	[209.191.125.18])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id mAI06peC024857
	for <linux-lvm@redhat.com>; Mon, 17 Nov 2008 19:06:51 -0500
References: <2142931778.33051391226964463527.JavaMail.root@mail2.its.carleton.edu>
Date: Mon, 17 Nov 2008 16:06:50 -0800 (PST)
From: Michael Jensen <beachhangar@yahoo.com>
Subject: Re: [linux-lvm] steps to clone a volume group
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-583114762-1226966810=:85493"
Message-ID: <121521.85493.qm@web38302.mail.mud.yahoo.com>
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

--0-583114762-1226966810=:85493
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Option 1 we are doing now but trying to avoid due to software license fees,=
 etc.=0A=0Anot a vet yet with linux syntax --=0A=0Atrying item=A02c and sub=
bing host0 for hostN=A0 -- getting --=0Abash: echo: write error: invalid ar=
gument=0A=0Ai'm sure its something very obvious, but not too me...=0A=0AMik=
e=0A=0A=0A=0A=A0=0A=0A=0A=0A________________________________=0AFrom: Rich G=
raves <rgraves@carleton.edu>=0ATo: linux-lvm@redhat.com=0ASent: Monday, Nov=
ember 17, 2008 3:27:43 PM=0ASubject: Re: [linux-lvm] steps to clone a volum=
e group=0A=0AI've had that problem too. Two workarounds. Here's what I usua=
lly do:=0A=0A1a) Map the snapshot LUN to a *different* host than the produc=
tion machine.=0A1b) Change the UUID and VG/LV there.=0A1c) *Then* map the L=
UN to the production machine.=0A=0AAlternatively (untested):=0A=0A2a) servi=
ce haldaemon stop; service multipathd stop; service lvm2-monitor stop (not =
sure which of these is really necessary)=0A2b) Map the snapshot to the prod=
uction server in the SAN.=0A2c) Manually add with echo '- - -' > /sys/class=
/scsi_host/hostN/scan=0A2d) Change UUID and VG/LV.=0A2e) Manually remove wi=
th echo 1 > /sys/block/sdX/device/delete=0A2f) service haldaemon start; ser=
vice multipathd start; service lvm2-monitor start=0A-- =0ARich Graves http:=
//claimid.com/rcgraves=0ACarleton.edu Sr UNIX and Security Admin=0ACMC135: =
507-222-7079 Cell: 952-292-6529=0A=0A______________________________________=
_________=0Alinux-lvm mailing list=0Alinux-lvm@redhat.com=0Ahttps://www.red=
hat.com/mailman/listinfo/linux-lvm=0Aread the LVM HOW-TO at http://tldp.org=
/HOWTO/LVM-HOWTO/=0A=0A=0A=0A      
--0-583114762-1226966810=:85493
Content-Type: text/html; charset=us-ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:times new roman, new york, times, serif;font-size:12pt"><DIV>Option 1 we are doing now but trying to avoid due to software license fees, etc.</DIV>
<DIV>&nbsp;</DIV>
<DIV>not a vet yet with linux syntax --</DIV>
<DIV>&nbsp;</DIV>
<DIV>trying item&nbsp;2c and subbing host0 for hostN&nbsp; -- getting --</DIV>
<DIV>bash: echo: write error: invalid argument</DIV>
<DIV>&nbsp;</DIV>
<DIV>i'm sure its something very obvious, but not too me...</DIV>
<DIV>&nbsp;</DIV>
<DIV>Mike</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>&nbsp;</DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif"><BR>
<DIV style="FONT-SIZE: 13px; FONT-FAMILY: arial, helvetica, sans-serif"><FONT face=Tahoma size=2>
<HR SIZE=1>
<B><SPAN style="FONT-WEIGHT: bold">From:</SPAN></B> Rich Graves &lt;rgraves@carleton.edu&gt;<BR><B><SPAN style="FONT-WEIGHT: bold">To:</SPAN></B> linux-lvm@redhat.com<BR><B><SPAN style="FONT-WEIGHT: bold">Sent:</SPAN></B> Monday, November 17, 2008 3:27:43 PM<BR><B><SPAN style="FONT-WEIGHT: bold">Subject:</SPAN></B> Re: [linux-lvm] steps to clone a volume group<BR></FONT><BR>I've had that problem too. Two workarounds. Here's what I usually do:<BR><BR>1a) Map the snapshot LUN to a *different* host than the production machine.<BR>1b) Change the UUID and VG/LV there.<BR>1c) *Then* map the LUN to the production machine.<BR><BR>Alternatively (untested):<BR><BR>2a) service haldaemon stop; service multipathd stop; service lvm2-monitor stop (not sure which of these is really necessary)<BR>2b) Map the snapshot to the production server in the SAN.<BR>2c) Manually add with echo '- - -' &gt; /sys/class/scsi_host/hostN/scan<BR>2d) Change UUID and VG/LV.<BR>2e)
 Manually remove with echo 1 &gt; /sys/block/sdX/device/delete<BR>2f) service haldaemon start; service multipathd start; service lvm2-monitor start<BR>-- <BR>Rich Graves <A href="http://claimid.com/rcgraves" target=_blank>http://claimid.com/rcgraves</A><BR><A href="http://carleton.edu/" target=_blank>Carleton.edu</A> Sr UNIX and Security Admin<BR>CMC135: 507-222-7079 Cell: 952-292-6529<BR><BR>_______________________________________________<BR>linux-lvm mailing list<BR><A href="mailto:linux-lvm@redhat.com" ymailto="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A><BR><A href="https://www.redhat.com/mailman/listinfo/linux-lvm" target=_blank>https://www.redhat.com/mailman/listinfo/linux-lvm</A><BR>read the LVM HOW-TO at <A href="http://tldp.org/HOWTO/LVM-HOWTO/" target=_blank>http://tldp.org/HOWTO/LVM-HOWTO/</A><BR></DIV></DIV></div><br>

      </body></html>
--0-583114762-1226966810=:85493--

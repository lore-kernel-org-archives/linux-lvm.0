Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBG2Fmr21359
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 21:15:48 -0500
Received: from mr2.schneider.com (mr2.schneider.com [161.222.161.9])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBG2FgP9009148
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 21:15:42 -0500
Received: from mm2.schneider.com (mm2.schneider.com [161.222.1.66])
	by mr2.schneider.com (8.12.10+Sun/8.12.10) with ESMTP id iBG2Fan1019721
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 20:15:37 -0600 (CST)
MIME-Version: 1.0
From: AdabalaP@schneider.com
Subject: Re: [linux-lvm] How to increase/decrease space
Date: Wed, 15 Dec 2004 20:15:29 -0600
Message-ID: <OF72EE980D.CADBBDBB-ON86256F6C.000C6751-86256F6C.000C679F@schneider.com>
Content-Type: multipart/mixed; boundary="=_mixed 000C675586256F6C_="
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

--=_mixed 000C675586256F6C_=
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Content-Type: text/html; charset=UTF-8

<P><BR>&quot;lvextend&quot; &nbsp;did not help. </P><P>&nbsp;</P><P>My file=
 system type is &quot;ext3&quot;.</P><P>&nbsp;</P><P>Here is output:</P><P>=
#df -m</P><P>...</P><P>/dev/mapper/VolGroup00-LogVol04 &nbsp; &nbsp;1985 &n=
bsp; 1728 &nbsp; 156 &nbsp; &nbsp;92% &nbsp; /usr</P><P>...</P><P>&nbsp;</P=
><P>#lvdisplay &nbsp; VolGroup00/LogVol04</P><P>...</P><P>LV Size &nbsp; &n=
bsp;2.45 GB</P><P>...</P><P>&nbsp;</P><P>&nbsp;</P><P>I did the following o=
n /opt file system for testing, the results were the same the filesystem di=
d not get increased.</P><P>&nbsp;</P><P>#umount /opt</P><P>#lvresize &nbsp;=
-L +64 VolGroup00/LogVol07</P><P>#lvextend -L +64 VolGroup00/LogVol07</P><P=
>&nbsp;</P><P>Any suggessions.</P><P>&nbsp;</P><P>&nbsp;</P><P>&nbsp;</P><P=
>&nbsp;<BR><FONT SIZE=3D2 STYLE=3Dfont-size:9pt><B>Jason Martin &lt;jhmarti=
n@toger.us&gt;</B></FONT><BR><FONT SIZE=3D2 STYLE=3Dfont-size:9pt>Sent by: =
linux-lvm-bounces@redhat.com</FONT><BR><FONT SIZE=3D2 STYLE=3Dfont-size:9pt=
>12/15/2004 10:15 AM PST</FONT><BR><FONT SIZE=3D2 STYLE=3Dfont-size:9pt>Ple=
ase respond to LVM general discussion and development</FONT><BR><BR> <FONT =
SIZE=3D2 STYLE=3Dfont-size:9pt>To:</FONT> <FONT SIZE=3D2 STYLE=3Dfont-size:=
9pt>linux-lvm@redhat.com</FONT><BR> <FONT SIZE=3D2 STYLE=3Dfont-size:9pt>cc=
:</FONT> <BR> <FONT SIZE=3D2 STYLE=3Dfont-size:9pt>bcc:</FONT> <BR> <FONT S=
IZE=3D2 STYLE=3Dfont-size:9pt>Subject:</FONT> <FONT SIZE=3D2 STYLE=3Dfont-s=
ize:9pt>Re: [linux-lvm] How to increase/decrease space</FONT><BR> &nbsp;<BR=
><BR></P><P><FONT FACE=3D"Monospace,Courier">On Wed, Dec 15, 2004 at 12:11:=
30PM -0600, AdabalaP@schneider.com wrote:<BR>&gt; (1) Added more space (350=
 meg) to /usr using the command &quot;lvresize -L+350&quot;.<BR>&gt; When i=
 display the volume group using &quot;lvdisplay&quot; it shows 2.3 gb, But =
when<BR>&gt; i use &quot;df -m&quot; it is still at 1.9 gb and 92% used sta=
te.<BR>You've resized the volume but not the filesystem sitting on top<BR>o=
f it. Some filesystems can be resized online while others must<BR>be unmoun=
ted. Some may not be resizable at all.<BR></FONT><BR><FONT FACE=3D"Monospac=
e,Courier">See <A HREF=3Dhttp://tldp.org/HOWTO/LVM-HOWTO/extendlv.html>http=
://tldp.org/HOWTO/LVM-HOWTO/extendlv.html</A>.<BR></FONT><BR><FONT FACE=3D"=
Monospace,Courier">-Jason Martin<BR>--</FONT><BR><FONT FACE=3D"Monospace,Co=
urier">This message is PGP/MIME signed.</FONT><BR><BR><FONT FACE=3D"Monospa=
ce,Courier">=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F<BR>linux-lvm mailing list<BR>linux-lvm@redhat.com</FONT><BR><FONT FACE=
=3D"Monospace,Courier"><A HREF=3Dhttps://www.redhat.com/mailman/listinfo/li=
nux-lvm>https://www.redhat.com/mailman/listinfo/linux-lvm</A></FONT><BR><FO=
NT FACE=3D"Monospace,Courier">read the LVM HOW-TO at <A HREF=3Dhttp://tldp.=
org/HOWTO/LVM-HOWTO/>http://tldp.org/HOWTO/LVM-HOWTO/</A></FONT></P>
--=_mixed 000C675586256F6C_=
Content-Type: application/octet-stream; name="C.DTF"
Content-Disposition: attachment; filename="C.DTF"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjIuNiAoR05V
L0xpbnV4KQ0KQ29tbWVudDogLS1uby12ZXJib3NlDQoNCmlEOERCUUZCd0g5U2wyT0RXdXFWU0JN
UkFvZmlBSndMQ3oyZjE4c2FzZEZQZWRYOU1ENDFkT0wzSFFDZmZMRC8NCnJPTFVCWVJGVXdjK0NK
bC9XcXQ1bmprPQ0KPTY4aEkNCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ0KDQo=


--=_mixed 000C675586256F6C_=--

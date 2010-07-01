Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o61Iix2P005114
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2010 14:44:59 -0400
Received: from bay0-omc3-s25.bay0.hotmail.com (bay0-omc3-s25.bay0.hotmail.com
	[65.54.190.163])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o61IioZx027956
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2010 14:44:50 -0400
Message-ID: <BAY110-W42C216FF3D206F9F701619BECD0@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_84b680d5-7134-4018-985e-32f213163aa6_"
From: Vickie Troy-McKoy <vtmckoy@hotmail.com>
Date: Thu, 1 Jul 2010 14:44:50 -0400
MIME-Version: 1.0
Subject: [linux-lvm] IPTables - No Route to Host
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--_84b680d5-7134-4018-985e-32f213163aa6_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello All=2C

=20

I received a request to open up a port on a specific host for a repository =
located on a different host.  I am running Red Hat Enterprise Linux Server =
release 5.5 (Tikanga)=2C Kernel Release:  2.6.18-194.3.1.el5.  So=2C I adde=
d the following in iptables:

=20

-A RH-Firewall-1-INPUT -p tcp --dport xxxx -d xxx.xxx.xx.xx -j ACCEPT

I restarted the iptables service.  However=2C when I went to test via telne=
t=2C I received the following:

=20

Trying xxx.xxx.xx.xx...
telnet: connect to address xxx.xxx.xx.xx: No route to host

=20

They're on the same network and I can also ping both addressess successfull=
y.  Does anyone have any ideas why I'm receiving "No route to host"? =20

=20

Thank you=20
=20
 		 	   		 =20
_________________________________________________________________
The New Busy think 9 to 5 is a cute idea. Combine multiple calendars with H=
otmail.=20
http://www.windowslive.com/campaign/thenewbusy?tile=3Dmulticalendar&ocid=3D=
PID28326::T:WLMTAGL:ON:WL:en-US:WM_HMP:042010_5=

--_84b680d5-7134-4018-985e-32f213163aa6_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 10pt=3B
font-family:Verdana
}
--></style>
</head>
<body class=3D'hmmessage'>
Hello All=2C<BR>
&nbsp=3B<BR>
I received a request to open up a&nbsp=3Bport on a specific host for a repo=
sitory located on a different host.&nbsp=3B I&nbsp=3Bam running Red Hat Ent=
erprise Linux Server release 5.5 (Tikanga)=2C Kernel Release:&nbsp=3B 2.6.1=
8-194.3.1.el5.&nbsp=3B So=2C I added the following in iptables:<BR>
&nbsp=3B<BR>
-A RH-Firewall-1-INPUT -p tcp --dport xxxx -d xxx.xxx.xx.xx -j ACCEPT<BR><B=
R>I restarted the iptables service.&nbsp=3B However=2C when I went to test =
via telnet=2C I received the following:<BR>
&nbsp=3B<BR>
Trying xxx.xxx.xx.xx...<BR>telnet: connect to address xxx.xxx.xx.xx: No rou=
te to host<BR>
&nbsp=3B<BR>
They're on the same network and I can also ping both addressess successfull=
y.&nbsp=3B&nbsp=3BDoes anyone have any ideas why I'm receiving "No route to=
 host"?&nbsp=3B <BR>
&nbsp=3B<BR>
Thank you <BR>&nbsp=3B<BR> 		 	   		  <br /><hr />The New Busy think 9 to 5=
 is a cute idea. Combine multiple calendars with Hotmail.  <a href=3D'http:=
//www.windowslive.com/campaign/thenewbusy?tile=3Dmulticalendar&ocid=3DPID28=
326::T:WLMTAGL:ON:WL:en-US:WM_HMP:042010_5' target=3D'_new'>Get busy.</a></=
body>
</html>=

--_84b680d5-7134-4018-985e-32f213163aa6_--

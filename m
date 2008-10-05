Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m95JA9Yr011908
	for <linux-lvm@redhat.com>; Sun, 5 Oct 2008 15:10:09 -0400
Received: from bay0-omc2-s25.bay0.hotmail.com (bay0-omc2-s25.bay0.hotmail.com
	[65.54.246.161])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m95J9uVp008284
	for <linux-lvm@redhat.com>; Sun, 5 Oct 2008 15:09:57 -0400
Message-ID: <BAY111-W46B2F1F16550BBDF7B6293DA3E0@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_6ba496a6-2ade-431b-947c-c6e70f1cccb3_"
From: Robin Thompson <robane00@hotmail.com>
Date: Sun, 5 Oct 2008 20:09:56 +0100
In-Reply-To: <mailman.0.1223142047.24795.linux-lvm@redhat.com>
References: <mailman.0.1223142047.24795.linux-lvm@redhat.com>
MIME-Version: 1.0
Subject: [linux-lvm] Help with LVM reconstruction
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
To: linux-lvm@redhat.com

--_6ba496a6-2ade-431b-947c-c6e70f1cccb3_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi=2C
=20
My system decided that it would set me a new challenge a few days ago - bre=
ak its storage hardware.  Basically=2C I have 4x750gb  connected to an Adap=
tec 2610sa raid card.  Because of 2Tb limit=2C this is configured into 2 RA=
ID 5 arrays - one 2tb and the other 50gb=20
=20
This is presented to my debian system as /dev/sdb and /dev/sdc.   These are=
 combined into LVM volume and thus I have (or had) my 2.1tb volume.
=20
Anyway=2C one drive went=2C and then the power supply decided to fail as we=
ll=2C thereby making the raid card mark another array as failed (interestin=
gly only 1 of the arrays as failed (it was rebuilding at the time of power =
failure)*
=20
In short the data is intact=2C and I have found a program called RAID Recon=
structor that will produce an image file of the RAID 5 arrays. This will be=
 hopefully 2.05tb file.
=20
I've read that I can use losetup and vgscan to create LVM from 2 image file=
s. But i'm unsure of how to proceed with when i have only one file which is=
 combination of both.
=20
Anyone out there any advice or help?
Furthermore the Raid reconstructer has further software that lets me read t=
he resultant image file (technically it can produce a virtual image as well=
) - the windows software states it can read ext2/3 volumes  - but it can't =
find any in this virtual image file. But would this be the case in an image=
 file of 2 PVs of a LVM? But i can visually inspect the data  - the first f=
ew sectors in text produce what seems to be an intact LVM config "text file=
".
=20
* I could still produce a DD image of the 50gb array - but i'm hesitant to =
do this as i'm unsure of the stability of that system.=20
=20
Thanks for your help.  I'm a newbie with LVM=2C but i'm confident with linu=
x in general.=20
=20
=20
_________________________________________________________________
Make a mini you and download it into Windows Live Messenger
http://clk.atdmt.com/UKM/go/111354029/direct/01/=

--_6ba496a6-2ade-431b-947c-c6e70f1cccb3_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style>
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
FONT-SIZE: 10pt=3B
FONT-FAMILY:Tahoma
}
</style>
</head>
<body class=3D'hmmessage'>Hi=2C<BR>
&nbsp=3B<BR>
My system decided that it would set me a new challenge a few days ago - bre=
ak its storage hardware.&nbsp=3B Basically=2C I have 4x750gb&nbsp=3B connec=
ted to an Adaptec 2610sa raid card.&nbsp=3B Because of 2Tb limit=2C this is=
 configured into 2 RAID 5 arrays - one 2tb and the other 50gb <BR>
&nbsp=3B<BR>
This is presented to my debian system as /dev/sdb and /dev/sdc.&nbsp=3B&nbs=
p=3B These are combined into LVM volume and thus I have (or had) my 2.1tb v=
olume.<BR>
&nbsp=3B<BR>
Anyway=2C one drive went=2C and then the power supply decided to fail as we=
ll=2C thereby making the raid card mark another array as failed (interestin=
gly only 1 of the arrays as failed (it was rebuilding at the time of power =
failure)*<BR>
&nbsp=3B<BR>
In short the data is intact=2C and I have found a program called RAID Recon=
structor that will produce an image file of the RAID 5 arrays. This will be=
 hopefully 2.05tb file.<BR>
&nbsp=3B<BR>
I've read that I can use losetup and vgscan to create LVM from 2 image file=
s. But i'm unsure of how to proceed with when i have only one file which is=
 combination of both.<BR>
&nbsp=3B<BR>
Anyone out there any advice or help?<BR><BR>
Furthermore the Raid reconstructer has further software that lets me read t=
he resultant image file (technically it can produce a virtual image as well=
) - the windows software states it can read ext2/3 volumes&nbsp=3B - but it=
 can't find any in this virtual image file. But would this be the case in a=
n image file of 2 PVs of a LVM? But i can visually inspect the data&nbsp=3B=
 - the first few sectors in text produce what seems to be an intact LVM con=
fig "text file".<BR>
&nbsp=3B<BR>
* I could still produce a DD image of the 50gb array - but i'm hesitant to =
do this as i'm unsure of the stability of that system. <BR>
&nbsp=3B<BR>
Thanks for your help.&nbsp=3B I'm a newbie with LVM=2C but i'm confident wi=
th linux in general. <BR>
&nbsp=3B<BR>
&nbsp=3B<BR><br /><hr />Try Facebook in Windows Live Messenger! <a href=3D'=
http://clk.atdmt.com/UKM/go/111354030/direct/01/' target=3D'_new'>Try it No=
w!</a></body>
</html>=

--_6ba496a6-2ade-431b-947c-c6e70f1cccb3_--

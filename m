Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBJALPZD021988
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 05:21:25 -0500
Received: from smtp8-g19.free.fr (smtp8-g19.free.fr [212.27.42.65])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBJAKk9H028397
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 05:20:46 -0500
Received: from smtp8-g19.free.fr (localhost [127.0.0.1])
	by smtp8-g19.free.fr (Postfix) with ESMTP id 8E00517F55F
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 11:20:45 +0100 (CET)
Received: from imp6-g19.free.fr (imp6-g19.free.fr [212.27.42.6])
	by smtp8-g19.free.fr (Postfix) with ESMTP id 8008E17F525
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 11:20:45 +0100 (CET)
Message-ID: <1198059645.4768f07d37201@imp.free.fr>
Date: Wed, 19 Dec 2007 11:20:45 +0100
From: Georges Giralt <georges.giralt@free.fr>
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM
References: <1197988092.29413.77.camel@veri.phy.umist.ac.uk>
	<7C6C00FDABF70949A0A5D4DD8A4DC2170474A353@CORPUSMX20A.corp.emc.com>
	<1198010286.6637.10.camel@amd64.local>
	<7C6C00FDABF70949A0A5D4DD8A4DC2170474A356@CORPUSMX20A.corp.emc.com>
	<1198058368.3859.10.camel@amd64.local>
In-Reply-To: <1198058368.3859.10.camel@amd64.local>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Selon cs <cs@networkingnewsletter.org.uk>:

> On Tue, 2007-12-18 at 16:52 -0500, pham_cuong@emc.com wrote:
> > There is a difference between changing the boot order from the BIOS vs.
> > [physically] removing the master HD.  Here's why:
...............Usefull stuff snipped............
> > Regards,
> >
> > Confucius
>
> useful stuff but I'm still unsure why if I change the order in BIOS then
> (when I had it working a bit) it would start the XP boot sequence (and
> not the GRUB from master) but then hang indefinitely...
Hi !
Let me chime in here as I've faced the same problem you've got.
My PC has a lot of disks, some of them for Fedora/LVM/mirror install, some =
of
them for Mandriva/Ubuntu install and one with Windows XP.
The problem I encountered came from ...guess what ? Windows XP installation.
Here is a _short_ HowTo.
1) open you PC and let ONLY one disk into it as MASTER (if IDE) and install
Windows/XP.
2) Double check that the Windows/XP boot section specify only this disk.
3) Test that you can boot Windows/XP in this particular configuration.
4) Return PC hardware as it should be.
5) double check that you Linux/LVM config boots fine.
6) modify the Grub.conf file to have Windows/XP believe it is on first disk=
/only
disk using map() command.
7) double check Windows/XP boots fine.
If you do a Windows/XP install with another configuration than above, you w=
ill
have some references to this configuration in the registry/boot config...et=
c and
won't be able to run  XP=EF=BF=BDagain. Also be sure to wipe clean the Wind=
ows/XP disk
before installation, otherwise, you know what....
This is just "been there, done that" .... kind of PITA I had.
And, of course, YMMV.
--=20

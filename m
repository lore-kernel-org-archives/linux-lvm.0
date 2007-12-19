Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBJEZoTu017474
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 09:35:50 -0500
Received: from mexforward.lss.emc.com (mexforward.lss.emc.com [128.222.32.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBJEZHDP021587
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 09:35:17 -0500
Received: from hop04-l1d11-si01.isus.emc.com (HOP04-L1D11-SI01.isus.emc.com
	[10.254.111.54])
	by mexforward.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	lBJEZBZM009554
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 09:35:11 -0500 (EST)
Received: from mailhub.lss.emc.com (nagas.lss.emc.com [10.254.144.11]) by
	hop04-l1d11-si01.isus.emc.com (Tablus Interceptor) for
	<linux-lvm@redhat.com>; Wed, 19 Dec 2007 09:35:11 -0500
Received: from corpussmtp4.corp.emc.com (corpussmtp4.corp.emc.com
	[10.254.64.54])
	by mailhub.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	lBJEYcKh003548
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 09:35:09 -0500 (EST)
From: pham_cuong@emc.com
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM
Date: Wed, 19 Dec 2007 09:33:00 -0500
Message-ID: <7C6C00FDABF70949A0A5D4DD8A4DC2170474A35A@CORPUSMX20A.corp.emc.com>
In-Reply-To: <1198059909.3859.21.camel@amd64.local>
References: <1197988092.29413.77.camel@veri.phy.umist.ac.uk><7C6C00FDABF70949A0A5D4DD8A4DC2170474A353@CORPUSMX20A.corp.emc.com><1198010286.6637.10.camel@amd64.local><7C6C00FDABF70949A0A5D4DD8A4DC2170474A356@CORPUSMX20A.corp.emc.com><1198058368.3859.10.camel@amd64.local><1198059645.4768f07d37201@imp.free.fr>
	<1198059909.3859.21.camel@amd64.local>
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
To: linux-lvm@redhat.com

 Instead of discussing back and forth w/o real data to discuss/explore with=
 concrete evidences, could you:

A. Post the content of both the grub.conf and boot.ini files
B. Tell us the physical position of each of the drive, and
C. The current BIOS setting
D. Any observed behavior with the settings stated in A,B, and C.

I presume (please make appropriate correction as needed), based on the emai=
l trails, that the "current config that failed" is:

E.  Primary drive contains Fedorea.
F.  Slave drive contains XP.
G.  Upon POST, Fedora boot loader comes up first, if you make the selection=
 to boot to Fedora, then Fedora boot up w/o problem.
H.  However, if you were to make the selection to boot to XP, then XP start=
ed, but hung.  If so, let us know what transpired (what the last thing that=
 passed, what the last thing that failed

I.  I need to know whether the failure is caused by the Fedora boot loader =
or the XP boot loader.  At this time, I can not ascertain which one is the =
culprit.  If E,F,G,H are correct, then boot.ini along with all the necessar=
y hidden system files must be scrutized to ensure that they exists, that th=
ey are good (integrity check), and that the config is set correctly.

Thanks.

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On=
 Behalf Of cs
Sent: Wednesday, December 19, 2007 5:25 AM
To: LVM general discussion and development
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM

On Wed, 2007-12-19 at 11:20 +0100, Georges Giralt wrote:
> Selon cs <cs@networkingnewsletter.org.uk>:
>=20
> > On Tue, 2007-12-18 at 16:52 -0500, pham_cuong@emc.com wrote:
> > > There is a difference between changing the boot order from the BIOS v=
s.
> > > [physically] removing the master HD.  Here's why:
> ...............Usefull stuff snipped............
> > > Regards,
> > >
> > > Confucius
> >
> > useful stuff but I'm still unsure why if I change the order in BIOS then
> > (when I had it working a bit) it would start the XP boot sequence (and
> > not the GRUB from master) but then hang indefinitely...
> Hi !
> Let me chime in here as I've faced the same problem you've got.
> My PC has a lot of disks, some of them for Fedora/LVM/mirror install, som=
e of
> them for Mandriva/Ubuntu install and one with Windows XP.
> The problem I encountered came from ...guess what ? Windows XP installati=
on.
> Here is a _short_ HowTo.
> 1) open you PC and let ONLY one disk into it as MASTER (if IDE) and insta=
ll
> Windows/XP.
> 2) Double check that the Windows/XP boot section specify only this disk.
> 3) Test that you can boot Windows/XP in this particular configuration.
> 4) Return PC hardware as it should be.
> 5) double check that you Linux/LVM config boots fine.
> 6) modify the Grub.conf file to have Windows/XP believe it is on first di=
sk/only
> disk using map() command.
> 7) double check Windows/XP boots fine.
> If you do a Windows/XP install with another configuration than above, you=
 will
> have some references to this configuration in the registry/boot config...=
etc and
> won't be able to run  XP=EF=BF=BDagain. Also be sure to wipe clean the Wi=
ndows/XP disk
> before installation, otherwise, you know what....
> This is just "been there, done that" .... kind of PITA I had.
> And, of course, YMMV.

that does seem the only safe way but I'm still struggling to understand
why!

Thanks, Michael




_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

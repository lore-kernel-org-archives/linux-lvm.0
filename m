Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6K6PCGF022339
	for <linux-lvm@redhat.com>; Fri, 20 Jul 2007 02:25:12 -0400
Received: from post.berlin.i-dmedia.com (post.berlin.i-dmedia.com
	[62.159.214.250])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6K6P2OK027287
	for <linux-lvm@redhat.com>; Fri, 20 Jul 2007 02:25:05 -0400
Received: from localhost (localhost [127.0.0.1])
	by post.berlin.i-dmedia.com (Postfix) with ESMTP id C9359148
	for <linux-lvm@redhat.com>; Fri, 20 Jul 2007 08:24:55 +0200 (CEST)
Received: from post.berlin.i-dmedia.com ([127.0.0.1])
	by localhost (post.berlin.i-dmedia.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 17771-10 for <linux-lvm@redhat.com>;
	Fri, 20 Jul 2007 08:24:49 +0200 (CEST)
Received: from x1.ads.i-dmedia.com (x1.berlin.i-dmedia.com [10.1.69.45])
	by post.berlin.i-dmedia.com (Postfix) with ESMTP id EB641D7
	for <linux-lvm@redhat.com>; Fri, 20 Jul 2007 08:24:48 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <469FDCBE.2010403@iinet.net.au>
References: <Pine.LNX.4.44.0707191047010.6647-100000@bmsred.bmsi.com>
	<469FDCBE.2010403@iinet.net.au>
Content-Type: multipart/alternative; boundary=Apple-Mail-3-447054694
Message-Id: <804849EA-0E04-4D42-9752-C5DE36D0798F@idmedia.com>
From: Falko Zurell <falko.zurell@idmedia.com>
Subject: Re: [linux-lvm] snapshots can't be deactivated
Date: Fri, 20 Jul 2007 08:24:44 +0200
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


--Apple-Mail-3-447054694
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=ISO-8859-1;
	delsp=yes;
	format=flowed

Hello,

I got some more debug output from the lvchange command.
I noticed, that sometimes lvchange -an vg0/daily-snap-opt worked and =20
after that I was able to really remove the snapshot.

But most of the times it doesn't work. It seems that system need =20
several minutes do free the snapshot because when I wait some minutes =20=

an retry, I can deactivate and remove the snapshot to reuse the name.

root@konrad:~# lvchange -vvv -an vg0/daily-snap-opt
         Processing: lvchange -vvv -an vg0/daily-snap-opt
         O_DIRECT will be used
       Setting global/locking_type to 1
       Setting global/locking_dir to /var/lock/lvm
       File-based locking enabled.
     Using logical volume(s) on command line
       Locking /var/lock/lvm/V_vg0 WB
         /dev/ram0: Not using O_DIRECT
         Opened /dev/ram0 RW
         /dev/ram0: block size is 1024 bytes
       /dev/ram0: No label detected
         Closed /dev/ram0
         Opened /dev/vg0/root RW O_DIRECT
         /dev/vg0/root: block size is 512 bytes
       /dev/vg0/root: No label detected
         Closed /dev/vg0/root
         /dev/ram1: Not using O_DIRECT
         Opened /dev/ram1 RW
         /dev/ram1: block size is 1024 bytes
       /dev/ram1: No label detected
         Closed /dev/ram1
         Opened /dev/cciss/c0d0p1 RW O_DIRECT
         /dev/cciss/c0d0p1: block size is 1024 bytes
       /dev/cciss/c0d0p1: No label detected
         Closed /dev/cciss/c0d0p1
         Opened /dev/mapper/vg0-home-real RW O_DIRECT
         /dev/mapper/vg0-home-real: block size is 4096 bytes
       /dev/mapper/vg0-home-real: No label detected
         Closed /dev/mapper/vg0-home-real
         /dev/ram2: Not using O_DIRECT
         Opened /dev/ram2 RW
         /dev/ram2: block size is 1024 bytes
       /dev/ram2: No label detected
         Closed /dev/ram2
         Opened /dev/cciss/c0d0p2 RW O_DIRECT
         /dev/cciss/c0d0p2: block size is 4096 bytes
       /dev/cciss/c0d0p2: No label detected
         Closed /dev/cciss/c0d0p2
         Opened /dev/vg0/home RW O_DIRECT
         /dev/vg0/home: block size is 512 bytes
       /dev/vg0/home: No label detected
         Closed /dev/vg0/home
         /dev/ram3: Not using O_DIRECT
         Opened /dev/ram3 RW
         /dev/ram3: block size is 1024 bytes
       /dev/ram3: No label detected
         Closed /dev/ram3
         Opened /dev/cciss/c0d0p3 RW O_DIRECT
         /dev/cciss/c0d0p3: block size is 512 bytes
       /dev/cciss/c0d0p3: lvm2 label detected
         lvmcache: /dev/cciss/c0d0p3: now orphaned
         /dev/cciss/c0d0p3: Found metadata at 156160 size 2511 for =20
vg0 (Lw0OiY-teNf-jRuy-Ck2s-mqv7-A4BL-8EIzBo)
         lvmcache: /dev/cciss/c0d0p3: now in VG vg0
         lvmcache: /dev/cciss/c0d0p3: setting vg0 VGID to =20
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBo
         lvmcache: /dev/cciss/c0d0p3: VG vg0: Set creation host to =20
konrad.
         Opened /dev/vg0/opt RW O_DIRECT
         /dev/vg0/opt: block size is 512 bytes
       /dev/vg0/opt: No label detected
         Closed /dev/vg0/opt
         /dev/ram4: Not using O_DIRECT
         Opened /dev/ram4 RW
         /dev/ram4: block size is 1024 bytes
       /dev/ram4: No label detected
         Closed /dev/ram4
         Opened /dev/vg0/video RW O_DIRECT
         /dev/vg0/video: block size is 512 bytes
       /dev/vg0/video: No label detected
         Closed /dev/vg0/video
         /dev/ram5: Not using O_DIRECT
         Opened /dev/ram5 RW
         /dev/ram5: block size is 1024 bytes
       /dev/ram5: No label detected
         Closed /dev/ram5
         Opened /dev/disk/by-label/opt RW O_DIRECT
         /dev/disk/by-label/opt: block size is 4096 bytes
       /dev/disk/by-label/opt: No label detected
         Closed /dev/disk/by-label/opt
         /dev/ram6: Not using O_DIRECT
         Opened /dev/ram6 RW
         /dev/ram6: block size is 1024 bytes
       /dev/ram6: No label detected
         Closed /dev/ram6
         Opened /dev/mapper/vg0-daily--snap--home-cow RW O_DIRECT
         /dev/mapper/vg0-daily--snap--home-cow: block size is 4096 bytes
       /dev/mapper/vg0-daily--snap--home-cow: No label detected
         Closed /dev/mapper/vg0-daily--snap--home-cow
         /dev/ram7: Not using O_DIRECT
         Opened /dev/ram7 RW
         /dev/ram7: block size is 1024 bytes
       /dev/ram7: No label detected
         Closed /dev/ram7
         Opened /dev/vg0/daily-snap-home RW O_DIRECT
         /dev/vg0/daily-snap-home: block size is 512 bytes
       /dev/vg0/daily-snap-home: No label detected
         Closed /dev/vg0/daily-snap-home
         /dev/ram8: Not using O_DIRECT
         Opened /dev/ram8 RW
         /dev/ram8: block size is 1024 bytes
       /dev/ram8: No label detected
         Closed /dev/ram8
         /dev/ram9: Not using O_DIRECT
         Opened /dev/ram9 RW
         /dev/ram9: block size is 1024 bytes
       /dev/ram9: No label detected
         Closed /dev/ram9
         Opened /dev/vg0/daily-snap-opt RW O_DIRECT
         /dev/vg0/daily-snap-opt: block size is 4096 bytes
       /dev/vg0/daily-snap-opt: No label detected
         Closed /dev/vg0/daily-snap-opt
         /dev/ram10: Not using O_DIRECT
         Opened /dev/ram10 RW
         /dev/ram10: block size is 1024 bytes
       /dev/ram10: No label detected
         Closed /dev/ram10
         /dev/ram11: Not using O_DIRECT
         Opened /dev/ram11 RW
         /dev/ram11: block size is 1024 bytes
       /dev/ram11: No label detected
         Closed /dev/ram11
         /dev/ram12: Not using O_DIRECT
         Opened /dev/ram12 RW
         /dev/ram12: block size is 1024 bytes
       /dev/ram12: No label detected
         Closed /dev/ram12
         /dev/ram13: Not using O_DIRECT
         Opened /dev/ram13 RW
         /dev/ram13: block size is 1024 bytes
       /dev/ram13: No label detected
         Closed /dev/ram13
         /dev/ram14: Not using O_DIRECT
         Opened /dev/ram14 RW
         /dev/ram14: block size is 1024 bytes
       /dev/ram14: No label detected
         Closed /dev/ram14
         /dev/ram15: Not using O_DIRECT
         Opened /dev/ram15 RW
         /dev/ram15: block size is 1024 bytes
       /dev/ram15: No label detected
         Closed /dev/ram15
       /dev/cciss/c0d0p3: lvm2 label detected
         /dev/cciss/c0d0p3: Found metadata at 156160 size 2511 for =20
vg0 (Lw0OiY-teNf-jRuy-Ck2s-mqv7-A4BL-8EIzBo)
       /dev/cciss/c0d0p3: lvm2 label detected
         /dev/cciss/c0d0p3: Found metadata at 156160 size 2511 for =20
vg0 (Lw0OiY-teNf-jRuy-Ck2s-mqv7-A4BL-8EIzBo)
         Read vg0 metadata (153) from /dev/cciss/c0d0p3 at 156160 =20
size 2511
         /dev/cciss/c0d0p3 0:      0   2560: root(0:0)
         /dev/cciss/c0d0p3 1:   2560  25600: home(0:0)
         /dev/cciss/c0d0p3 2:  28160  25600: opt(0:0)
         /dev/cciss/c0d0p3 3:  53760 204800: video(0:0)
         /dev/cciss/c0d0p3 4: 258560  87040: NULL(0:0)
         /dev/cciss/c0d0p3 5: 345600   5120: daily-snap-home(0:0)
         /dev/cciss/c0d0p3 6: 350720   5120: daily-snap-opt(0:0)
         /dev/cciss/c0d0p3 7: 355840 119136: NULL(0:0)
   Can't change snapshot logical volume "daily-snap-opt"
       Unlocking /var/lock/lvm/V_vg0
         Closed /dev/cciss/c0d0p3

Unfortunatly these debug messages doesn't give me a clue why the =20
snapshot can't be deactivated.



---

Falko Zurell
Head of Application Management
Mobil +49 (0)160 - 3 62 52 77

/i-d media AG
Ohlauer Stra=DFe 43
D-10999 Berlin

Tel +49 (0)30 - 2 59 47 - 357
Fax +49 (0)30 - 2 59 47 - 471
www.idmedia.com

_______________________________________________

Board: Regine Haschka-Helmer (CEO), Franz Klose (CFO)
Chairman of the Supervisory Board: Christian A. Hufnagl
Headquarters: Berlin, Place of Jurisdiction: Berlin HRB 76342
UST-Id. DE812698340
_______________________________________________


This message may contain confidential information and must not be =20
copied, disclosed or used by anybody other than the intended =20
recipient. If you have received this message in error, please notify =20
us immediately by reply e-mail and delete all records of the message =20
from your computer. The views represented in this message are solely =20
those of the author. Neither the author nor I-D Media AG accepts any =20
liability for the contents of this message.


Am 19.07.2007 um 23:50 schrieb David Timms:

> Stuart D. Gathman wrote:
> > On Wed, 18 Jul 2007, Joachim Banzhaf wrote:
> >
> >>> Are my steps right in principle? Did I forget to do something =20
> before or
> >>> after removing?
> >> I am by no means an expert on lvm, so dont take this too =20
> seriously: shouldn't
> >> there be an lvchange -an yourlv before lvremove? Maybe this =20
> active status is
> >> still hanging around somewhere although you can force the remove?
> >
> > When I try lvchange -an C4_SNAP, it always fails.  So I have had =20
> to force
> > the lvremove in the backup script.  I am nervous about this, and =20
> already asked
> > why this is the case.  When reading about the "active" flag, it =20
> seems
> > to have something to do with shared SAN storage volume groups, so =20=

> perhaps we
> > are not supposed to deactivate LVs for simple single machine =20
> systems.  But the
> > error from lvremove is disconcerting.  If I force it, what if =20
> there is
> > a *different* error that I really *don't* want to force?
> Perhaps the command produces an errorlevel that you could test =20
> against,
> and only continue when you get the expected error ?
>
> DaveT.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>


--Apple-Mail-3-447054694
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=UTF-8

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; ">Hello,<DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>I got some more debug =
output from the lvchange command.</DIV><DIV>I noticed, that sometimes =
lvchange -an vg0/daily-snap-opt worked and after that I was able to =
really remove the snapshot.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>But most of the times it =
doesn't work. It seems that system need several minutes do free the =
snapshot because when I wait some minutes an retry, I can deactivate and =
remove the snapshot to reuse the name.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>root@konrad:~# lvchange =
-vvv -an vg0/daily-snap-opt</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
Processing: lvchange -vvv -an vg0/daily-snap-opt</DIV><DIV>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 O_DIRECT will be used</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =
Setting global/locking_type to 1</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 Setting =
global/locking_dir to /var/lock/lvm</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =
File-based locking enabled.</DIV><DIV>=C2=A0 =C2=A0 Using logical =
volume(s) on command line</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 Locking =
/var/lock/lvm/V_vg0 WB</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram0: =
Not using O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened =
/dev/ram0 RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram0: block size =
is 1024 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram0: No label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram0</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/vg0/root RW =
O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/vg0/root: block size =
is 512 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/vg0/root: No label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/vg0/root</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram1: Not using =
O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/ram1 =
RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram1: block size is 1024 =
bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram1: No label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram1</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/cciss/c0d0p1 =
RW O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/cciss/c0d0p1: =
block size is 1024 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =
/dev/cciss/c0d0p1: No label detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Closed /dev/cciss/c0d0p1</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened =
/dev/mapper/vg0-home-real RW O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /dev/mapper/vg0-home-real: block size is 4096 bytes</DIV><DIV>=C2=A0 =C2=A0=
 =C2=A0 /dev/mapper/vg0-home-real: No label detected</DIV><DIV>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Closed /dev/mapper/vg0-home-real</DIV><DIV>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /dev/ram2: Not using O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 Opened /dev/ram2 RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/dev/ram2: block size is 1024 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =
/dev/ram2: No label detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
Closed /dev/ram2</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened =
/dev/cciss/c0d0p2 RW O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/dev/cciss/c0d0p2: block size is 4096 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0=
 /dev/cciss/c0d0p2: No label detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Closed /dev/cciss/c0d0p2</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened =
/dev/vg0/home RW O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/dev/vg0/home: block size is 512 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =
/dev/vg0/home: No label detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
Closed /dev/vg0/home</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram3: =
Not using O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened =
/dev/ram3 RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram3: block size =
is 1024 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram3: No label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram3</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/cciss/c0d0p3 =
RW O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/cciss/c0d0p3: =
block size is 512 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =
/dev/cciss/c0d0p3: lvm2 label detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lvmcache: /dev/cciss/c0d0p3: now orphaned</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /dev/cciss/c0d0p3: Found metadata at 156160 size 2511 for vg0 =
(Lw0OiY-teNf-jRuy-Ck2s-mqv7-A4BL-8EIzBo)</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 lvmcache: /dev/cciss/c0d0p3: now in VG vg0</DIV><DIV>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 lvmcache: /dev/cciss/c0d0p3: setting vg0 VGID to =
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBo</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
lvmcache: /dev/cciss/c0d0p3: VG vg0: Set creation host to =
konrad.</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/vg0/opt RW =
O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/vg0/opt: block size =
is 512 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/vg0/opt: No label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/vg0/opt</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram4: Not using =
O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/ram4 =
RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram4: block size is 1024 =
bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram4: No label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram4</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/vg0/video RW =
O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/vg0/video: block =
size is 512 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/vg0/video: No =
label detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/vg0/video</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram5: Not =
using O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/ram5 =
RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram5: block size is 1024 =
bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram5: No label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram5</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened =
/dev/disk/by-label/opt RW O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/dev/disk/by-label/opt: block size is 4096 bytes</DIV><DIV>=C2=A0 =C2=A0 =
=C2=A0 /dev/disk/by-label/opt: No label detected</DIV><DIV>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Closed /dev/disk/by-label/opt</DIV><DIV>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 /dev/ram6: Not using O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Opened /dev/ram6 RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram6: =
block size is 1024 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram6: No =
label detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram6</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened =
/dev/mapper/vg0-daily--snap--home-cow RW O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /dev/mapper/vg0-daily--snap--home-cow: block size is 4096 =
bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =
/dev/mapper/vg0-daily--snap--home-cow: No label detected</DIV><DIV>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Closed =
/dev/mapper/vg0-daily--snap--home-cow</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /dev/ram7: Not using O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
Opened /dev/ram7 RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram7: =
block size is 1024 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram7: No =
label detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram7</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened =
/dev/vg0/daily-snap-home RW O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /dev/vg0/daily-snap-home: block size is 512 bytes</DIV><DIV>=C2=A0 =C2=A0=
 =C2=A0 /dev/vg0/daily-snap-home: No label detected</DIV><DIV>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Closed /dev/vg0/daily-snap-home</DIV><DIV>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /dev/ram8: Not using O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 Opened /dev/ram8 RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/dev/ram8: block size is 1024 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =
/dev/ram8: No label detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
Closed /dev/ram8</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram9: Not =
using O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/ram9 =
RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram9: block size is 1024 =
bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram9: No label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram9</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened =
/dev/vg0/daily-snap-opt RW O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/dev/vg0/daily-snap-opt: block size is 4096 bytes</DIV><DIV>=C2=A0 =C2=A0 =
=C2=A0 /dev/vg0/daily-snap-opt: No label detected</DIV><DIV>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Closed /dev/vg0/daily-snap-opt</DIV><DIV>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 /dev/ram10: Not using O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Opened /dev/ram10 RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram10: =
block size is 1024 bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram10: No =
label detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram10</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram11: Not using =
O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/ram11 =
RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram11: block size is 1024 =
bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram11: No label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram11</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram12: Not using =
O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/ram12 =
RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram12: block size is 1024 =
bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram12: No label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram12</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram13: Not using =
O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/ram13 =
RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram13: block size is 1024 =
bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram13: No label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram13</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram14: Not using =
O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/ram14 =
RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram14: block size is 1024 =
bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram14: No label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram14</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram15: Not using =
O_DIRECT</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Opened /dev/ram15 =
RW</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/ram15: block size is 1024 =
bytes</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/ram15: No label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Closed =
/dev/ram15</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 /dev/cciss/c0d0p3: lvm2 label =
detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/cciss/c0d0p3: Found =
metadata at 156160 size 2511 for vg0 =
(Lw0OiY-teNf-jRuy-Ck2s-mqv7-A4BL-8EIzBo)</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =
/dev/cciss/c0d0p3: lvm2 label detected</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /dev/cciss/c0d0p3: Found metadata at 156160 size 2511 for vg0 =
(Lw0OiY-teNf-jRuy-Ck2s-mqv7-A4BL-8EIzBo)</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Read vg0 metadata (153) from /dev/cciss/c0d0p3 at 156160 size =
2511</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/cciss/c0d0p3 0:=C2=A0 =C2=A0=
 =C2=A0 0=C2=A0=C2=A0 2560: root(0:0)</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /dev/cciss/c0d0p3 1:=C2=A0=C2=A0 2560=C2=A0 25600: =
home(0:0)</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/cciss/c0d0p3 2:=C2=A0=
 28160=C2=A0 25600: opt(0:0)</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/dev/cciss/c0d0p3 3:=C2=A0 53760 204800: video(0:0)</DIV><DIV>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /dev/cciss/c0d0p3 4: 258560=C2=A0 87040: =
NULL(0:0)</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/cciss/c0d0p3 5: =
345600=C2=A0=C2=A0 5120: daily-snap-home(0:0)</DIV><DIV>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 /dev/cciss/c0d0p3 6: 350720=C2=A0=C2=A0 5120: =
daily-snap-opt(0:0)</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/dev/cciss/c0d0p3 7: 355840 119136: NULL(0:0)</DIV><DIV>=C2=A0 Can't =
change snapshot logical volume "daily-snap-opt"</DIV><DIV>=C2=A0 =C2=A0 =
=C2=A0 Unlocking /var/lock/lvm/V_vg0</DIV><DIV>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Closed /dev/cciss/c0d0p3</DIV><DIV><BR><DIV> <SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><P style=3D"margin: =
0.0px 0.0px 12.0px 0.0px">Unfortunatly these debug messages doesn't give =
me a clue why the snapshot can't be deactivated.</P><P style=3D"margin: =
0.0px 0.0px 12.0px 0.0px"><BR class=3D"khtml-block-placeholder"></P><P =
style=3D"margin: 0.0px 0.0px 12.0px 0.0px">---</P><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
min-height: 14px; ">Falko Zurell<BR></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" face=3D"Arial" size=3D"1"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 9px;; font-family: Arial; =
"><SPAN class=3D"Apple-style-span" style=3D"font-family: Arial; =
font-size: 9px; "><SPAN class=3D"Apple-style-span" style=3D"font-family: =
Arial; font-size: 9px; ">Head of Application =
Management</SPAN></SPAN></SPAN></FONT></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" face=3D"Arial" size=3D"1"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 9px;; font-family: Arial; =
"><SPAN class=3D"Apple-style-span" style=3D"font-family: Arial; =
font-size: 9px; "><SPAN class=3D"Apple-style-span" style=3D"font-family: =
Arial; font-size: 9px; ">Mobil +49 (0)160 - 3 62 52 =
77</SPAN></SPAN></SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: normal =
normal normal 9px/normal Arial; min-height: 10px; ; font-family: Arial; =
font-size: 9px; "><BR style=3D"font-family: Arial; font-size: 9px; =
"></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: =
0px; margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><B style=3D"font-family: Arial; font-size: 9px; =
font-weight: bold; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; font-weight: bold; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
font-weight: bold; ">/i-d media =
AG</SPAN></SPAN></B></SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" face=3D"Arial" size=3D"1"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 9px;; font-family: Arial; =
"><SPAN class=3D"Apple-style-span" style=3D"font-family: Arial; =
font-size: 9px; "><SPAN class=3D"Apple-style-span" style=3D"font-family: =
Arial; font-size: 9px; ">Ohlauer Stra=C3=9Fe =
43</SPAN></SPAN></SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" face=3D"Arial" size=3D"1"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 9px;; font-family: Arial; =
"><SPAN class=3D"Apple-style-span" style=3D"font-family: Arial; =
font-size: 9px; "><SPAN class=3D"Apple-style-span" style=3D"font-family: =
Arial; font-size: 9px; ">D-10999 =
Berlin</SPAN></SPAN></SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: normal =
normal normal 9px/normal Arial; min-height: 10px; ; font-family: Arial; =
font-size: 9px; "><BR style=3D"font-family: Arial; font-size: 9px; =
"></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: =
0px; margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">Tel +49 (0)30 - 2 59 47 - 357</SPAN></SPAN></SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">Fax +49 (0)30 - 2 59 47 - 471</SPAN></SPAN></SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">www.idmedia.com</SPAN></SPAN></SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 9px/normal Arial; =
min-height: 10px; ; font-family: Arial; font-size: 9px; "><BR =
style=3D"font-family: Arial; font-size: 9px; "></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">_______________________________________________</SPAN></SPAN></SPAN></FO=
NT></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
9px/normal Arial; min-height: 10px; ; font-family: Arial; font-size: =
9px; "><BR style=3D"font-family: Arial; font-size: 9px; "></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">Board: Regine Haschka-Helmer (CEO), Franz Klose =
(CFO)</SPAN></SPAN></SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" face=3D"Arial" size=3D"1"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 9px;; font-family: Arial; =
"><SPAN class=3D"Apple-style-span" style=3D"font-family: Arial; =
font-size: 9px; "><SPAN class=3D"Apple-style-span" style=3D"font-family: =
Arial; font-size: 9px; ">Chairman of the Supervisory Board: Christian A. =
Hufnagl</SPAN></SPAN></SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" face=3D"Arial" size=3D"1"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 9px;; font-family: Arial; =
"><SPAN class=3D"Apple-style-span" style=3D"font-family: Arial; =
font-size: 9px; "><SPAN class=3D"Apple-style-span" style=3D"font-family: =
Arial; font-size: 9px; ">Headquarters: Berlin, Place of Jurisdiction: =
Berlin HRB 76342</SPAN></SPAN></SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">UST-Id. DE812698340</SPAN></SPAN></SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">_______________________________________________</SPAN></SPAN></SPAN></FO=
NT></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
9px/normal Arial; min-height: 10px; ; font-family: Arial; font-size: =
9px; "><BR style=3D"font-family: Arial; font-size: 9px; "></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 9px/normal Arial; =
min-height: 10px; ; font-family: Arial; font-size: 9px; "><BR =
style=3D"font-family: Arial; font-size: 9px; "></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">This message may contain confidential information and must not be =
copied, disclosed or used by anybody other than the intended recipient. =
If you have received this message in error, please notify us immediately =
by reply e-mail and delete all records of the message from your =
computer. The views represented in this message are solely those of the =
author. Neither the author nor I-D Media AG accepts any liability for =
the contents of this message.</SPAN></SPAN></SPAN></FONT></DIV><BR =
class=3D"Apple-interchange-newline"></SPAN></SPAN></SPAN></SPAN> =
</DIV><BR><DIV><DIV>Am 19.07.2007 um 23:50 schrieb David Timms:</DIV><BR =
class=3D"Apple-interchange-newline"><BLOCKQUOTE type=3D"cite">  <P><FONT =
size=3D"2">Stuart D. Gathman wrote:<BR> &gt; On Wed, 18 Jul 2007, =
Joachim Banzhaf wrote:<BR> &gt;<BR> &gt;&gt;&gt; Are my steps right in =
principle? Did I forget to do something before or<BR> &gt;&gt;&gt; after =
removing?<BR> &gt;&gt; I am by no means an expert on lvm, so dont take =
this too seriously: shouldn't<BR> &gt;&gt; there be an lvchange -an =
yourlv before lvremove? Maybe this active status is<BR> &gt;&gt; still =
hanging around somewhere although you can force the remove?<BR> &gt;<BR> =
&gt; When I try lvchange -an C4_SNAP, it always fails.=C2=A0 So I have =
had to force<BR> &gt; the lvremove in the backup script.=C2=A0 I am =
nervous about this, and already asked<BR> &gt; why this is the case.=C2=A0=
 When reading about the "active" flag, it seems<BR> &gt; to have =
something to do with shared SAN storage volume groups, so perhaps we<BR> =
&gt; are not supposed to deactivate LVs for simple single machine =
systems.=C2=A0 But the<BR> &gt; error from lvremove is disconcerting.=C2=A0=
 If I force it, what if there is<BR> &gt; a *different* error that I =
really *don't* want to force?<BR> Perhaps the command produces an =
errorlevel that you could test against,<BR> and only continue when you =
get the expected error ?<BR> <BR> DaveT.<BR> <BR> =
_______________________________________________<BR> linux-lvm mailing =
list<BR> <A =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A><BR> <A =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.red=
hat.com/mailman/listinfo/linux-lvm</A><BR> read the LVM HOW-TO at <A =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/=
</A><BR> </FONT> </P>  </BLOCKQUOTE></DIV><BR></DIV></BODY></HTML>=

--Apple-Mail-3-447054694--

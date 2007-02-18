Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1IIwkKI014497
	for <linux-lvm@redhat.com>; Sun, 18 Feb 2007 13:58:47 -0500
Received: from carlit.cesca.es (carlit.cesca.es [84.88.0.2])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1IIwihY015338
	for <linux-lvm@redhat.com>; Sun, 18 Feb 2007 13:58:44 -0500
Received: from carlit.cesca.es (localhost [127.0.0.1])
	by carlit.cesca.es (Postfix) with ESMTP id 162663316B9
	for <linux-lvm@redhat.com>; Sun, 18 Feb 2007 19:58:38 +0100 (CET)
Received: from [213.97.212.36] (36.Red-213-97-212.staticIP.rima-tde.net
	[213.97.212.36])
	by carlit.cesca.es (Postfix) with ESMTP id 6376A3307AB
	for <linux-lvm@redhat.com>; Sun, 18 Feb 2007 19:58:37 +0100 (CET)
Message-ID: <45D8A380.6050807@cesca.es>
Date: Sun, 18 Feb 2007 20:05:36 +0100
From: Jordi Prats <jprats@cesca.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvscan/vgscan/lvscan error
References: <45D56FD4.7060908@cesca.es>
In-Reply-To: <45D56FD4.7060908@cesca.es>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,
I've found more errors using lvm commands. This time using vgdisplay and
lvdisplay:

# vgdisplay
  /dev/sdb: read failed after 0 of 4096 at 0: Input/output error
  /dev/sde: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdf: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdg: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdi: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdk: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdl: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdp: read failed after 0 of 4096 at 0: Input/output error
  --- Volume group ---
(...)

# lvdisplay
  /dev/sdb: read failed after 0 of 4096 at 0: Input/output error
  /dev/sde: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdf: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdg: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdi: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdk: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdl: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdp: read failed after 0 of 4096 at 0: Input/output error
  --- Logical volume ---
(...)

I don't know what is causing this. Anyone can help me with this problem?

Thank you!
Jordi

Jordi Prats wrote:
> Hi all,
> I've found that all vgscan is giving me an error. This is the output:
> 
> # vgscan -v
>    Wiping cache of LVM-capable devices
>    Wiping internal VG cache
>  Reading all physical volumes.  This may take a while...
>    Finding all volume groups
>  /dev/dm-4: read failed after 0 of 4096 at 12989693952: Input/output error
>  /dev/dm-4: read failed after 0 of 4096 at 0: Input/output error
>    Finding volume group "padicat"
>  Found volume group "padicat" using metadata type lvm2
>    Finding volume group "vg_bbdd"
>  Found volume group "vg_bbdd" using metadata type lvm2
>    Finding volume group "vg_ordal"
>  Found volume group "vg_ordal" using metadata type lvm2
> 
> Any idea what this "Input/output error" on /dev/dm-4 does it means? What
> is causing this error?
> 
> Thank you!
> 

-- 
......................................................................
        __
       / /          Jordi Prats Catal�
 C E / S / C A      Departament de Sistemes
     /_/            Centre de Supercomputaci� de Catalunya

 Gran Capit�, 2-4 (Edifici Nexus) � 08034 Barcelona
 T. 93 205 6464 � F.  93 205 6979 � jprats@cesca.es
......................................................................
pgp:0x5D0D1321
......................................................................

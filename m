Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i45F6Wv21682
	for <linux-lvm@redhat.com>; Wed, 5 May 2004 11:06:32 -0400
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i45F6S99008154
	for <linux-lvm@redhat.com>; Wed, 5 May 2004 11:06:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id E7CDADE0A
	for <linux-lvm@redhat.com>; Wed,  5 May 2004 11:06:24 -0400 (EDT)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03733-05 for <linux-lvm@redhat.com>;
	Wed, 5 May 2004 11:06:24 -0400 (EDT)
Received: from localhost (salusa.poochiereds.net [192.168.1.2])
	by salusa.poochiereds.net (Postfix) with ESMTP id 9E8DD48E9
	for <linux-lvm@redhat.com>; Wed,  5 May 2004 11:06:24 -0400 (EDT)
Subject: Re: [linux-lvm] 2.6 upgrade - LVM version ? & root partition
	access problems...
From: Jeffrey Layton <jtlayton@poochiereds.net>
In-Reply-To: <4095715C.3000900@sneakemail.com>
References: <408C2883.5080606@sneakemail.com>
	<20040426135853.GA17309@null.msp.redhat.com>
	<4095715C.3000900@sneakemail.com>
Message-Id: <1083769587.13530.10.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Date: Wed, 05 May 2004 11:06:27 -0400
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 2004-05-02 at 18:08, Peter Valdemar M=EF=BF=BDrch wrote:
> Well, I did finally did get it to work. Quite a strenuous road, though.=20
> For others that may google later, here are some of the things I ran=20
> into, and their solutions:
>=20
> 1) There was no console. The script created /dev/consoleonly, but I had=20
> & needed /dev/console.

Sorry for the late post. I've hit this too when setting up a new box.
The problem here is that the kernel or init (?) requires a /dev/console
device very early in the boot process, before udev gets mounted.

This means that even if you're using udev (and maybe devfs) then you
still need some static entries in /dev that will be overlayed by the
udev ramdisk. Obviously, this is a difficult problem to correct in the
mkinitrd script, since you'd have to unmount /dev to make sure those
entries were present.

I'll prob. add something about this to the README sometime, when I get a
chance to work on this script...

-- Jeff

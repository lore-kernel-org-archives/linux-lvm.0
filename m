Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1KKeucp000749
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2012 15:40:56 -0500
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1KKetDQ013047
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2012 15:40:55 -0500
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPSA id A882221900
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2012 14:40:52 -0600 (CST)
Date: Mon, 20 Feb 2012 14:40:53 -0600
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120220144053.053ac4e2@bettercgi.com>
In-Reply-To: <8CEF048B9EC83748B1517DC64EA130FB6B2AB35166@off-win2003-01.ausregistrygroup.local>
References: <8CEF048B9EC83748B1517DC64EA130FB6B2AB35166@off-win2003-01.ausregistrygroup.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Strange behavior adding LUN
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

> So, weird.  Why is the 'pvcreate' seeing the new LUN, seeing that it
> is 2.93TB, but not creating any PE's for use.

You need to vgextend. The PE size is a property of the VG, so until=20
it's added to a VG there's no way of knowing how big the PEs are and=20
therefore how many will fit on the PV.
--=20
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Mon, 20 Feb 2012 10:26:05 +1100
Stuart Browne <stuart.browne@ausregistry.com.au> wrote:

> Hi,
>=20
> We've been cleaning up some of our storage recently and migrating to
> new disks etc. when I came across this issue.
>=20
> I've re-allocated some old storage back to a server as a new array,
> but lvm is refusing to allow the LUN to participate.  Here's what I
> see:
>=20
> [root@office ~]# pvcreate /dev/mpath/backup1
>   Physical volume "/dev/mpath/backup1" successfully created
> [root@office ~]# pvdisplay /dev/mpath/backup1
>   "/dev/mpath/backup1" is a new physical volume of "2.93 TB"
>   --- NEW Physical volume ---
>   PV Name               /dev/mpath/backup1
>   VG Name
>   PV Size               2.93 TB
>   Allocatable           NO
>   PE Size (KByte)       0
>   Total PE              0
>   Free PE               0
>   Allocated PE          0
>   PV UUID               ipTgcI-kjdJ-Aucx-cUVs-TWKr-wAFO-Rkd0u8
>=20
> Thinking it's somehow mussed up the labelling, I had a quick look at
> the disk header:
>=20
> [root@office ~]# dd if=3D/dev/mpath/backup1 bs=3D1k count=3D1 | cat -v -
> ^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@LABELONE^A^@^@^@^@^@^@^@=
M-Tl^LM-z
> ^@^@^@LVM2
> 001ipTgcIkjdJAucxcUVsTWKrwAFORkd0u8^@^@^@^@M-n^B^@^@^@^@^C^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^P^@^@^@^@^@^@^@M-p^B^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@1+0
> records in 1+0 records out 1024 bytes (1.0 kB) copied, 0.000809
> seconds, 1.3 MB/s
>=20
> Given that it looks, well, 'ok' to me, I thought I'd 'pvremove' it
> and validate that the disk is empty.  It was (^@'s all the way, for
> the first 10MB at least), and re-add it.  New UUID, but basically the
> same.
>=20
> So, weird.  Why is the 'pvcreate' seeing the new LUN, seeing that it
> is 2.93TB, but not creating any PE's for use.
>=20
> Anybody have any idea what I should try next?
>=20
> Stuart J. Browne
> Senior Unix Administrator, Network Administrator, Database
> Administrator AusRegistry Pty Ltd
> Level 8, 10 Queens Road
> Melbourne. Victoria. Australia. 3004.
> Ph:=C2=A0 +61 3 9866 3710
> Fax: +61 3 9866 1970
> Email: stuart.browne@ausregistry.com.au
> Web: www.ausregistry.com.au
>=20
> The information contained in this communication is intended for the
> named recipients only. It is subject to copyright and may contain
> privileged and/or confidential information. If you are not an
> intended recipient you must not use, copy, distribute or take any
> action in reliance on it. If you have received this communication in
> error, please delete all copies from your system and notify us
> immediately.
>=20
>=20

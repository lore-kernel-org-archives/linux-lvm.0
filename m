Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JHZfh0014237
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 13:35:41 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JHZXi3029544
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 13:35:33 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1OEnB5-0002DG-Om
	for linux-lvm@redhat.com; Wed, 19 May 2010 10:35:31 -0700
Date: Wed, 19 May 2010 12:35:30 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <05d201caf776$17abb110$47031330$@com> (from k@kevinkevin.com on
	Wed May 19 12:09:48 2010)
Message-Id: <1274290530.16893.13@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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
Content-Type: text/plain; charset="windows-1252"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> lvextend -L+144G /dev/VolGroup00/my_volume

    If you want to use all available space:

lvextend -L+100%FREE /dev/VolGroup00/my_volume


> I should note that this is a logical volume for a
> collection of Xen virtualized environments so its
> not an actual EXT3 filesystem. I wouldn=E2=80=99t need to
> run the last step I imagine.

   Typically Xen images are files on the filesystem
of the host, so yes, you'd need to resize the host
filesystem, if you are creating Xen image files. Howver,
as long as you are making changes to your LVM, there is
another way which we use, because we think it's better.
Rather than having one huge LV which contains files which
are accessed as though they were block devices, we create
a LV for each guest.  If you have only one big LV, that's
kind of pointless indirection, overhead that gains you
nothing.  It's also problematic for recovery because
you have multiple overlapping ext3 filesystems - one
inside the other, meaning that recovery utilities will
find bogus superblocks belonging to the wrong filesystem.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 05/19/2010 12:09:48 PM, kevin wrote:
> One last thing I want to confirm is the lvextend command to 'grow' the
> logical volume :
>=20
>=20
> lvextend -L+144G /dev/VolGroup00/my_volume
>=20
> After all said steps in previous messages on this thread are =20
> complete, is
> the above command correct for my particular scenario? Do I want to =20
> 'extend'
> the volume size or 'grow' it?
>=20
> Not sure what the difference is.
>=20
>=20
> ~k
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
>=20

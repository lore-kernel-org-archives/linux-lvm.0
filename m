Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1BB0jO15904
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 06:00:45 -0500
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j1BB0i6j011966
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 06:00:45 -0500
From: "Cisco" <cisco66@gmx.de>
Subject: AW: [linux-lvm] Re: RAID, LVM and dm_crypt, please confirm setup
Date: Fri, 11 Feb 2005 11:00:37 +0100
MIME-Version: 1.0
In-Reply-To: <1042776283.20050114231550@free.fr>
Message-Id: <20050211100038.C7171757D0@mailer.at.ds9>
Content-Transfer-Encoding: quoted-printable
Reply-To: cisco66@gmx.de,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: hoper@free.fr, 'LVM general discussion and development' <linux-lvm@redhat.com>

Well, thanks for the answer.
Very strange, that only one man here is interested in those things...=20

I also thought about the way to crypt the RAID devices, but i didn't come to
a "best" solution.
And so i decided to crypt the lvm's. One reason was, that i wanted to have
some unencrypted space for the case that something goes wrong, since i
didn't find a comparable setup anywhere.

But meanwhile i think, your solution may be better for the 3 reasons:
1) you don't have to write the passphrase so often. Not so important for me,
it runs 24x7.
2) you never have to resize the file system.
3) it seems to be running absolutely stable and there is no reason to hold
unencrypted space.

I now replaced to disks (2x40 from /dev/md1) with 2x160GB, using pvmove,
vgreduce etc...
Everything went fine and now i have the possibility to change everything in
that way you mentioned.
But i'm still not sure if i will do this.

If I would plan a completely new setup, i would suggest to do it your way
and crypt the md-devices.

Since everything runs very stable and without any problems, i think, this
setup is very secure.


-----Urspr=EF=BF=BDngliche Nachricht-----
Von: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] Im
Auftrag von Stephane Dupuis
Gesendet: Freitag, 14. Januar 2005 23:16
An: LVM general discussion and development
Betreff: [linux-lvm] Re: RAID, LVM and dm_crypt, please confirm setup


Hi,

> I have (at home) the following setup for my data discs:
>=20
2x 80  GB RAID1 -->> /dev/md0
2x 40  GB RAID1 -->> /dev/md1
2x160 GB RAID1 -->> /dev/md2
>=20
> These are part of volume group vg00, consisting of 9 logical volumes
> lv00...lv09
>=20
> Now i set up crypt devices with cryptsetup and named these crypt=20
> devices clv00...clv09.

Well I found this post really interesting :)

First, I'm sorry cause I can't help you here and say for sure "you are doing
the right thing" or "take care, what you are doing is dangerous".

But I want to make something like this at home and so have the same concern
about the good way to resize the files systems.

I don't know if it will help but I thought about another way of mixing raid,
lvm and dmcrypt.
Instead of crypting the logical volume, why not crypt the raid device?
So you can have :

Physical drives -->> /dev/mdX
using dmcrypt on it -->> /dev/mapper/mdX_crypt And after make your LVM
physical volume :
pvcreate /dev/mapper/mdX_crypt   ******* NOTE, SEE UNDER
vgcreate testvg /dev/mapper/mdX_crypt
and so on...

In this way, you will never have to resize the crypted device.
You will just have to resize the logical volume and the filesystem as usual.

****** To be abble to do this, you need to edit the /etc/lvm/lvm.conf file
and change the "type" line to :
types =3D [ "device-mapper", 16 ]

Another advantage of this "crypted md" architecture (compare to crypt the
logical volume) is that the whole volume group are crypted, included all the
lvm metadata.

With your implementation, anybody can have access to the volume group
metadata, the logicals volumes names and so on...
(naming a logical volume "mpeg3_and_warez_fuck_riaa_lv" may not be a good
idea here ;o)

With all lvm metadata crypted, nobody can even know that you are using
lvm...

Of course, there are some drawback :(
First, It's mean that the same key will be use for a whole /dev/dm.
So, if you make a volme group on it, and.. let's say 10 logical volume, it's
mean than theses 10 lvs will be crypted with the same key and that you can't
choose to mount only 9 and think the last one is "secure"

I did'nt decide wich way I will choose yet... but I need to have a logical
volume that don't have the same key as the other.
So I can't choose my way. I will surely make as you did... or mix the two
ways.
(crypt the /dev/dm, make a vg, make lvs and for one particular lv, crypt it
again :o) Of course, I guess I will need cpu power here ;o)

So, I can't answer to your questions, I just also wonder about the better
way of putting all theses tools together...

Any comments are welcome...

Stephane Dupuis
--
()  ascii ribbon campaign
/\      - against html e-mail=20
        - against microsoft attachments

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

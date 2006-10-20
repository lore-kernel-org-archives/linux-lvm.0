Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9K8IwLl006217
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2006 04:18:58 -0400
Received: from localhost.localdomain ([205.223.232.64])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9K8Iunq029289
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2006 04:18:56 -0400
Subject: Re: [linux-lvm] Question about Physical volume
From: Mario Verbelen <mario@verbelen.org>
In-Reply-To: <45388202.7070305@nethinks.com>
References: <45388202.7070305@nethinks.com>
Date: Fri, 20 Oct 2006 10:18:49 +0200
Message-Id: <1161332329.5121.8.camel@leo>
Mime-Version: 1.0
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
To: tom@nethinks.com, LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I had this before and what I dit was reformat and recreate the lvm
because the vgchange -ay dit nor work with me also
If thare is no data on this disk this is the a way

with "vgchange -ay" will an rescan be executed

But I suggest that you read carefully the man because I don't now what
Will happen when thare is an problem

I used vgchange -ay in the past without problems but I don't guarantee
(because of production)

You will best wait for an second opinion because I'm not that specialist
but here was my experience (of last week)
(My OS was fedora5)

Mario,

On Fri, 2006-10-20 at 10:00 +0200, Thomas Marmetschke wrote:
> Hi,
>=20
> is it possible to extend a phyiscal volume?
>=20
> I have a strange problem, i resized the /dev/sda4 partion (8e Linux LVM)
> from 130GB to 220GB. so far so good.
>=20
> But with pvdisplay i still get the 130Gb Partion :
>=20
>  pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/sda4
>   VG Name               msa
>   PV Size               130,98 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              33530
>   Free PE               6394
>   Allocated PE          27136
>   PV UUID               TnggaW-0rIL-JaRp-JiwR-ZRlP-JJ83-LOjHfg
>=20
> Can i do something like a Rescan? that the Information will be updated.
> The big problem is that on this server a productive data so i can=C2=B4t
> remove any partions.
>=20
> thx!
>=20
> -tom
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

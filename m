References: <CAB5m+-G_sxm1SGOHc=f-kYOYnfnG+EOa1DmDSdY46NXQsX72tQ@mail.gmail.com>
	<dc535785-8408-6f82-1af6-fbed596141cc@redhat.com>
	<CAB5m+-F78BJYr-jVerNqAW-h8ZPSmt=hmG9FCigRVFk3KXC2yA@mail.gmail.com>
	<efff92af-60d9-fed7-4418-6f252994d781@redhat.com>
	<CAB5m+-GyXYnSPxLszT7sRhLmHm4gwSGixkT2V821wAUCnnhSbA@mail.gmail.com>
	<c40fad2f-09b0-a286-19ce-572b4536c1ed@redhat.com>
	<CAB5m+-EZu1oY=Fsv_p=cOfq4ydhecQtoYa6whB4aXojMz0dQsA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <10d33296-fd02-b328-18ae-c819faacbc93@redhat.com>
Date: Mon, 3 Dec 2018 15:56:22 +0100
MIME-Version: 1.0
In-Reply-To: <CAB5m+-EZu1oY=Fsv_p=cOfq4ydhecQtoYa6whB4aXojMz0dQsA@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvm.conf backup section
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Far Had <farhadk.it@gmail.com>

Dne 03. 12. 18 v 13:10 Far Had napsal(a):
> Hi, Thank you Zdenek
> You used "makes sure" phrase in your sentence:
> "this makes sure you should have=C2=A0files at least 10 days back as well"
>=20
> I was refering to that !
>=20

Hi

Oh - in that case I've been emphasizing the fact, that lvm2 will not REMOVE,
those. So nothing in the sense it will keep creating if they get missing :)=
 so=20
something completely different.

If the admin runs  'rm -f /etc/lvm/archive/*' all archives are simply gone.
(so i.e. info about executed command is lost forever! as the kernel does no=
t=20
hold all the info)

> So the whole thing is about PV metadata area and not /etc/lvm , am I corr=
ect?

Vise versa -    /etc/lvm/lvm.conf { backup/archive =3D 1 }  is purely about=
=20
/etc/lvm/archive.

There is *NO* control for user to influence PV metadata backup other then=20
limiting the size of metadata area - the smalller the area is - the smaller=
=20
'ring-buffer' will be - the less older metadata could be found there.

Regards

Zdenek

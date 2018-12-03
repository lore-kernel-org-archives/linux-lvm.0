References: <CAB5m+-G_sxm1SGOHc=f-kYOYnfnG+EOa1DmDSdY46NXQsX72tQ@mail.gmail.com>
	<dc535785-8408-6f82-1af6-fbed596141cc@redhat.com>
	<CAB5m+-F78BJYr-jVerNqAW-h8ZPSmt=hmG9FCigRVFk3KXC2yA@mail.gmail.com>
	<efff92af-60d9-fed7-4418-6f252994d781@redhat.com>
	<CAB5m+-GyXYnSPxLszT7sRhLmHm4gwSGixkT2V821wAUCnnhSbA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c40fad2f-09b0-a286-19ce-572b4536c1ed@redhat.com>
Date: Mon, 3 Dec 2018 12:33:19 +0100
MIME-Version: 1.0
In-Reply-To: <CAB5m+-GyXYnSPxLszT7sRhLmHm4gwSGixkT2V821wAUCnnhSbA@mail.gmail.com>
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

Dne 01. 12. 18 v 13:44 Far Had napsal(a):
> How does it _make sure_=C2=A0that I've backup files younger than 10 days =
old? What=20
> if I delete those files?

Hi

Archives in /etc/lvm/archive subdirs are not 'a must have' - they are optio=
nal=20
and purely for admin's pleasure.

So admin can erase them anytime he wants to - but in that case it's probabl=
y=20
more clever to disable archiving in lvm.conf ;) as archiving eats some CPU.=
..

lvm2 itself does *only* care about metadata stored in the 'metadata' area i=
n=20
PV header - where there is also ring-buffer which typically keeps pretty lo=
ng=20
history of all metadata modifications - this buffer has these days ~1MiB in=
=20
size. So unless your metadata are pretty big - the history can be relativel=
y=20
easily extracted also out from this place for i.e. recovery purpose.

I must admit I don't understand the  'make sure' part of your question??
Are you aiming at some particular issue ??

Regards


Zdenek

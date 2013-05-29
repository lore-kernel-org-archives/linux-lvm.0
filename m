Message-ID: <51A61B9F.4010905@redhat.com>
Date: Wed, 29 May 2013 17:15:43 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAA9cXK679Fwn+Ow4hxVUunkuusa7xoH+qYNj6fUR060pQjwjzA@mail.gmail.com>
In-Reply-To: <CAA9cXK679Fwn+Ow4hxVUunkuusa7xoH+qYNj6fUR060pQjwjzA@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Alert before LVM snapshot becomes full
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: =?ISO-8859-1?Q?Lo=EFc?= <loic@recisio.com>

Dne 29.5.2013 09:56, Lo=EF=BF=BDc napsal(a):
> Hi all,
>
> I would like to raise my problem because I have not found the answer to my
> question by searching on the Internet. Hoping that one of you had experie=
nce
> with this kind of problem.
>
> I'm looking for a way to launch a script or disable an LVM snaphot before=
 it
> becomes full.
> For example I would like to launch a script that will umount the LVM snap=
shot
> and delete it if it reaches 90%. That is to avoid LVM issue when snapshot=
 is full.
>
> Any ideas ?


Write dmeventd plugin - similar as you can find in upstream git source tree.


BTW - what's is the point to delete it 90% and delete it when it's invalid ?

If you don't need the snapshot you should remove it instantly - since it's =

impact system performance.

And if you need it - it's probably more useful to extend the snapshot.

Zdenek

MIME-Version: 1.0
References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
	<f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
	<CACrcyfLZk6iJY+Zwtcb6cSSeR4SEhsXEerxYg_8yqKxqHx+uDQ@mail.gmail.com>
	<35a99505-b5a9-a398-6ec2-b530733e974c@redhat.com>
In-Reply-To: <35a99505-b5a9-a398-6ec2-b530733e974c@redhat.com>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Fri, 25 Oct 2019 18:31:25 +0200
Message-ID: <CACrcyfJE2rEGTVOGTXGTf08w1Z-js8xTRshibCm+PuZNxp3OUA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000004b7980595beaf8e"
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Gionatan Danti <g.danti@assyoma.it>, LVM general discussion and development <linux-lvm@redhat.com>

--00000000000004b7980595beaf8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wow!

Impressing.
This will make history!

If this is possible, than we are able to implement a solution, which can do=
:
- progressive block level incremental forever (always incremental on block
level : this already exist)
- instant recovery to point in time (using the mentioned methods you just
described)

For example, lets say that a client wants to restore a file system, or a
logical volume to how it looked a like yesterday.
Eventhough there are no snapshot, nor any data.
Than the client (with some coding); can start from an empty volume, and
re-attach a cow device, and convert that using lvconvert --merge, so that
the copying can be done in background using the backup server.

If you forget about "how we will re-create the cow device"; and just
focusing on the LVM ideas of re-attaching a cow device.
Do you think that I have understood it correctly?


Den tors 24 okt. 2019 kl 18:01 skrev Zdenek Kabelac <zkabelac@redhat.com>:

> Dne 23. 10. 19 v 13:24 Tomas Dalebj=C3=B6rk napsal(a):
> > I have tested FusionIO together with old thick snapshots.
> > I created the thick snapshot on a separate old traditional SATA drive,
> just to
> > check if that could be used as a snapshot target for high performance
> disks;
> > like a Fusion IO card.
> > For those who doesn't know about FusionIO; they can deal with
> 150-250,000 IOPS.
> >
> > And to be honest, I couldn't bottle neck the SATA disk I used as a thic=
k
> > snapshot target.
> > The reason for why is simple:
> > - thick snapshots uses sequential write techniques
> >
> > If I would have been using thin snapshots, than the writes would most
> likely
> > be more randomized on disk, which would have required more spindles to
> coop
> > with this.
> >
> > Anyhow;
> > I am still eager to hear how to use an external device to import
> snapshots.
> > And when I say "import"; I am not talking about copyback, more to use t=
o
> read
> > data from.
>
> Format of 'on-disk' snapshot metadata for old snapshot is trivial - being
> some
> header + pairs of dataoffset-TO-FROM -  I think googling will reveal coup=
le
> python tools playing with it.
>
> You can add pre-created COW image to LV  with  lvconvert --snapshot
> and to avoid 'zeroing' metadata use option -Zn
> (BTW in the same way you can detach snapshot from LV with --splitsnapshot
> so
> you can look how the metadata looks like...)
>
> Although it's pretty unusual why would anyone create first the COW image
> with
> all the special layout and then merge it to LV - instead of directly
> merging...   There is only the 'little' advantage of minimizing 'offline'
> time
> of such device   (and it's the reason why --split exists).
>
> Regards
>
> Zdenek
>
>
>

--00000000000004b7980595beaf8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wow!</div><div><br></div><div>Impressing.</div><div>T=
his will make history!</div><div><br></div><div>If this is possible, than w=
e are able to implement a solution, which can do:</div><div>- progressive b=
lock level incremental forever (always incremental on block level : this al=
ready exist)</div><div>- instant recovery to point in time (using the menti=
oned methods you just described)</div><div><br></div><div>For example, lets=
 say that a client wants to restore a file system, or a logical volume to h=
ow it looked a like yesterday.</div><div>Eventhough there are no snapshot, =
nor any data.</div><div>Than the client (with some coding); can start from =
an empty volume, and re-attach a cow device, and convert that using lvconve=
rt --merge, so that the copying can be done in background using the backup =
server.</div><div><br></div><div>If you forget about &quot;how we will re-c=
reate the cow device&quot;; and just focusing on the LVM ideas of re-attach=
ing a cow device.</div><div>Do you think that I have understood it correctl=
y?</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">Den tors 24 okt. 2019 kl 18:01 skrev Zdenek Kabelac =
&lt;<a href=3D"mailto:zkabelac@redhat.com">zkabelac@redhat.com</a>&gt;:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Dne 23. 10. 19 v 13=
:24 Tomas Dalebj=C3=B6rk napsal(a):<br>
&gt; I have tested FusionIO together with old thick snapshots.<br>
&gt; I created the thick snapshot on a separate old traditional SATA drive,=
 just to <br>
&gt; check if that could be used as a snapshot target for high performance =
disks; <br>
&gt; like a Fusion IO card.<br>
&gt; For those who doesn&#39;t know about FusionIO; they can deal with 150-=
250,000 IOPS.<br>
&gt; <br>
&gt; And to be honest, I couldn&#39;t bottle neck the SATA disk I used as a=
 thick <br>
&gt; snapshot target.<br>
&gt; The reason for why is simple:<br>
&gt; - thick snapshots uses sequential write techniques<br>
&gt; <br>
&gt; If I would have been using thin snapshots, than the writes would most =
likely <br>
&gt; be more randomized on disk, which would have required more spindles to=
 coop <br>
&gt; with this.<br>
&gt; <br>
&gt; Anyhow;<br>
&gt; I am still eager to hear how to use an external device to import snaps=
hots.<br>
&gt; And when I say &quot;import&quot;; I am not talking about copyback, mo=
re to use to read <br>
&gt; data from.<br>
<br>
Format of &#39;on-disk&#39; snapshot metadata for old snapshot is trivial -=
 being some<br>
header + pairs of dataoffset-TO-FROM -=C2=A0 I think googling will reveal c=
ouple<br>
python tools playing with it.<br>
<br>
You can add pre-created COW image to LV=C2=A0 with=C2=A0 lvconvert --snapsh=
ot<br>
and to avoid &#39;zeroing&#39; metadata use option -Zn<br>
(BTW in the same way you can detach snapshot from LV with --splitsnapshot s=
o <br>
you can look how the metadata looks like...)<br>
<br>
Although it&#39;s pretty unusual why would anyone create first the COW imag=
e with <br>
all the special layout and then merge it to LV - instead of directly <br>
merging...=C2=A0 =C2=A0There is only the &#39;little&#39; advantage of mini=
mizing &#39;offline&#39; time <br>
of such device=C2=A0 =C2=A0(and it&#39;s the reason why --split exists).<br=
>
<br>
Regards<br>
<br>
Zdenek<br>
<br>
<br>
</blockquote></div>

--00000000000004b7980595beaf8e--

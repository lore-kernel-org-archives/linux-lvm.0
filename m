MIME-Version: 1.0
References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
	<f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
	<CACrcyfLZk6iJY+Zwtcb6cSSeR4SEhsXEerxYg_8yqKxqHx+uDQ@mail.gmail.com>
In-Reply-To: <CACrcyfLZk6iJY+Zwtcb6cSSeR4SEhsXEerxYg_8yqKxqHx+uDQ@mail.gmail.com>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Wed, 23 Oct 2019 13:26:36 +0200
Message-ID: <CACrcyfKL0x2ixbRqs+4-rOa_GxOvD+QtVA7RVKTPK-Xo-yyyqA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003bdd740595923115"
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

--0000000000003bdd740595923115
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

And the block size for thick snapshots can be set when using the lvcreate
command.
And the automatic growing of a snapshot can be configured too in the lvm
configuration.

Same issues with both thin and thick, if you run out of space.
//T

Den ons 23 okt. 2019 kl 13:24 skrev Tomas Dalebj=C3=B6rk <
tomas.dalebjork@gmail.com>:

> I have tested FusionIO together with old thick snapshots.
> I created the thick snapshot on a separate old traditional SATA drive,
> just to check if that could be used as a snapshot target for high
> performance disks; like a Fusion IO card.
> For those who doesn't know about FusionIO; they can deal with 150-250,000
> IOPS.
>
> And to be honest, I couldn't bottle neck the SATA disk I used as a thick
> snapshot target.
> The reason for why is simple:
> - thick snapshots uses sequential write techniques
>
> If I would have been using thin snapshots, than the writes would most
> likely be more randomized on disk, which would have required more spindle=
s
> to coop with this.
>
> Anyhow;
> I am still eager to hear how to use an external device to import snapshot=
s.
> And when I say "import"; I am not talking about copyback, more to use to
> read data from.
>
> Regards Tomas
>
> Den ons 23 okt. 2019 kl 13:08 skrev Gionatan Danti <g.danti@assyoma.it>:
>
>> On 23/10/19 12:46, Zdenek Kabelac wrote:
>> > Just few 'comments' - it's not really comparable - the efficiency of
>> > thin-pool metadata outperforms old snapshot in BIG way (there is no
>> > point to talk about snapshots that takes just couple of MiB)
>>
>> Yes, this matches my experience.
>>
>> > There is also BIG difference about the usage of old snapshot origin an=
d
>> > snapshot.
>> >
>> > COW of old snapshot effectively cuts performance 1/2 if you write to
>> > origin.
>>
>> If used without non-volatile RAID controller, 1/2 is generous - I
>> measured performance as low as 1/5 (with fat snapshot).
>>
>> Talking about thin snapshot, an obvious performance optimization which
>> seems to not be implemented is to skip reading source data when
>> overwriting in larger-than-chunksize blocks.
>>
>> For example, consider a completely filled 64k chunk thin volume (with
>> thinpool having ample free space). Snapshotting it and writing a 4k
>> block on origin will obviously cause a read of the original 64k chunk,
>> an in-memory change of the 4k block and a write of the entire modified
>> 64k block to a new location. But writing, say, a 1 MB block should *not*
>> cause the same read on source: after all, the read data will be
>> immediately discarded, overwritten by the changed 1 MB block.
>>
>> However, my testing shows that source chunks are always read, even when
>> completely overwritten.
>>
>> Am I missing something?
>>
>> --
>> Danti Gionatan
>> Supporto Tecnico
>> Assyoma S.r.l. - www.assyoma.it
>> email: g.danti@assyoma.it - info@assyoma.it
>> GPG public key ID: FF5F32A8
>>
>

--0000000000003bdd740595923115
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>And the block size for thick snapshots can be set whe=
n using the lvcreate command.</div><div>And the automatic growing of a snap=
shot can be configured too in the lvm configuration.</div><div><br></div><d=
iv>Same issues with both thin and thick, if you run out of space.</div><div=
>//T</div></div><br><div class=3D"gmail_quote"><div class=3D"gmail_attr" di=
r=3D"ltr">Den ons 23 okt. 2019 kl 13:24 skrev Tomas Dalebj=C3=B6rk &lt;<a h=
ref=3D"mailto:tomas.dalebjork@gmail.com">tomas.dalebjork@gmail.com</a>&gt;:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1p=
x;border-left-style:solid"><div dir=3D"ltr"><div>I have tested FusionIO tog=
ether with old thick snapshots.</div><div>I created the thick snapshot on a=
 separate old traditional SATA drive, just to check if that could be used a=
s a snapshot target for high performance disks; like a Fusion IO card.</div=
><div>For those who doesn&#39;t know about FusionIO; they can deal with 150=
-250,000 IOPS.<br></div><div><br></div><div>And to be honest, I couldn&#39;=
t bottle neck the SATA disk I used as a thick snapshot target.</div><div>Th=
e reason for why is simple:</div><div>- thick snapshots uses sequential wri=
te techniques</div><div><br></div><div>If I would have been using thin snap=
shots, than the writes would most likely be more randomized on disk, which =
would have required more spindles to coop with this.</div><div><br></div><d=
iv>Anyhow;</div><div>I am still eager to hear how to use an external device=
 to import snapshots.</div><div>And when I say &quot;import&quot;; I am not=
 talking about copyback, more to use to read data from.</div><div><br></div=
><div>Regards Tomas</div></div><br><div class=3D"gmail_quote"><div class=3D=
"gmail_attr" dir=3D"ltr">Den ons 23 okt. 2019 kl 13:08 skrev Gionatan Danti=
 &lt;<a href=3D"mailto:g.danti@assyoma.it" target=3D"_blank">g.danti@assyom=
a.it</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-=
left-width:1px;border-left-style:solid">On 23/10/19 12:46, Zdenek Kabelac w=
rote:<br>
&gt; Just few &#39;comments&#39; - it&#39;s not really comparable - the eff=
iciency of <br>
&gt; thin-pool metadata outperforms old snapshot in BIG way (there is no <b=
r>
&gt; point to talk about snapshots that takes just couple of MiB)<br>
<br>
Yes, this matches my experience.<br>
<br>
&gt; There is also BIG difference about the usage of old snapshot origin an=
d <br>
&gt; snapshot.<br>
&gt; <br>
&gt; COW of old snapshot effectively cuts performance 1/2 if you write to <=
br>
&gt; origin.<br>
<br>
If used without non-volatile RAID controller, 1/2 is generous - I <br>
measured performance as low as 1/5 (with fat snapshot).<br>
<br>
Talking about thin snapshot, an obvious performance optimization which <br>
seems to not be implemented is to skip reading source data when <br>
overwriting in larger-than-chunksize blocks.<br>
<br>
For example, consider a completely filled 64k chunk thin volume (with <br>
thinpool having ample free space). Snapshotting it and writing a 4k <br>
block on origin will obviously cause a read of the original 64k chunk, <br>
an in-memory change of the 4k block and a write of the entire modified <br>
64k block to a new location. But writing, say, a 1 MB block should *not* <b=
r>
cause the same read on source: after all, the read data will be <br>
immediately discarded, overwritten by the changed 1 MB block.<br>
<br>
However, my testing shows that source chunks are always read, even when <br=
>
completely overwritten.<br>
<br>
Am I missing something?<br>
<br>
-- <br>
Danti Gionatan<br>
Supporto Tecnico<br>
Assyoma S.r.l. - <a href=3D"http://www.assyoma.it" target=3D"_blank" rel=3D=
"noreferrer">www.assyoma.it</a><br>
email: <a href=3D"mailto:g.danti@assyoma.it" target=3D"_blank">g.danti@assy=
oma.it</a> - <a href=3D"mailto:info@assyoma.it" target=3D"_blank">info@assy=
oma.it</a><br>
GPG public key ID: FF5F32A8<br>
</blockquote></div>
</blockquote></div>

--0000000000003bdd740595923115--

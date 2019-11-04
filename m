MIME-Version: 1.0
References: <CACrcyfJE2rEGTVOGTXGTf08w1Z-js8xTRshibCm+PuZNxp3OUA@mail.gmail.com>
	<5BDF90CF-72E7-44A0-8C78-7854B2B8996A@gmail.com>
	<29ad8317-4a55-f017-6a0b-c06bf40ccab8@redhat.com>
In-Reply-To: <29ad8317-4a55-f017-6a0b-c06bf40ccab8@redhat.com>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Mon, 4 Nov 2019 15:40:59 +0100
Message-ID: <CACrcyfJxYvr7BC6Srts1bnNWLxsme8d3hjEQqYQyBz9sqbNp6g@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008bb4a50596864ecd"
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--0000000000008bb4a50596864ecd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for feedback.

Let me try to type different scenarios:

We have an origin volume, lets call it: /dev/vg00/lv00
We convert a snapshot volume to origin volume, lets call it:
/dev/vg00/lv00-snap
- all blocks has been changed, and are represented in the
/dev/vg00/lv00-snap, when we start the lvconvert process

I assume that something reads the data from /dev/vg00/lv00-snap and copy
that to /dev/vg00/lv00
It will most likely start from the first block, to the last block to copy.
The block size is 1MB on /dev/vg00/lv00-snap, and we have for simplicity
the same block size on the origin /dev/vg00/lv00

Scenario 1: A read comes want to read block LP 100, but lvconvert has not
yet copied that LP block.
Will the read comes from /dev/vg00/lv00-snap directly and delivered to
requestor?
Or will lvconvert prioritize to copy data from /dev/vg00/lv00-snap to
/dev/vg00/lv00 for that block, and let the requestor wait until the copying
has been completed, so that a read operation can happen from origin?
Or will the requestor have to wait until the copy data from
/dev/vg00/lv00-snap to /dev/vg00/lv00 for that block has been completed,
without any prioritization?

Scenario 2: A write comes want to write block LP 100, but lvconvert has not
yet copied that LP block (yes, I do understand that origin is hidden now)
Will lvconvery prioritize to copy data from /dev/vg00/lv00-snap to
/dev/vg00/lv00 for that block, and let the requestor write the changes
directly on the origin after the copying has been performed?
Or will the write be blocked until lvconvert has finished the copying of
the requested block, and than a write can be accepted to the origin?
Or where will the changes be written?

It is important for me to understand, as the backup device that I want to
map as a COW device is a read only target, and is not allowed to be written
to.
If read happends from the backup COW device, and writes happends to the
origin, than it is possible to create an instant recovery.
If writes happends to the backup COW device, than it not that easy to
implement a instance reovery solution, as the backup device is write
protected.

Thanks in advance.

Den m=C3=A5n 4 nov. 2019 kl 11:07 skrev Zdenek Kabelac <zkabelac@redhat.com=
>:

> Dne 04. 11. 19 v 6:54 Tomas Dalebj=C3=B6rk napsal(a):
> > Hi
> >
> > I have some additional questions related to this.
> > regarding this statement:
> > =E2=80=9C While the merge is in progress, reads or writes to the origin=
 appear
> as they
> > were directed to the snapshot being merged. =E2=80=9D
> >
> > What exactly does that mean?
> >
> > Will that mean that before changes are being placed on the origin
> device, it
> > has to first:
> > read the data from the snapshot back to origin, copy the data back from
> origin
> > to the snapshot, and than after that allow changes to happen?
> > if that is the case, does it keep track of that this block should not b=
e
> > copied again?
>
> Hi
>
> When the 'merge' is in progress -  your 'origin' is no longer accessible
> for your normal usage. It's hiddenly active and only usable by
> snapshot-merge
> target)
>
> So during 'merging' - you can already use you snapshot like if it would b=
e
> and
> origin - and in the background there is a process that reads data from
> 'snapshot' COW device and copies them back to hidden origin.
> (this is what you can observe with 'lvs' and copy%)
>
> So any 'new' writes to such device lends at right place -  reads are
> either
> from COW (if the block has not yet been merged) or from origin.
>
> Once all blocks from 'COW' are merged into origing - tables are remapped
> again
> so all 'supportive' devices are removed and only your 'now fully merged'
> origin becomes present for usage (while still being fully online)
>
> Hopefully it gets more clear.
>
>
> For more explanation how DM works - probably visit:
> http://people.redhat.com/agk/talks/
>
> > and will the ongoing merge priorities this block before the other
> background
> > copying?
> >
> > how about read operations ?
> > will the requested read operations on the origin volume be prioritized
> before
> > the copying of snapshot data?
>
> The priority is that you always get proper block.
> Don't seek there the 'top most' performance - the correctness was always
> the
> priority there and for long time there is no much devel effort on this
> ancient
> target - since  thin-pool usage is simply way more superior....
>
> 1st. note - major difficulty comes from ONLINE usage. If you do NOT need
> device to be online (aka you keep 'reserve' copy of device) - you can
> merge
> things directly into a device - and I simply don't see why you would want
> to
> complicate this whole with extra step of transforming data into COW forma=
t
> first and the do online merge.
>
> 2nd. note - clearly one cannot start 'merge' of snapshot into origin whil=
e
> such origin device is in-use (i.e. mounted) - as that would lead to
> 'modification' of such filesystem under its hands.
>
> Regards
>
> Zdenek
>
>

--0000000000008bb4a50596864ecd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for feedback.</div><div><br></div><div>Let me =
try to type different scenarios:</div><div><br></div><div>We have an origin=
 volume, lets call it: /dev/vg00/lv00</div><div>We convert a snapshot volum=
e to origin volume, lets call it: /dev/vg00/lv00-snap</div><div>- all block=
s has been changed, and are represented in the /dev/vg00/lv00-snap, when we=
 start the lvconvert process</div><div><br></div><div>I assume that somethi=
ng reads the data from /dev/vg00/lv00-snap and copy that to /dev/vg00/lv00<=
/div><div>It will most likely start from the first block, to the last block=
 to copy.</div><div>The block size is 1MB on /dev/vg00/lv00-snap, and we ha=
ve for simplicity the same block size on the origin /dev/vg00/lv00</div><di=
v><br></div><div>Scenario 1: A read comes want to read block LP 100, but lv=
convert has not yet copied that LP block.</div><div>Will the read comes fro=
m /dev/vg00/lv00-snap directly and delivered to requestor?</div><div>Or wil=
l lvconvert prioritize to copy data from /dev/vg00/lv00-snap to /dev/vg00/l=
v00 for that block, and let the requestor wait until the copying has been c=
ompleted, so that a read operation can happen from origin?</div><div>Or wil=
l the requestor have to wait until the copy data from /dev/vg00/lv00-snap t=
o /dev/vg00/lv00 for that block has been completed, without any prioritizat=
ion?</div><div><br></div><div>Scenario 2: A write comes want to write block=
 LP 100, but lvconvert has not yet copied that LP block (yes, I do understa=
nd that origin is hidden now)</div><div>Will lvconvery prioritize to copy d=
ata from /dev/vg00/lv00-snap to /dev/vg00/lv00 for that block, and let the =
requestor write the changes directly on the origin after the copying has be=
en performed?</div><div>Or will the write be blocked until lvconvert has fi=
nished the copying of the requested block, and than a write can be accepted=
 to the origin?</div><div>Or where will the changes be written?</div><div><=
br></div><div>It is important for me to understand, as the backup device th=
at I want to map as a COW device is a read only target, and is not allowed =
to be written to.</div><div>If read happends from the backup COW device, an=
d writes happends to the origin, than it is possible to create an instant r=
ecovery.</div><div>If writes happends to the backup COW device, than it not=
 that easy to implement a instance reovery solution, as the backup device i=
s write protected.</div><div><br></div><div>Thanks in advance.<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den=
 m=C3=A5n 4 nov. 2019 kl 11:07 skrev Zdenek Kabelac &lt;<a href=3D"mailto:z=
kabelac@redhat.com">zkabelac@redhat.com</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Dne 04. 11. 19 v 6:54 Tomas Dalebj=C3=B6rk=
 napsal(a):<br>
&gt; Hi<br>
&gt; <br>
&gt; I have some additional questions related to this.<br>
&gt; regarding this statement:<br>
&gt; =E2=80=9C=C2=A0While the merge is in progress, reads or writes to the =
origin appear as they <br>
&gt; were directed to the snapshot being merged. =E2=80=9D<br>
&gt; <br>
&gt; What exactly does that mean?<br>
&gt; <br>
&gt; Will that mean that before changes are being placed on the origin devi=
ce, it <br>
&gt; has to first:<br>
&gt; read the data from the snapshot back to origin, copy the data back fro=
m origin <br>
&gt; to the snapshot, and than after that allow changes to happen?<br>
&gt; if that is the case, does it keep track of that this block should not =
be <br>
&gt; copied again?<br>
<br>
Hi<br>
<br>
When the &#39;merge&#39; is in progress -=C2=A0 your &#39;origin&#39; is no=
 longer accessible<br>
for your normal usage. It&#39;s hiddenly active and only usable by snapshot=
-merge <br>
target)<br>
<br>
So during &#39;merging&#39; - you can already use you snapshot like if it w=
ould be and<br>
origin - and in the background there is a process that reads data from <br>
&#39;snapshot&#39; COW device and copies them back to hidden origin.<br>
(this is what you can observe with &#39;lvs&#39; and copy%)<br>
<br>
So any &#39;new&#39; writes to such device lends at right place -=C2=A0 rea=
ds are either <br>
from COW (if the block has not yet been merged) or from origin.<br>
<br>
Once all blocks from &#39;COW&#39; are merged into origing - tables are rem=
apped again<br>
so all &#39;supportive&#39; devices are removed and only your &#39;now full=
y merged&#39; <br>
origin becomes present for usage (while still being fully online)<br>
<br>
Hopefully it gets more clear.<br>
<br>
<br>
For more explanation how DM works - probably visit:<br>
<a href=3D"http://people.redhat.com/agk/talks/" rel=3D"noreferrer" target=
=3D"_blank">http://people.redhat.com/agk/talks/</a><br>
<br>
&gt; and will the ongoing merge priorities this block before the other back=
ground <br>
&gt; copying?<br>
&gt; <br>
&gt; how about read operations ?<br>
&gt; will the requested read operations on the origin volume be prioritized=
 before <br>
&gt; the copying of snapshot data?<br>
<br>
The priority is that you always get proper block.<br>
Don&#39;t seek there the &#39;top most&#39; performance - the correctness w=
as always the <br>
priority there and for long time there is no much devel effort on this anci=
ent <br>
target - since=C2=A0 thin-pool usage is simply way more superior....<br>
<br>
1st. note - major difficulty comes from ONLINE usage. If you do NOT need <b=
r>
device to be online (aka you keep &#39;reserve&#39; copy of device) - you c=
an merge <br>
things directly into a device - and I simply don&#39;t see why you would wa=
nt to <br>
complicate this whole with extra step of transforming data into COW format =
<br>
first and the do online merge.<br>
<br>
2nd. note - clearly one cannot start &#39;merge&#39; of snapshot into origi=
n while <br>
such origin device is in-use (i.e. mounted) - as that would lead to <br>
&#39;modification&#39; of such filesystem under its hands.<br>
<br>
Regards<br>
<br>
Zdenek<br>
<br>
</blockquote></div>

--0000000000008bb4a50596864ecd--

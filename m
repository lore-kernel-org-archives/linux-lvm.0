MIME-Version: 1.0
References: <CACrcyfJE2rEGTVOGTXGTf08w1Z-js8xTRshibCm+PuZNxp3OUA@mail.gmail.com>
	<5BDF90CF-72E7-44A0-8C78-7854B2B8996A@gmail.com>
	<29ad8317-4a55-f017-6a0b-c06bf40ccab8@redhat.com>
	<CACrcyfJxYvr7BC6Srts1bnNWLxsme8d3hjEQqYQyBz9sqbNp6g@mail.gmail.com>
	<alpine.LRH.2.02.1911051131360.14929@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.1911051131360.14929@file01.intranet.prod.int.rdu2.redhat.com>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Tue, 5 Nov 2019 21:56:27 +0100
Message-ID: <CACrcyf+7r6-SExT9wkBvN+LREZRHHux-3-0hrP5pkSqUL8z_Sw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000039ebaa05969faba9"
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
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

--00000000000039ebaa05969faba9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks,

That really helped me to understand how the snapshot works.
Last question:
- lets say that block 100 which is 1MB in size is in the cow device, and a
write happen that wants to something or all data on that region of block
100.
Than I assume; based on what have been previously said here, that the block
in the cow device will be overwritten with the new changes.

Regards Tomas

Den tis 5 nov. 2019 kl 17:40 skrev Mikulas Patocka <mpatocka@redhat.com>:

>
>
> On Mon, 4 Nov 2019, Tomas Dalebj=C3=B6rk wrote:
>
> > Thanks for feedback.
> >
> > Let me try to type different scenarios:
> >
> > We have an origin volume, lets call it: /dev/vg00/lv00
> > We convert a snapshot volume to origin volume, lets call it:
> /dev/vg00/lv00-snap
> > - all blocks has been changed, and are represented in the
> /dev/vg00/lv00-snap, when we start the lvconvert process
> >
> > I assume that something reads the data from /dev/vg00/lv00-snap and cop=
y
> that to /dev/vg00/lv00
> > It will most likely start from the first block, to the last block to
> copy.
>
> Merging starts from the last block on the lv00-snap device and it proceed=
s
> backward to the beginning.
>
> > The block size is 1MB on /dev/vg00/lv00-snap, and we have for simplicit=
y
> the same block size on the origin /dev/vg00/lv00
> >
> > Scenario 1: A read comes want to read block LP 100, but lvconvert has
> not yet copied that LP block.
> > Will the read comes from /dev/vg00/lv00-snap directly and delivered to
> requestor?
>
> Yes.
>
> > Or will lvconvert prioritize to copy data from /dev/vg00/lv00-snap to
> /dev/vg00/lv00 for that block, and let the requestor wait until the copyi=
ng
> has been completed, so
> > that a read operation can happen from origin?
> > Or will the requestor have to wait until the copy data from
> /dev/vg00/lv00-snap to /dev/vg00/lv00 for that block has been completed,
> without any prioritization?
>
> It only waits if you attempt to read or write the block that is currently
> being copied.
>
> If you read data that hasn't been merged yet, it reads from the snapshot,
> if you read data that has been merged, it reads from the origin, if you
> read data that is currently being copied, it waits.
>
> > Scenario 2: A write comes want to write block LP 100, but lvconvert has
> not yet copied that LP block (yes, I do understand that origin is hidden
> now)
> > Will lvconvery prioritize to copy data from /dev/vg00/lv00-snap to
> /dev/vg00/lv00 for that block, and let the requestor write the changes
> directly on the origin after the
> > copying has been performed?
>
> No.
>
> > Or will the write be blocked until lvconvert has finished the copying o=
f
> the requested block, and than a write can be accepted to the origin?
> > Or where will the changes be written?
>
> The changes will be written to the lv00-snap device.
>
> If you write data that hasn't been merged yet, the write is redirected to
> the lv00-snap device. If you write data that has already been merged, the
> write is directed to the origin device. If you write data that is
> currently being merged, it waits.
>
> > It is important for me to understand, as the backup device that I want
> to map as a COW device is a read only target, and is not allowed to be
> written to.
>
> You can't have read-only COW device. Both metadata and data on the COW
> device are updated during the merge.
>
> > If read happends from the backup COW device, and writes happends to the
> origin, than it is possible to create an instant recovery.
> > If writes happends to the backup COW device, than it not that easy to
> implement a instance reovery solution, as the backup device is write
> protected.
> >
> > Thanks in advance.
>
> Mikulas

--00000000000039ebaa05969faba9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks,</div><div><br></div><div>That really helped m=
e to understand how the snapshot works.</div><div>Last question:</div><div>=
- lets say that block 100 which is 1MB in size is in the cow device, and a =
write happen that wants to something or all data on that region of block 10=
0.</div><div>Than I assume; based on what have been previously said here, t=
hat the block in the cow device will be overwritten with the new changes.</=
div><div><br></div><div>Regards Tomas<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den tis 5 nov. 2019 kl 17:40=
 skrev Mikulas Patocka &lt;<a href=3D"mailto:mpatocka@redhat.com">mpatocka@=
redhat.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
<br>
On Mon, 4 Nov 2019, Tomas Dalebj=C3=B6rk wrote:<br>
<br>
&gt; Thanks for feedback.<br>
&gt; <br>
&gt; Let me try to type different scenarios:<br>
&gt; <br>
&gt; We have an origin volume, lets call it: /dev/vg00/lv00<br>
&gt; We convert a snapshot volume to origin volume, lets call it: /dev/vg00=
/lv00-snap<br>
&gt; - all blocks has been changed, and are represented in the /dev/vg00/lv=
00-snap, when we start the lvconvert process<br>
&gt; <br>
&gt; I assume that something reads the data from /dev/vg00/lv00-snap and co=
py that to /dev/vg00/lv00<br>
&gt; It will most likely start from the first block, to the last block to c=
opy.<br>
<br>
Merging starts from the last block on the lv00-snap device and it proceeds =
<br>
backward to the beginning.<br>
<br>
&gt; The block size is 1MB on /dev/vg00/lv00-snap, and we have for simplici=
ty the same block size on the origin /dev/vg00/lv00<br>
&gt; <br>
&gt; Scenario 1: A read comes want to read block LP 100, but lvconvert has =
not yet copied that LP block.<br>
&gt; Will the read comes from /dev/vg00/lv00-snap directly and delivered to=
 requestor?<br>
<br>
Yes.<br>
<br>
&gt; Or will lvconvert prioritize to copy data from /dev/vg00/lv00-snap to =
/dev/vg00/lv00 for that block, and let the requestor wait until the copying=
 has been completed, so<br>
&gt; that a read operation can happen from origin?<br>
&gt; Or will the requestor have to wait until the copy data from /dev/vg00/=
lv00-snap to /dev/vg00/lv00 for that block has been completed, without any =
prioritization?<br>
<br>
It only waits if you attempt to read or write the block that is currently <=
br>
being copied.<br>
<br>
If you read data that hasn&#39;t been merged yet, it reads from the snapsho=
t, <br>
if you read data that has been merged, it reads from the origin, if you <br=
>
read data that is currently being copied, it waits.<br>
<br>
&gt; Scenario 2: A write comes want to write block LP 100, but lvconvert ha=
s not yet copied that LP block (yes, I do understand that origin is hidden =
now)<br>
&gt; Will lvconvery prioritize to copy data from /dev/vg00/lv00-snap to /de=
v/vg00/lv00 for that block, and let the requestor write the changes directl=
y on the origin after the<br>
&gt; copying has been performed?<br>
<br>
No.<br>
<br>
&gt; Or will the write be blocked until lvconvert has finished the copying =
of the requested block, and than a write can be accepted to the origin?<br>
&gt; Or where will the changes be written?<br>
<br>
The changes will be written to the lv00-snap device.<br>
<br>
If you write data that hasn&#39;t been merged yet, the write is redirected =
to <br>
the lv00-snap device. If you write data that has already been merged, the <=
br>
write is directed to the origin device. If you write data that is <br>
currently being merged, it waits.<br>
<br>
&gt; It is important for me to understand, as the backup device that I want=
 to map as a COW device is a read only target, and is not allowed to be wri=
tten to.<br>
<br>
You can&#39;t have read-only COW device. Both metadata and data on the COW =
<br>
device are updated during the merge.<br>
<br>
&gt; If read happends from the backup COW device, and writes happends to th=
e origin, than it is possible to create an instant recovery.<br>
&gt; If writes happends to the backup COW device, than it not that easy to =
implement a instance reovery solution, as the backup device is write protec=
ted.<br>
&gt; <br>
&gt; Thanks in advance.<br>
<br>
Mikulas</blockquote></div>

--00000000000039ebaa05969faba9--

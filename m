Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9LJ3rKQ004798
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 15:03:53 -0400
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.211.195])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9LJ3Xcd027195
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 15:03:34 -0400
Received: by ywh33 with SMTP id 33so6000022ywh.23
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 12:03:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
References: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com>
	<c268e4660910191103x606dd07nf89aee516f8756c9@mail.gmail.com>
	<a5a956f70910191114r3025ec45r5ddb2e02620fb0c0@mail.gmail.com>
	<c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com>
	<a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com>
	<c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>
	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>
	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
Date: Wed, 21 Oct 2009 15:03:24 -0400
Message-ID: <a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
From: Lou Arnold <larnolda1@gmail.com>
Content-Type: multipart/mixed; boundary=001636ed73d01d685b047676a20b
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--001636ed73d01d685b047676a20b
Content-Type: multipart/alternative; boundary=001636ed73d01d6855047676a209

--001636ed73d01d6855047676a209
Content-Type: text/plain; charset=ISO-8859-1

I read the How-To. It doesn't talk about the specific case or being mounted
at root, so I had to experiment. It is likely that commands were in the
wrong order, but I don't know what the right order is.

I have attached the terminal session I used. In the end it did not work.
There was still 66 GB free, and when I rebooted, the file system failed. The
superblock was too big.

I obviously don't understand the difference between pvresize, lvreduce and
vgreduce, and how  resize2fs  is related to these commands.

Hope you can help,
Lou.


On 10/21/09, Drew <drew.kay@gmail.com> wrote:
>
> > The documentation wasn't specific. I believe the intent was simply to
> > migrate the data to another logical volume to temporarily allow the
> source
> > volume to be reduced and/or removed. But let's assume that has happened
> or
> > that doesn't need to happen. So now we need to unmount LogVol00, reduce
> it
> > to its original nunber of extents and then remount it (either before or
> > after remount we remove the physical drive.) I assume you can't try this
> or
> > you'll screw up your computer, but I have a system that I screw up and
> > easily restore from a OS image. So no need to be too cautious.
>
> I've done this on several occasions.
>
> If you want to play with various scenarios in LVM, I'd recommend
> reading the LVM How-To @ http://tldp.org/HOWTO/LVM-HOWTO/ . Sections
> 11 & 13 cover the most common tasks you'll encounter in LVM. Play
> around, don't be afraid to break things, and if you have questions
> feel free to give the list a shout.
>
>
> --
> Drew
>
> "Nothing in life is to be feared. It is only to be understood."
> --Marie Curie
>

--001636ed73d01d6855047676a209
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>I read the How-To. It doesn&#39;t talk about the specific case or bein=
g mounted at root, so I had to experiment. It is likely that=A0commands wer=
e=A0in the wrong order, but I don&#39;t know what the right order is.</div>
<div>=A0</div>
<div>I have attached the terminal session I used. In the end it did not wor=
k. There was still 66 GB free, and when I rebooted, the file system failed.=
 The superblock was too big.</div>
<div>=A0</div>
<div>I obviously don&#39;t understand the difference between pvresize, lvre=
duce and vgreduce, and how=A0 resize2fs=A0 is related to these commands.</d=
iv>
<div>=A0</div>
<div>Hope you can help,</div>
<div>Lou.<br><br>=A0</div>
<div><span class=3D"gmail_quote">On 10/21/09, <b class=3D"gmail_sendername"=
>Drew</b> &lt;<a href=3D"mailto:drew.kay@gmail.com">drew.kay@gmail.com</a>&=
gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">&gt; The documentation wasn&#39;=
t specific. I believe the intent was simply to<br>&gt; migrate the data to =
another logical volume to temporarily allow the source<br>
&gt; volume to be reduced and/or removed. But let&#39;s assume that has hap=
pened or<br>&gt; that doesn&#39;t need to happen. So now we need to unmount=
 LogVol00, reduce it<br>&gt; to its original nunber of extents and then rem=
ount it (either before or<br>
&gt; after remount we remove the physical drive.) I assume you can&#39;t tr=
y this or<br>&gt; you&#39;ll screw up your computer, but I have a system th=
at I screw up and<br>&gt; easily restore from a OS image. So no need to be =
too cautious.<br>
<br>I&#39;ve done this on several occasions.<br><br>If you want to play wit=
h various scenarios in LVM, I&#39;d recommend<br>reading the LVM How-To @ <=
a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO=
/</a> . Sections<br>
11 &amp; 13 cover the most common tasks you&#39;ll encounter in LVM. Play<b=
r>around, don&#39;t be afraid to break things, and if you have questions<br=
>feel free to give the list a shout.<br><br><br>--<br>Drew<br><br>&quot;Not=
hing in life is to be feared. It is only to be understood.&quot;<br>
--Marie Curie<br></blockquote></div><br>

--001636ed73d01d6855047676a209--

--001636ed73d01d685b047676a20b
Content-Type: text/plain; charset=US-ASCII; name="UndoTrial1.txt"
Content-Disposition: attachment; filename="UndoTrial1.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g12g5ord

W3Jvb3RAc2hvZSB+XSMgdmdkaXNwbGF5CiAgLS0tIFZvbHVtZSBncm91cCAtLS0KICBWRyBOYW1l
ICAgICAgICAgICAgICAgVm9sR3JvdXAwMAogIFN5c3RlbSBJRCAgICAgICAgICAgICAKICBGb3Jt
YXQgICAgICAgICAgICAgICAgbHZtMgogIE1ldGFkYXRhIEFyZWFzICAgICAgICAyCiAgTWV0YWRh
dGEgU2VxdWVuY2UgTm8gIDcKICBWRyBBY2Nlc3MgICAgICAgICAgICAgcmVhZC93cml0ZQogIFZH
IFN0YXR1cyAgICAgICAgICAgICByZXNpemFibGUKICBNQVggTFYgICAgICAgICAgICAgICAgMAog
IEN1ciBMViAgICAgICAgICAgICAgICAyCiAgT3BlbiBMViAgICAgICAgICAgICAgIDIKICBNYXgg
UFYgICAgICAgICAgICAgICAgMAogIEN1ciBQViAgICAgICAgICAgICAgICAyCiAgQWN0IFBWICAg
ICAgICAgICAgICAgIDIKICBWRyBTaXplICAgICAgICAgICAgICAgNzUuMTYgR0IKICBQRSBTaXpl
ICAgICAgICAgICAgICAgMzIuMDAgTUIKICBUb3RhbCBQRSAgICAgICAgICAgICAgMjQwNQogIEFs
bG9jIFBFIC8gU2l6ZSAgICAgICAyNDA1IC8gNzUuMTYgR0IKICBGcmVlICBQRSAvIFNpemUgICAg
ICAgMCAvIDAgICAKICBWRyBVVUlEICAgICAgICAgICAgICAganZ6NnhLLU9DVHUtTlVmYi01c3Nr
LVFIRUktS29zQy1QSGlKZmYKICAgCltyb290QHNob2Ugfl0jIHB2ZGlzcGxheSAvZGV2L2hkZAog
IC0tLSBQaHlzaWNhbCB2b2x1bWUgLS0tCiAgUFYgTmFtZSAgICAgICAgICAgICAgIC9kZXYvaGRk
CiAgVkcgTmFtZSAgICAgICAgICAgICAgIFZvbEdyb3VwMDAKICBQViBTaXplICAgICAgICAgICAg
ICAgMzguMDIgR0IgLyBub3QgdXNhYmxlIDE5LjA1IE1CCiAgQWxsb2NhdGFibGUgICAgICAgICAg
IHllcyAoYnV0IGZ1bGwpCiAgUEUgU2l6ZSAoS0J5dGUpICAgICAgIDMyNzY4CiAgVG90YWwgUEUg
ICAgICAgICAgICAgIDEyMTYKICBGcmVlIFBFICAgICAgICAgICAgICAgMAogIEFsbG9jYXRlZCBQ
RSAgICAgICAgICAxMjE2CiAgUFYgVVVJRCAgICAgICAgICAgICAgIGdnU1BqOC1OMzZOLWR0QzEt
VTVzTC1wdzIzLXViR2otQWRGOUgzCiAgIApbcm9vdEBzaG9lIH5dIyBkZiAtaApGaWxlc3lzdGVt
ICAgICAgICAgICAgU2l6ZSAgVXNlZCBBdmFpbCBVc2UlIE1vdW50ZWQgb24KL2Rldi9tYXBwZXIv
Vm9sR3JvdXAwMC1Mb2dWb2wwMAogICAgICAgICAgICAgICAgICAgICAgIDcyRyAgMi4yRyAgIDY3
RyAgIDQlIC8KL2Rldi9oZGExICAgICAgICAgICAgICA5OU0gICAxOE0gICA3Nk0gIDE5JSAvYm9v
dAp0bXBmcyAgICAgICAgICAgICAgICAgMjUyTSAgICAgMCAgMjUyTSAgIDAlIC9kZXYvc2htCgpb
cm9vdEBzaG9lIH5dIyBwdmRpc3BsYXkgLW0KICAtLS0gUGh5c2ljYWwgdm9sdW1lIC0tLQogIFBW
IE5hbWUgICAgICAgICAgICAgICAvZGV2L2hkYTIKICBWRyBOYW1lICAgICAgICAgICAgICAgVm9s
R3JvdXAwMAogIFBWIFNpemUgICAgICAgICAgICAgICAzNy4xNyBHQiAvIG5vdCB1c2FibGUgMTIu
MjQgTUIKICBBbGxvY2F0YWJsZSAgICAgICAgICAgeWVzIChidXQgZnVsbCkKICBQRSBTaXplIChL
Qnl0ZSkgICAgICAgMzI3NjgKICBUb3RhbCBQRSAgICAgICAgICAgICAgMTE4OQogIEZyZWUgUEUg
ICAgICAgICAgICAgICAwCiAgQWxsb2NhdGVkIFBFICAgICAgICAgIDExODkKICBQViBVVUlEICAg
ICAgICAgICAgICAgdkV1S2VjLTBzWWgtNkgzdS0zMExkLUFxMVMtVXlXTi1pNnZ3RXIKICAgCiAg
LS0tIFBoeXNpY2FsIFNlZ21lbnRzIC0tLQogIFBoeXNpY2FsIGV4dGVudCAwIHRvIDExNTY6CiAg
ICBMb2dpY2FsIHZvbHVtZSAgICAgIC9kZXYvVm9sR3JvdXAwMC9Mb2dWb2wwMAogICAgTG9naWNh
bCBleHRlbnRzICAgICAwIHRvIDExNTYKICBQaHlzaWNhbCBleHRlbnQgMTE1NyB0byAxMTg4Ogog
ICAgTG9naWNhbCB2b2x1bWUgICAgICAvZGV2L1ZvbEdyb3VwMDAvTG9nVm9sMDEKICAgIExvZ2lj
YWwgZXh0ZW50cyAgICAgMCB0byAzMQogICAKICAtLS0gUGh5c2ljYWwgdm9sdW1lIC0tLQogIFBW
IE5hbWUgICAgICAgICAgICAgICAvZGV2L2hkZAogIFZHIE5hbWUgICAgICAgICAgICAgICBWb2xH
cm91cDAwCiAgUFYgU2l6ZSAgICAgICAgICAgICAgIDM4LjAyIEdCIC8gbm90IHVzYWJsZSAxOS4w
NSBNQgogIEFsbG9jYXRhYmxlICAgICAgICAgICB5ZXMgKGJ1dCBmdWxsKQogIFBFIFNpemUgKEtC
eXRlKSAgICAgICAzMjc2OAogIFRvdGFsIFBFICAgICAgICAgICAgICAxMjE2CiAgRnJlZSBQRSAg
ICAgICAgICAgICAgIDAKICBBbGxvY2F0ZWQgUEUgICAgICAgICAgMTIxNgogIFBWIFVVSUQgICAg
ICAgICAgICAgICBnZ1NQajgtTjM2Ti1kdEMxLVU1c0wtcHcyMy11YkdqLUFkRjlIMwogICAKICAt
LS0gUGh5c2ljYWwgU2VnbWVudHMgLS0tCiAgUGh5c2ljYWwgZXh0ZW50IDAgdG8gMTIxNToKICAg
IExvZ2ljYWwgdm9sdW1lICAgICAgL2Rldi9Wb2xHcm91cDAwL0xvZ1ZvbDAwCiAgICBMb2dpY2Fs
IGV4dGVudHMgICAgIDExNTcgdG8gMjM3MgogICAKW3Jvb3RAc2hvZSB+XSMgcHZyZXNpemUgLS1z
ZXRwaHlzaWNhbHZvbHVtZXNpemUgMDBHIC9kZXYvaGRkCiAgUGh5c2ljYWwgdm9sdW1lICIvZGV2
L2hkZCIgY2hhbmdlZAogIDEgcGh5c2ljYWwgdm9sdW1lKHMpIHJlc2l6ZWQgLyAwIHBoeXNpY2Fs
IHZvbHVtZShzKSBub3QgcmVzaXplZApbcm9vdEBzaG9lIH5dIyBwdmRpc3BsYXkgLW0KICAtLS0g
UGh5c2ljYWwgdm9sdW1lIC0tLQogIFBWIE5hbWUgICAgICAgICAgICAgICAvZGV2L2hkYTIKICBW
RyBOYW1lICAgICAgICAgICAgICAgVm9sR3JvdXAwMAogIFBWIFNpemUgICAgICAgICAgICAgICAz
Ny4xNyBHQiAvIG5vdCB1c2FibGUgMTIuMjQgTUIKICBBbGxvY2F0YWJsZSAgICAgICAgICAgeWVz
IChidXQgZnVsbCkKICBQRSBTaXplIChLQnl0ZSkgICAgICAgMzI3NjgKICBUb3RhbCBQRSAgICAg
ICAgICAgICAgMTE4OQogIEZyZWUgUEUgICAgICAgICAgICAgICAwCiAgQWxsb2NhdGVkIFBFICAg
ICAgICAgIDExODkKICBQViBVVUlEICAgICAgICAgICAgICAgdkV1S2VjLTBzWWgtNkgzdS0zMExk
LUFxMVMtVXlXTi1pNnZ3RXIKICAgCiAgLS0tIFBoeXNpY2FsIFNlZ21lbnRzIC0tLQogIFBoeXNp
Y2FsIGV4dGVudCAwIHRvIDExNTY6CiAgICBMb2dpY2FsIHZvbHVtZSAgICAgIC9kZXYvVm9sR3Jv
dXAwMC9Mb2dWb2wwMAogICAgTG9naWNhbCBleHRlbnRzICAgICAwIHRvIDExNTYKICBQaHlzaWNh
bCBleHRlbnQgMTE1NyB0byAxMTg4OgogICAgTG9naWNhbCB2b2x1bWUgICAgICAvZGV2L1ZvbEdy
b3VwMDAvTG9nVm9sMDEKICAgIExvZ2ljYWwgZXh0ZW50cyAgICAgMCB0byAzMQogICAKICAtLS0g
UGh5c2ljYWwgdm9sdW1lIC0tLQogIFBWIE5hbWUgICAgICAgICAgICAgICAvZGV2L2hkZAogIFZH
IE5hbWUgICAgICAgICAgICAgICBWb2xHcm91cDAwCiAgUFYgU2l6ZSAgICAgICAgICAgICAgIDM4
LjAyIEdCIC8gbm90IHVzYWJsZSAxOC44NiBNQgogIEFsbG9jYXRhYmxlICAgICAgICAgICB5ZXMg
KGJ1dCBmdWxsKQogIFBFIFNpemUgKEtCeXRlKSAgICAgICAzMjc2OAogIFRvdGFsIFBFICAgICAg
ICAgICAgICAxMjE2CiAgRnJlZSBQRSAgICAgICAgICAgICAgIDAKICBBbGxvY2F0ZWQgUEUgICAg
ICAgICAgMTIxNgogIFBWIFVVSUQgICAgICAgICAgICAgICBnZ1NQajgtTjM2Ti1kdEMxLVU1c0wt
cHcyMy11YkdqLUFkRjlIMwogICAKICAtLS0gUGh5c2ljYWwgU2VnbWVudHMgLS0tCiAgUGh5c2lj
YWwgZXh0ZW50IDAgdG8gMTIxNToKICAgIExvZ2ljYWwgdm9sdW1lICAgICAgL2Rldi9Wb2xHcm91
cDAwL0xvZ1ZvbDAwCiAgICBMb2dpY2FsIGV4dGVudHMgICAgIDExNTcgdG8gMjM3MgogICAKW3Jv
b3RAc2hvZSB+XSMgcHZyZW1vdmUgLWZmIC9kZXYvaGRkClJlYWxseSBXSVBFIExBQkVMUyBmcm9t
IHBoeXNpY2FsIHZvbHVtZSAiL2Rldi9oZGQiIG9mIHZvbHVtZSBncm91cCAiVm9sR3JvdXAwMCIg
W3kvbl0/IHkKICBXQVJOSU5HOiBXaXBpbmcgcGh5c2ljYWwgdm9sdW1lIGxhYmVsIGZyb20gL2Rl
di9oZGQgb2Ygdm9sdW1lIGdyb3VwICJWb2xHcm91cDAwIgogIENhbid0IG9wZW4gL2Rldi9oZGQg
ZXhjbHVzaXZlbHkgLSBub3QgcmVtb3ZpbmcuIE1vdW50ZWQgZmlsZXN5c3RlbT8KCltyb290QHNo
b2Ugfl0jIGx2cmVkdWNlIC1sIC0xMjE2IC9kZXYvbWFwcGVyL1ZvbEdyb3VwMDAtTG9nVm9sMDAK
ICBXQVJOSU5HOiBSZWR1Y2luZyBhY3RpdmUgYW5kIG9wZW4gbG9naWNhbCB2b2x1bWUgdG8gMzYu
MTYgR0IKICBUSElTIE1BWSBERVNUUk9ZIFlPVVIgREFUQSAoZmlsZXN5c3RlbSBldGMuKQpEbyB5
b3UgcmVhbGx5IHdhbnQgdG8gcmVkdWNlIExvZ1ZvbDAwPyBbeS9uXTogeQogIFJlZHVjaW5nIGxv
Z2ljYWwgdm9sdW1lIExvZ1ZvbDAwIHRvIDM2LjE2IEdCCiAgTG9naWNhbCB2b2x1bWUgTG9nVm9s
MDAgc3VjY2Vzc2Z1bGx5IHJlc2l6ZWQKCltyb290QHNob2Ugfl0jIHB2cmVtb3ZlIC1mZiAvZGV2
L2hkZApSZWFsbHkgV0lQRSBMQUJFTFMgZnJvbSBwaHlzaWNhbCB2b2x1bWUgIi9kZXYvaGRkIiBv
ZiB2b2x1bWUgZ3JvdXAgIlZvbEdyb3VwMDAiIFt5L25dPyB5CiAgV0FSTklORzogV2lwaW5nIHBo
eXNpY2FsIHZvbHVtZSBsYWJlbCBmcm9tIC9kZXYvaGRkIG9mIHZvbHVtZSBncm91cCAiVm9sR3Jv
dXAwMCIKICBMYWJlbHMgb24gcGh5c2ljYWwgdm9sdW1lICIvZGV2L2hkZCIgc3VjY2Vzc2Z1bGx5
IHdpcGVkCgpbcm9vdEBzaG9lIH5dIyB2Z3JlZHVjZSAtLXJlbW92ZW1pc3NpbmcgVm9sR3JvdXAw
MAogIENvdWxkbid0IGZpbmQgZGV2aWNlIHdpdGggdXVpZCAnZ2dTUGo4LU4zNk4tZHRDMS1VNXNM
LXB3MjMtdWJHai1BZEY5SDMnLgogIENvdWxkbid0IGZpbmQgZGV2aWNlIHdpdGggdXVpZCAnZ2dT
UGo4LU4zNk4tZHRDMS1VNXNMLXB3MjMtdWJHai1BZEY5SDMnLgogIFdyb3RlIG91dCBjb25zaXN0
ZW50IHZvbHVtZSBncm91cCBWb2xHcm91cDAwCi0tSXRzIG5vdCBjbGVhciB3aHkgdGhlc2UgbWVz
c2FnZXMgY29tZSBvdXQuIFRoZSBQViBpcyBub3QgdGhlcmUgYWNjb3JkaW5nIHRvIHRoZSBMVk0g
R1VJLgoKW3Jvb3RAc2hvZSB+XSMgdmdkaXNwbGF5CiAgLS0tIFZvbHVtZSBncm91cCAtLS0KICBW
RyBOYW1lICAgICAgICAgICAgICAgVm9sR3JvdXAwMAogIFN5c3RlbSBJRCAgICAgICAgICAgICAK
ICBGb3JtYXQgICAgICAgICAgICAgICAgbHZtMgogIE1ldGFkYXRhIEFyZWFzICAgICAgICAxCiAg
TWV0YWRhdGEgU2VxdWVuY2UgTm8gIDEwCiAgVkcgQWNjZXNzICAgICAgICAgICAgIHJlYWQvd3Jp
dGUKICBWRyBTdGF0dXMgICAgICAgICAgICAgcmVzaXphYmxlCiAgTUFYIExWICAgICAgICAgICAg
ICAgIDAKICBDdXIgTFYgICAgICAgICAgICAgICAgMgogIE9wZW4gTFYgICAgICAgICAgICAgICAy
CiAgTWF4IFBWICAgICAgICAgICAgICAgIDAKICBDdXIgUFYgICAgICAgICAgICAgICAgMQogIEFj
dCBQViAgICAgICAgICAgICAgICAxCiAgVkcgU2l6ZSAgICAgICAgICAgICAgIDM3LjE2IEdCCiAg
UEUgU2l6ZSAgICAgICAgICAgICAgIDMyLjAwIE1CCiAgVG90YWwgUEUgICAgICAgICAgICAgIDEx
ODkKICBBbGxvYyBQRSAvIFNpemUgICAgICAgMTE4OSAvIDM3LjE2IEdCCiAgRnJlZSAgUEUgLyBT
aXplICAgICAgIDAgLyAwICAgCiAgVkcgVVVJRCAgICAgICAgICAgICAgIGp2ejZ4Sy1PQ1R1LU5V
ZmItNXNzay1RSEVJLUtvc0MtUEhpSmZmCiAgIApbcm9vdEBzaG9lIH5dIyBsdmRpc3BsYXkKICAt
LS0gTG9naWNhbCB2b2x1bWUgLS0tCiAgTFYgTmFtZSAgICAgICAgICAgICAgICAvZGV2L1ZvbEdy
b3VwMDAvTG9nVm9sMDAKICBWRyBOYW1lICAgICAgICAgICAgICAgIFZvbEdyb3VwMDAKICBMViBV
VUlEICAgICAgICAgICAgICAgIFExeWdjMC1JMnpqLTFoUVUtZ0RBYS1NZHpLLXRUYVAtZ0xIekx0
CiAgTFYgV3JpdGUgQWNjZXNzICAgICAgICByZWFkL3dyaXRlCiAgTFYgU3RhdHVzICAgICAgICAg
ICAgICBhdmFpbGFibGUKICAjIG9wZW4gICAgICAgICAgICAgICAgIDEKICBMViBTaXplICAgICAg
ICAgICAgICAgIDM2LjE2IEdCCiAgQ3VycmVudCBMRSAgICAgICAgICAgICAxMTU3CiAgU2VnbWVu
dHMgICAgICAgICAgICAgICAxCiAgQWxsb2NhdGlvbiAgICAgICAgICAgICBpbmhlcml0CiAgUmVh
ZCBhaGVhZCBzZWN0b3JzICAgICBhdXRvCiAgLSBjdXJyZW50bHkgc2V0IHRvICAgICAyNTYKICBC
bG9jayBkZXZpY2UgICAgICAgICAgIDI1MzowCiAgIAogIC0tLSBMb2dpY2FsIHZvbHVtZSAtLS0K
ICBMViBOYW1lICAgICAgICAgICAgICAgIC9kZXYvVm9sR3JvdXAwMC9Mb2dWb2wwMQogIFZHIE5h
bWUgICAgICAgICAgICAgICAgVm9sR3JvdXAwMAogIExWIFVVSUQgICAgICAgICAgICAgICAgUFVH
QlhaLVJIWDItZ2RJUi1rUVNHLXE4Y3QtMk4xeS1QNTU1dUoKICBMViBXcml0ZSBBY2Nlc3MgICAg
ICAgIHJlYWQvd3JpdGUKICBMViBTdGF0dXMgICAgICAgICAgICAgIGF2YWlsYWJsZQogICMgb3Bl
biAgICAgICAgICAgICAgICAgMQogIExWIFNpemUgICAgICAgICAgICAgICAgMS4wMCBHQgogIEN1
cnJlbnQgTEUgICAgICAgICAgICAgMzIKICBTZWdtZW50cyAgICAgICAgICAgICAgIDEKICBBbGxv
Y2F0aW9uICAgICAgICAgICAgIGluaGVyaXQKICBSZWFkIGFoZWFkIHNlY3RvcnMgICAgIGF1dG8K
ICAtIGN1cnJlbnRseSBzZXQgdG8gICAgIDI1NgogIEJsb2NrIGRldmljZSAgICAgICAgICAgMjUz
OjEKICAgCltyb290QHNob2Ugfl0jIHB2ZGlzcGxheQogIC0tLSBQaHlzaWNhbCB2b2x1bWUgLS0t
CiAgUFYgTmFtZSAgICAgICAgICAgICAgIC9kZXYvaGRhMgogIFZHIE5hbWUgICAgICAgICAgICAg
ICBWb2xHcm91cDAwCiAgUFYgU2l6ZSAgICAgICAgICAgICAgIDM3LjE3IEdCIC8gbm90IHVzYWJs
ZSAxMi4yNCBNQgogIEFsbG9jYXRhYmxlICAgICAgICAgICB5ZXMgKGJ1dCBmdWxsKQogIFBFIFNp
emUgKEtCeXRlKSAgICAgICAzMjc2OAogIFRvdGFsIFBFICAgICAgICAgICAgICAxMTg5CiAgRnJl
ZSBQRSAgICAgICAgICAgICAgIDAKICBBbGxvY2F0ZWQgUEUgICAgICAgICAgMTE4OQogIFBWIFVV
SUQgICAgICAgICAgICAgICB2RXVLZWMtMHNZaC02SDN1LTMwTGQtQXExUy1VeVdOLWk2dndFcgoK
W3Jvb3RAc2hvZSB+XSMgZGYgLWgKRmlsZXN5c3RlbSAgICAgICAgICAgIFNpemUgIFVzZWQgQXZh
aWwgVXNlJSBNb3VudGVkIG9uCi9kZXYvbWFwcGVyL1ZvbEdyb3VwMDAtTG9nVm9sMDAKICAgICAg
ICAgICAgICAgICAgICAgICA3MkcgIDIuMkcgICA2N0cgICA0JSAvCi9kZXYvaGRhMSAgICAgICAg
ICAgICAgOTlNICAgMThNICAgNzZNICAxOSUgL2Jvb3QKdG1wZnMgICAgICAgICAgICAgICAgIDI1
Mk0gICAgIDAgIDI1Mk0gICAwJSAvZGV2L3NobQotLVlvdSBjYW4gc2VlIHRoYXQgdGhlcmUgaXMg
c3RpbGwgc29tZXRoaW5nIHdyb25nIGhlcmUsIGJlY2F1c2UgVm9sR3JvdXAwMC1Mb2dWb2wwMCBp
cyBzdGlsbCBtYXJrZWQgYXMgNjdHIEF2YWlsYWJsZSBhbmQgb2YgY291cnNlIGl0cyBub3QuIEhv
dyBkbyB3ZSBmaXggdGhhdC4KCgo=
--001636ed73d01d685b047676a20b--

From: "William Blunn" <bill+f.9sfuw6uo@tao-group.com>
Subject: Re: [linux-lvm] How to best use LVM?
Message-ID: <BDEMIPDEGABMNEFIHCPDCEMGDNAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20020814165938.152D1F90D@tater>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Aug 15 05:16:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> =09- Can I use it to extend a RAID 5 set,=20
> =09  or concatenate 2 RAID 5 sets together?

I think the core answer to a lot of your questions is that LVM doesn't do R=
AID (other than a form of RAID0) itself. Most of the time what LVM does is =
concatenation, and relies on RAID being done at a lower level, i.e. you use=
 a RAID set as a PV.

LVM won't actually coalesce two RAID5 sets together into a single RAID5 set=
, but you can get the effect of concatenation.=20

If you have two RAID5 sets, you can make each one into a PV, and then add b=
oth of those PVs into the VG. You still have two distinct RAID5 sets, but L=
VM will present it to you as one big area.

You can then create LVs in the VG, and create filesystems on the LVs. You c=
an cheerfully create an LV which is bigger than the largest PV, or even one=
 big LV which fills the entire VG.

If you already have data on a RAID5 set, and you want to convert it to LVM =
use, then you can't keep the data that is already on there.

Composing your VG out of RAID devices (rather than simple disk partitions) =
is the way to go. If you lose one PV, you tend to lose the whole VG. So it'=
s a good idea to find some way of making your PVs resilient.

Re extending RAID5 sets, LVM won't help you to do that per se, i.e. it won'=
t help you extend an existing RAID 5 set per se.

However if you already have a RAID5 set which you have put in a VG, and you=
 get a new RAID5 set on your system (e.g. adding a new RAID5 system, or mak=
ing a new RAID5 set out of some newly available disk space), then you can a=
dd that new RAID5 set to the VG. You can then extend your existing LVs into=
 the new space in the VG, or create new LVs.

(( A lot of people seem to want LVM to do magic on their existing systems w=
hich are full of data, which is something it doesn't do. You are going to n=
eed to backup-and-restore, or set up LVM on new disks.

However, once you have subscribed to the LVM philosophy, bitten the bullet,=
 and migrated your existing system over to LVM, then adding new space is tr=
ivially easy.

The real trick is to put in LVM on day one even if you're not sure you need=
 it.

Like putting data cabling into a building, it's easy to put in at the begin=
ning when the building is being built, but harder to put in later when you =
realise you need it. ))

> =09- Can I use LVM to combine different types of RAID, such as 1=20
> =09  and 0?

Yes. You can have several PVs of different RAID types.

You can even tell LVM on which PV you want it to put each LV. You can even =
move parts of LVs or whole LVs to a different PV, after creation, without l=
osing data.

However if you have some PVs with redundancy (e.g. RAID1 (mirrored)) it wou=
ld probably not be sensible to mix them with non-redundant PVs (e.g. RAID0 =
(striped)). This is because the VG is only as strong as the weakest link.

> =09- Can I easily "grow" a RAID set using LVM?

Same question as the first part of your first question?

> The other question I had more directly relates to the Linux=20
> implementation for LVM:
>=20
> =09- Which version do I use?

Can't give you a complete answer because I have never used LVM2. I use LVM1=
 on a number of machines and it works fine for me. I use kernel 2.4.18 with=
 LVM1.0.x patch, with Debian 3.0 (Woody) lvm10 (LVM1.0.4) userland tools.

Although you would need to give some more information about your situation.=
 You are using Debian unstable which suggests you want to live on the bleed=
ing edge, but you are also using RAID5 which suggests you want to make a st=
able reliable system. AFAICT these two goals are incompatible.

> Is lvm10 the 1.x series and lvm2 the 2.x? Or does lvm10 come after lvm2?

The former.

> If the former, is 2.x stable enough to use,

Same question as "Which version do I use?".

> and is it better to=20
> compile lvm from source or use the pre-compiled debian packages?

For LVM1: I have found the pre-compiled debian packages to be OK.

> I've tried both the lvm10 and lvm2 packages, but continually recieve=20
> errors when I do things like run lvdisplay (it complains about not=20
> being able to flush the device several times), and also something=20
> about not being able to open the device-mapper.

For LVM1: I believe the errors about flushing are fine.

Bill
--=20
William H. Blunn - <bill+s.9sfuw6uo@tao-group.com> - Developer Support
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/

The contents of this e-mail and any attachments are confidential and may
be legally privileged. If you have received this e-mail and you are not
a named addressee, please inform us as soon as possible on
+44 118 901 2999 and then delete the e-mail from your system. If you are
not a named addressee you must not copy, use, disclose, distribute,
print or rely on this e-mail. Any views expressed in this e-mail or any
attachments may not necessarily reflect those of Tao's management.
Although we routinely screen for viruses, addressees should scan this
e-mail and any attachments for viruses. Tao makes no representation or
warranty as to the absence of viruses in this e-mail or any attachments.
Please note that for the protection of our business, we may monitor and
read e-mails sent to and from our server(s).

Visit our website at http://tao-group.com/

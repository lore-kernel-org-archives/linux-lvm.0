Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u42EWSxK032458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 2 May 2016 10:32:28 -0400
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9C5662660
	for <linux-lvm@redhat.com>; Mon,  2 May 2016 14:32:26 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id d62so169292384iof.2
	for <linux-lvm@redhat.com>; Mon, 02 May 2016 07:32:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57234421.5040902@redhat.com>
References: <929635034.3140318.1461840230292.JavaMail.yahoo.ref@mail.yahoo.com>
	<929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
	<445afc4b9ae3fbf477f8f66db9d28580@dds.nl>
	<57234421.5040902@redhat.com>
Date: Mon, 2 May 2016 10:32:26 -0400
Message-ID: <CALm7yL05s2BrFL=C_r_BEP3jDkUgKWhRFgHSwhYNreEj9AgLNQ@mail.gmail.com>
From: Mark Mielke <mark.mielke@gmail.com>
Content-Type: multipart/alternative; boundary=001a1141f1188ca3f40531dcdcd0
Subject: Re: [linux-lvm] thin handling of available space
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--001a1141f1188ca3f40531dcdcd0
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 29, 2016 at 7:23 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Thin-provisioning is NOT about providing device to the upper
> system levels and inform THEM about this lie in-progress.
> That's complete misunderstanding of the purpose.
>

I think this line of thought is a bit of a strawman.

Thin provisioning is entirely about presenting the upper layer with a
logical view which does not match the physical view, including the
possibility for such things as over provisioning. How much of this detail
is presented to the higher layer is an implementation detail and has
nothing to do with "purpose". The purpose or objective is to allow volumes
that are not fully allocated in advance. This is what "thin" means, as
compared to "thick".



> If you seek for a filesystem with over-provisioning - look at btrfs, zfs
> and other variants...
>

I have to say that I am disappointed with this view, particularly if this
is a view held by Red Hat. To me this represents a misunderstanding of the
purpose for over-provisioning, and a misunderstanding of why thin volumes
are required. It seems there is a focus on "filesystem" in the above
statement, and that this may be the point of debate.

When a storage provider providers a block device (EMC, NetApp, ...) and a
snapshot capability, I expect to be able to take snapshots with low
overhead. The previous LVM model for snapshots was really bad, in that it
was not low overhead. We use this capability for many purposes including:

1) Instantiating test environments or dev environments from a snapshot of
production, with copy-on-write to allow for very large full-scale
environments to be constructed quickly and with low overhead. In one of our
examples, this includes an example where we have about 1 TByte of JIRA and
Confluence attachments collected over several years. It is exposed over NFS
by the NetApp device, but in the backend it is a volume. This volume is
snapshot and then exposed as a different volume with copy-on-write
characteristics. The storage allocation is monitored, and if it is
exceeded, it is known that there will be particular behaviour. I believe in
our case, the behaviour is that the snapshot becomes unusable.

2) Frequent snapshots. In many of our use cases, we may take snapshots
every 15 minutes, every hour, and every day, keeping 3 or more of each. If
this storage had to be allocated in full, this amounts to at least 10X the
storage cost. Using snapshots, and understanding the rate of churn, we can
use closer to 1X or 2X the storage overhead, instead of 10X the storage
overhead.

3) Snapshot as a means of achieving a consistent backup at low cost of
outage or storage overhead. If we "quiesce" the application (flush buffers,
put new requests on hold, etc.) take the snapshot, and then "resume" the
application, this can be achieved in a matter of seconds or less. Then, we
can mount the snapshot at a separate mount point and proceed with a more
intensive backup process against a particular consistent point-in-time.
This can be fast and require closer to 1X the storage overhead, instead of
2X the storage overhead.

In all of these cases - we'll buy more storage if we need more storage.
But, we're not going to use BTRFS or ZFS to provide the above capabilities,
just because this is your opinion on the matter. Storage vendors of
reputation and market presence sell these capabilities as features, and we
pay a lot of money to have access to these features.

In the case of LVM... which is really the point of this discussion... LVM
is not necessarily going to be used or available on a storage appliance.
The LVM use case, at least for us, is for storage which is thinly
provisioned by the compute host instead of the backend storage appliance.
This includes:

1) Local disks, particularly included local flash drives that are local to
achieve higher levels of performance than can normally be achieved with a
remote storage appliance.

2) Local file systems, on remote storage appliances, using a protocol such
as iSCSI to access the backend block device. This might be the case where
we need better control of the snapshot process, or to abstract the
management of the snapshots from the backend block device. In our case, we
previously use an EMC over iSCSI for one of these use cases, and we are
switching to NetApp. However, instead of embedding NetApp-specific logic
into our code, we want to use LVM on top of iSCSI, and re-use the LVM thin
pool capabilities from the host, such that we don't care what storage is
used on the backend. The management scripts will work the same whether the
storage is local (the first case above) or not (the case we are looking
into now).

In both of these cases, we have a need to take snapshots and manage them
locally on the host, instead of managing them on a storage appliance. In
both cases, we want to take many light weight snapshots of the block
device. You could argue that we should use BTRFS or ZFS, but you should
full well know that both of these have caveats as well. We want to use XFS
or EXT4 as our needs require, and still have the ability to take
light-weight snapshots.

Generally, I've seen the people who argue that thin provisioning is a
"lie", tend to not be talking about snapshots. I have a sense that you are
talking more as storage providers for customers, and talking more about
thinly provisioning content for your customers. In this case - I think I
would agree that it is a "lie" if you don't make sure to have the storage
by the time it is required. But, I think this is a very small use case in
reality. I think large service providers would use Ceph or EMC or NetApp,
or some such technology to provision large amounts of storage per customer,
and LVM would be used more at the level of a single customer, or a single
machine. In these cases, I would expect that LVM thin volumes should not be
used across multiple customers without understanding the exact type of
churn expected, to understand what the maximum allocation that would be
required. In the case of our IT team and EMC or NetApp, they mostly avoid
the use of thin volumes for "cross customer" purposes, and instead use thin
volumes for a specific customer, for a specific need. In the case of Amazon
EC2, for example... I would use EBS for storage, and expect that even if it
is "thin", Amazon would make sure to have enough storage to meet my
requirement if I need them. But, I would use LVM on my Amazon EC2 instance,
and I would expect to be able to use LVM thin pool snapshots to over
provision my own per-machine storage requirements by creating multiple
snapshots of the underlying storage, with a full understanding of the
amount of churn that I expect to occur, and a full understanding of the
need to monitor.



> Device target is definitely not here to solve  filesystem troubles.
> Thinp is about 'promising' - you as admin promised you will provide
> space -  we could here discuss maybe that LVM may possibly maintain
> max growth size we can promise to user - meanwhile - it's still the admin
> who creates thin-volume and gets WARNING if VG is not big enough when all
> thin volumes would be fully provisioned.
> And  THAT'S IT - nothing more.
> So please avoid making thinp target to be answer to ultimate question of
> life, the universe, and everything - as we all know  it's 42...


The WARNING is a cover-your-ass type warning that is showing up
inappropriately for us. It is warning me something that I should already
know, and it is training me to ignore warnings. Thinp doesn't have to be
the answer to everything. It does, however, need to provide a block device
visible to the file system layer, and it isn't invalid for the file system
layer to be able to query about the nature of the block device, such as
"how much space do you *really* have left?"

This seems to be a crux of this debate between you and the other people.
You think the block storage should be as transparent as possible, as if the
storage was not thin. Others, including me, think that this theory is
impractical, as it leads to edge cases where the file system could choose
to fail in a cleaner way, but it gets too far today leading to a more
dangerous failure when it allocates some block, but not some other block.

Exaggerating this to say that thinp would become everything, and the answer
to the ultimate question of life, weakens your point to me, as it means
that you are seeing things in far too black + white, whereas real life is
often not black + white.

It is your opinion that extending thin volumes to allow the file system to
have more information is breaking some fundamental law. But, in practice,
this sort of thing is done all of the time. "Size", "Read only",
"Discard/Trim Support", "Physical vs Logical Sector Size", ... are all
information queried from the device, and used by the file system. If it is
a general concept that applies to many different device targets, and it
will help the file system make better and smarter choices, why *shouldn't*
it be communicated? Who decides which ones are valid and which ones are not?

I didn't disagree with all of your points. But, enough of them seemed to be
directly contradicting my perspective on the matter that I felt it
important to respond to them.

Mostly, I think everybody has a set of opinions and use cases in mind when
they come to their conclusions. Please don't ignore mine. If there is
something unreasonable above, please let me know.


-- 
Mark Mielke <mark.mielke@gmail.com>

--001a1141f1188ca3f40531dcdcd0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Apr 29, 2016 at 7:23 AM, Zdenek Kabelac <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:zkabelac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb">=
<div class=3D"h5"><span style=3D"color:rgb(34,34,34)">Thin-provisioning is =
NOT about providing device to the upper</span><br></div></div>
system levels and inform THEM about this lie in-progress.<br>
That&#39;s complete misunderstanding of the purpose.<br></blockquote><div><=
br></div><div>I think this line of thought is a bit of a strawman.</div><di=
v><br></div><div>Thin provisioning is entirely about presenting the upper l=
ayer with a logical view which does not match the physical view, including =
the possibility for such things as over provisioning. How much of this deta=
il is presented to the higher layer is an implementation detail and has not=
hing to do with &quot;purpose&quot;. The purpose or objective is to allow v=
olumes that are not fully allocated in advance. This is what &quot;thin&quo=
t; means, as compared to &quot;thick&quot;.</div><div><br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
If you seek for a filesystem with over-provisioning - look at btrfs, zfs an=
d other variants...<br></blockquote><div><br></div><div>I have to say that =
I am disappointed with this view, particularly if this is a view held by Re=
d Hat. To me this represents a misunderstanding of the purpose for over-pro=
visioning, and a misunderstanding of why thin volumes are required. It seem=
s there is a focus on &quot;filesystem&quot; in the above statement, and th=
at this may be the point of debate.</div><div><br></div><div>When a storage=
 provider providers a block device (EMC, NetApp, ...) and a snapshot capabi=
lity, I expect to be able to take snapshots with low overhead. The previous=
 LVM model for snapshots was really bad, in that it was not low overhead. W=
e use this capability for many purposes including:</div><div><br></div><div=
>1) Instantiating test environments or dev environments from a snapshot of =
production, with copy-on-write to allow for very large full-scale environme=
nts to be constructed quickly and with low overhead. In one of our examples=
, this includes an example where we have about 1 TByte of JIRA and Confluen=
ce attachments collected over several years. It is exposed over NFS by the =
NetApp device, but in the backend it is a volume. This volume is snapshot a=
nd then exposed as a different volume with copy-on-write characteristics. T=
he storage allocation is monitored, and if it is exceeded, it is known that=
 there will be particular behaviour. I believe in our case, the behaviour i=
s that the snapshot becomes unusable.</div><div><br></div><div>2) Frequent =
snapshots. In many of our use cases, we may take snapshots every 15 minutes=
, every hour, and every day, keeping 3 or more of each. If this storage had=
 to be allocated in full, this amounts to at least 10X the storage cost. Us=
ing snapshots, and understanding the rate of churn, we can use closer to 1X=
 or 2X the storage overhead, instead of 10X the storage overhead.=C2=A0</di=
v><div><br></div><div>3) Snapshot as a means of achieving a consistent back=
up at low cost of outage or storage overhead. If we &quot;quiesce&quot; the=
 application (flush buffers, put new requests on hold, etc.) take the snaps=
hot, and then &quot;resume&quot; the application, this can be achieved in a=
 matter of seconds or less. Then, we can mount the snapshot at a separate m=
ount point and proceed with a more intensive backup process against a parti=
cular consistent point-in-time. This can be fast and require closer to 1X t=
he storage overhead, instead of 2X the storage overhead.</div><div><br></di=
v><div>In all of these cases - we&#39;ll buy more storage if we need more s=
torage. But, we&#39;re not going to use BTRFS or ZFS to provide the above c=
apabilities, just because this is your opinion on the matter. Storage vendo=
rs of reputation and market presence sell these capabilities as features, a=
nd we pay a lot of money to have access to these features.</div><div><br></=
div><div>In the case of LVM... which is really the point of this discussion=
... LVM is not necessarily going to be used or available on a storage appli=
ance. The LVM use case, at least for us, is for storage which is thinly pro=
visioned by the compute host instead of the backend storage appliance. This=
 includes:</div><div><br></div><div>1) Local disks, particularly included l=
ocal flash drives that are local to achieve higher levels of performance th=
an can normally be achieved with a remote storage appliance.</div><div><br>=
</div><div>2) Local file systems, on remote storage appliances, using a pro=
tocol such as iSCSI to access the backend block device. This might be the c=
ase where we need better control of the snapshot process, or to abstract th=
e management of the snapshots from the backend block device. In our case, w=
e previously use an EMC over iSCSI for one of these use cases, and we are s=
witching to NetApp. However, instead of embedding NetApp-specific logic int=
o our code, we want to use LVM on top of iSCSI, and re-use the LVM thin poo=
l capabilities from the host, such that we don&#39;t care what storage is u=
sed on the backend. The management scripts will work the same whether the s=
torage is local (the first case above) or not (the case we are looking into=
 now).</div><div><br></div><div>In both of these cases, we have a need to t=
ake snapshots and manage them locally on the host, instead of managing them=
 on a storage appliance. In both cases, we want to take many light weight s=
napshots of the block device. You could argue that we should use BTRFS or Z=
FS, but you should full well know that both of these have caveats as well. =
We want to use XFS or EXT4 as our needs require, and still have the ability=
 to take light-weight snapshots.</div><div><br></div><div>Generally, I&#39;=
ve seen the people who argue that thin provisioning is a &quot;lie&quot;, t=
end to not be talking about snapshots. I have a sense that you are talking =
more as storage providers for customers, and talking more about thinly prov=
isioning content for your customers. In this case - I think I would agree t=
hat it is a &quot;lie&quot; if you don&#39;t make sure to have the storage =
by the time it is required. But, I think this is a very small use case in r=
eality. I think large service providers would use Ceph or EMC or NetApp, or=
 some such technology to provision large amounts of storage per customer, a=
nd LVM would be used more at the level of a single customer, or a single ma=
chine. In these cases, I would expect that LVM thin volumes should not be u=
sed across multiple customers without understanding the exact type of churn=
 expected, to understand what the maximum allocation that would be required=
. In the case of our IT team and EMC or NetApp, they mostly avoid the use o=
f thin volumes for &quot;cross customer&quot; purposes, and instead use thi=
n volumes for a specific customer, for a specific need. In the case of Amaz=
on EC2, for example... I would use EBS for storage, and expect that even if=
 it is &quot;thin&quot;, Amazon would make sure to have enough storage to m=
eet my requirement if I need them. But, I would use LVM on my Amazon EC2 in=
stance, and I would expect to be able to use LVM thin pool snapshots to ove=
r provision my own per-machine storage requirements by creating multiple sn=
apshots of the underlying storage, with a full understanding of the amount =
of churn that I expect to occur, and a full understanding of the need to mo=
nitor.</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Device target is definitely not here to solve=C2=A0 filesystem troubles.<br=
>
Thinp is about &#39;promising&#39; - you as admin promised you will provide=
<br>
space -=C2=A0 we could here discuss maybe that LVM may possibly maintain<br=
>
max growth size we can promise to user - meanwhile - it&#39;s still the adm=
in<br>
who creates thin-volume and gets WARNING if VG is not big enough when all t=
hin volumes would be fully provisioned.<br>
And=C2=A0 THAT&#39;S IT - nothing more.<br>
So please avoid making thinp target to be answer to ultimate question of li=
fe, the universe, and everything - as we all know=C2=A0 it&#39;s 42...</blo=
ckquote><div><br></div><div>The WARNING is a cover-your-ass type warning th=
at is showing up inappropriately for us. It is warning me something that I =
should already know, and it is training me to ignore warnings. Thinp doesn&=
#39;t have to be the answer to everything. It does, however, need to provid=
e a block device visible to the file system layer, and it isn&#39;t invalid=
 for the file system layer to be able to query about the nature of the bloc=
k device, such as &quot;how much space do you *really* have left?&quot;</di=
v><div><br></div><div>This seems to be a crux of this debate between you an=
d the other people. You think the block storage should be as transparent as=
 possible, as if the storage was not thin. Others, including me, think that=
 this theory is impractical, as it leads to edge cases where the file syste=
m could choose to fail in a cleaner way, but it gets too far today leading =
to a more dangerous failure when it allocates some block, but not some othe=
r block.</div><div><br></div><div>Exaggerating this to say that thinp would=
 become everything, and the answer to the ultimate question of life, weaken=
s your point to me, as it means that you are seeing things in far too black=
 + white, whereas real life is often not black + white.</div><div><br></div=
><div>It is your opinion that extending thin volumes to allow the file syst=
em to have more information is breaking some fundamental law. But, in pract=
ice, this sort of thing is done all of the time. &quot;Size&quot;, &quot;Re=
ad only&quot;, &quot;Discard/Trim Support&quot;, &quot;Physical vs Logical =
Sector Size&quot;, ... are all information queried from the device, and use=
d by the file system. If it is a general concept that applies to many diffe=
rent device targets, and it will help the file system make better and smart=
er choices, why *shouldn&#39;t* it be communicated? Who decides which ones =
are valid and which ones are not?</div><div><br></div><div>I didn&#39;t dis=
agree with all of your points. But, enough of them seemed to be directly co=
ntradicting my perspective on the matter that I felt it important to respon=
d to them.</div><div><br></div><div>Mostly, I think everybody has a set of =
opinions and use cases in mind when they come to their conclusions. Please =
don&#39;t ignore mine. If there is something unreasonable above, please let=
 me know.</div></div><br clear=3D"all"><div><br></div>-- <br><div class=3D"=
gmail_signature">Mark Mielke &lt;<a href=3D"mailto:mark.mielke@gmail.com" t=
arget=3D"_blank">mark.mielke@gmail.com</a>&gt;<br><br></div>
</div></div>

--001a1141f1188ca3f40531dcdcd0--

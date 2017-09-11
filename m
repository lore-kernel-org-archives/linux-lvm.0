Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0A9A6A847
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 21:59:24 +0000 (UTC)
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id 0C09411AD16
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 21:59:21 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 11 Sep 2017 23:59:18 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
Message-ID: <872ad7be3b36e2eb0afc080fa781d84d@assyoma.it>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Il 11-09-2017 12:35 Zdenek Kabelac ha scritto:
> The first question here is - why do you want to use thin-provisioning ?

Because classic LVM snapshot behavior (slow write speed and linear 
performance decrease as snapshot count increases) make them useful for 
nightly backups only.

On the other side, the very fast CoW thinp's behavior mean very usable 
and frequent snapshots (which are very useful to recover from user 
errors).

> As thin-provisioning is about 'promising the space you can deliver
> later when needed'  - it's not about hidden magic to make the space
> out-of-nowhere.

I fully agree. In fact, I was asking about how to reserve space to 
*protect* critical thin volumes from "liberal" resource use by less 
important volumes. Fully-allocated thin volumes sound very interesting - 
even if I think this is a performance optimization rather than a "safety 
measure".

> The idea of planning to operate thin-pool on 100% fullness boundary is
> simply not going to work well - it's  not been designed for that
> use-case - so if that's been your plan - you will need to seek for
> other solution.
> (Unless you seek for those 100% provisioned devices)

I do *not* want to run at 100% data usage. Actually, I want to avoid it 
entirely by setting a reserved space which cannot be used for things as 
snapshot. In other words, I would very like to see a snapshot to fail 
rather than its volume becoming unavailable *and* corrupted.

Let me de-tour by using ZFS as an example (don't bash me for doing 
that!)

In ZFS words, there are object called ZVOLs - ZFS volumes/block devices, 
which can either be "fully-preallocated" or "sparse".

By default, they are "fully-preallocated": their entire nominal space is 
reseved and subtracted from the ZPOOL total capacity. Please note that 
this does *not* means that space is really allocated on the ZPOOL, 
rather that nominal space is accounted against other ZFS dataset/volumes 
when creating new object. A filesystem sitting on top of such a ZVOL 
will never run out of space; rather, if the remaining capacity is not 
enough to guaranteed this constrain, new volume/snapshot creating is 
forbidden.

Example:
# 1 GB ZPOOL
[root@blackhole ~]# zpool list
NAME   SIZE  ALLOC   FREE  EXPANDSZ   FRAG    CAP  DEDUP  HEALTH  
ALTROOT
tank  1008M   456K  1008M         -     0%     0%  1.00x  ONLINE  -

# Creating a 600 MB ZVOL (note the different USED vs REFER values)
[root@blackhole ~]# zfs create -V 600M tank/vol1
[root@blackhole ~]# zfs list
NAME        USED  AVAIL  REFER  MOUNTPOINT
tank        621M   259M    96K  /tank
tank/vol1   621M   880M    56K  -

# Snapshot creating - please see that, as REFER is very low (I did write 
nothig on the volume), snapshot creating is allowed
[root@blackhole ~]# zfs snapshot tank/vol1@snap1
[root@blackhole ~]# zfs list -t all
NAME              USED  AVAIL  REFER  MOUNTPOINT
tank              621M   259M    96K  /tank
tank/vol1         621M   880M    56K  -
tank/vol1@snap1     0B      -    56K  -

# Let write something to the volume (note how REFER is higher than free, 
unreserved space)
[root@blackhole ~]# zfs destroy tank/vol1@snap1
[root@blackhole ~]# dd if=/dev/zero of=/dev/zvol/tank/vol1 bs=1M 
count=500 oflag=direct
500+0 records in
500+0 records out
524288000 bytes (524 MB) copied, 12.7038 s, 41.3 MB/s
[root@blackhole ~]# zfs list -t all
NAME        USED  AVAIL  REFER  MOUNTPOINT
tank        622M   258M    96K  /tank
tank/vol1   621M   378M   501M  -

# Snapshot creation now FAILS!
[root@blackhole ~]# zfs snapshot tank/vol1@snap1
cannot create snapshot 'tank/vol1@snap1': out of space
[root@blackhole ~]# zfs list -t all
NAME        USED  AVAIL  REFER  MOUNTPOINT
tank        622M   258M    96K  /tank
tank/vol1   621M   378M   501M  -

The above surely is safe behavior: when free, unused space is too low to 
guarantee the reserved space, snapshot creation is disallowed.

On the other side, using the "-s" option you can create a "sparse" ZVOL 
- a volume which nominal space is *not* accounted/subtracted from the 
total ZPOOL capacity. Such a volume have similar warnings that thin 
volumes. From the man page:

'Though not recommended, a "sparse volume" (also known as "thin 
provisioning") can be created by specifying the -s option to the zfs 
create -V command, or by changing the reservation after the volume has 
been created.  A "sparse volume" is a volume where the reservation is 
less then the volume size.  Consequently, writes to a sparse volume can 
fail with ENOSPC when the pool is low on space.  For a sparse volume, 
changes to volsize are not reflected in the reservation.'

The only real difference vs a fully preallocated volume is the property 
carrying the reserved space expectation. I can even switch at run-time 
between a fully preallocated vs sparse volume by simply changing the 
right property. Indeed, a very important thing to understand is that 
this property can be set to *any value* between 0 ("none") and max 
volume (nominal) size.

On a 600M fully preallocated volumes:
[root@blackhole ~]# zfs get refreservation tank/vol1
NAME       PROPERTY        VALUE      SOURCE
tank/vol1  refreservation  621M       local

On a 600M sparse volume:
[root@blackhole ~]# zfs get refreservation tank/vol1
NAME       PROPERTY        VALUE      SOURCE
tank/vol1  refreservation  none       local

Now, a sparse (refreservation=none) volume *can* be snapshotted even if 
very little free space if available in the ZPOOL:

# The very same command that previously failed, now completes 
successfully
[root@blackhole ~]# zfs snapshot tank/vol1@snap1
[root@blackhole ~]# zfs list -t all
NAME              USED  AVAIL  REFER  MOUNTPOINT
tank              502M   378M    96K  /tank
tank/vol1         501M   378M   501M  -
tank/vol1@snap1     0B      -   501M  -

# Using a non-zero, but lower-than-nominal threshold 
(refreservation=100M) allows the snapshot to be taken:
[root@blackhole ~]# zfs set refreservation=100M tank/vol1
[root@blackhole ~]# zfs snapshot tank/vol1@snap1
[root@blackhole ~]# zfs list -t all
NAME              USED  AVAIL  REFER  MOUNTPOINT
tank              602M   278M    96K  /tank
tank/vol1         601M   378M   501M  -
tank/vol1@snap1     0B      -   501M  -

# If free space drops under the lower-but-not-zero reservation 
(refreservation=100M), snapshot again fails:
[root@blackhole ~]# dd if=/dev/zero of=/dev/zvol/tank/vol1 bs=1M 
count=300 oflag=direct
300+0 records in
300+0 records out
314572800 bytes (315 MB) copied, 4.85282 s, 64.8 MB/s
[root@blackhole ~]# zfs list -t all
NAME              USED  AVAIL  REFER  MOUNTPOINT
tank              804M  76.3M    96K  /tank
tank/vol1         802M  76.3M   501M  -
tank/vol1@snap1   301M      -   501M  -
[root@blackhole ~]# zfs snapshot tank/vol1@snap2
cannot create snapshot 'tank/vol1@snap2': out of space

OK - now back to the original question: why reserved space can be 
useful? Consider the following two scenarios:

A) You want to efficiently use snapshots and *never* encounter 
unexpected full ZPOOL. Your main constrain it to use at most <50% of 
available space for your "critical" ZVOL. With such a setup, any 
"excessive" snapshot/volume creation will surely fail, but the main ZVOL 
will be unaffected;

B) You want to somewhat overprovision (taking account worst-case 
snapshot behavior), but with *large* operating margin. In this case, you 
can create a sparse volume with lower (but non-zero) reservation. Any 
snapshot/volume creation done when this margin is crossed will fail. You 
surely need to clean-up some space (eg: delete older snapshot), but you 
avoid the runaway effect of new snapshot being continuously created, 
consuming additional space.

Now leave ZWORLD, and back to thinp: it would be *really* cool to 
provide the same sort of functionality. Sure, you had to track space 
usage both@pool and a volume level - but the safety increase would be 
massive. There is an big difference between a corrupted main volume and 
a failed snapshot: while the latter can be resolved without too much 
concert, the former (volume corruption) really is a scary thing.

Don't misunderstand me, Zdenek: I *REALLY* appreciate you core 
developers from the outstanding work on LVM. This is especially true in 
the light of BTRFS's problems, and with stratis (which is heavily based 
on thinp) becoming the new next thing. I even more appreciate that you 
are on the mailing list, replying to your users.

Thin volumes are really cool (and fast!), but they can fail deadly. A 
fail-safe approach (ie: no new snapshot allowed) is much more desirable.

Thanks.

> 
> Regards
> 
> 
> Zdenek

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8

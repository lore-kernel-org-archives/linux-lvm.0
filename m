Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B315960C22
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 07:53:31 +0000 (UTC)
Received: from mr001msb.fastweb.it (mr001msb.fastweb.it [85.18.95.85])
	by mx1.redhat.com (Postfix) with ESMTP id 4BC141F574
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 07:53:29 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 13 Sep 2017 09:53:27 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <1575245610.821680.1505258554456@mail.yahoo.com>
References: <1575245610.821680.1505258554456.ref@mail.yahoo.com>
	<1575245610.821680.1505258554456@mail.yahoo.com>
Message-ID: <052d4c46af896716c0f47132f4ddfb8d@assyoma.it>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

Il 13-09-2017 01:22 matthew patton ha scritto:
>> Step-by-step example:
>  > - create a 40 GB thin volume and subtract its size from the thin
> pool (USED 40 GB, FREE 60 GB, REFER 0 GB);
>  > - overwrite the entire volume (USED 40 GB, FREE 60 GB, REFER 40 GB);
>  > - snapshot the volume (USED 40 GB, FREE 60 GB, REFER 40 GB);
> 
> And 3 other threads also take snapshots against the same volume, or
> frankly any other volume in the pool.
> Since the next step (overwrite) hasn't happened yet or has written
> less than 20GB, all succeed.
> 
>  > - completely overwrite the original volume (USED 80 GB, FREE 20 GB,
> REFER 40 GB);
> 
> 4 threads all try to write their respective 40GB. Afterall, they got
> the green-light since their snapshot was allowed to be taken.
> Your thinLV blows up spectacularly.
> 
>  > - a new snapshot creation will fails (REFER is higher then FREE).
> nobody cares about new snapshot creation attempts at this point.
> 
> 
>> When do you decide it ?  (you need to see this is total race-lend)
> 
> exactly!

I all the examples I did, the snapshot are suppose to be read-only or at 
least never written. I thought that it was implicitly clear due to ZFS 
(used as example) being read-only by default. Sorry for not explicitly 
stating that.

However, the refreservation mechanism can protect the original volume 
even when snapshots are writeable. Here we go:

# Create a 400M ZVOL and fill it
[root@localhost ~]# zfs create -V 400M tank/vol1
[root@localhost ~]# dd if=/dev/zero of=/dev/zvol/tank/vol1 bs=1M 
oflag=direct
dd: error writing ‘/dev/zvol/tank/vol1’: No space left on device
401+0 records in
400+0 records out
419430400 bytes (419 MB) copied, 23.0573 s, 18.2 MB/s
[root@localhost ~]# zfs list -t all
NAME        USED  AVAIL  REFER  MOUNTPOINT
tank        416M   464M    24K  /tank
tank/vol1   414M   478M   401M  -

# Create some snapshots (note how the USED value increased due to the 
snapshot reserving space for all "live" data in the ZVOL)
[root@localhost ~]# zfs set snapdev=visible tank/vol1
[root@localhost ~]# zfs snapshot tank/vol1@snap1
[root@localhost ~]# zfs snapshot tank/vol1@snap2
[root@localhost ~]# zfs list -t all
NAME              USED  AVAIL  REFER  MOUNTPOINT
tank              816M  63.7M    24K  /tank
tank/vol1         815M   478M   401M  -
tank/vol1@snap1     0B      -   401M  -
tank/vol1@snap2     0B      -   401M  -

# Clone the snapshot (to be able to overwrite it)
[root@localhost ~]# zfs clone tank/vol1@snap1 tank/cvol1
[root@localhost ~]# zfs list -t all
NAME              USED  AVAIL  REFER  MOUNTPOINT
tank              815M  64.6M    24K  /tank
tank/cvol1          1K  64.6M   401M  -
tank/vol1         815M   479M   401M  -
tank/vol1@snap1     0B      -   401M  -
tank/vol1@snap2     0B      -   401M  -

# Writing to the cloned ZVOL fails (after only 66 MB written) *without* 
impacting the original volume
[root@localhost ~]# dd if=/dev/zero of=/dev/zvol/tank/cvol1 bs=1M 
oflag=direct
dd: error writing ‘/dev/zvol/tank/cvol1’: Input/output error
64+0 records in
63+0 records out
66060288 bytes (66 MB) copied, 25.9189 s, 2.5 MB/s

After the last write, the cloned cvol1 is clearly corrputed, but the 
original volume has not problem at all.

Now, I am *not* advocating switching thinp to a ZFS-like things (ie: 
note the write speed, which is low even for my super-slow notebook HDD). 
However, a mechanism with which we can tell LVM "hey, this volume should 
have all its space as reserved, don't worry about preventing snapshots 
and/or freezing them when free space runs out".

This was more or less the case with classical, fat LVM: a snapshot 
runnig out of space *will* fail, but the original volume remains 
unaffected.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8

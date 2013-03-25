Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2PLTZku022496
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 17:29:35 -0400
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2PLTXrU005736
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 17:29:34 -0400
Received: by mail-ea0-f176.google.com with SMTP id h10so2625672eaj.35
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 14:29:32 -0700 (PDT)
Sender: Andres Toomsalu <andres.toomsalu@activesys.org>
Mime-Version: 1.0 (Apple Message framework v1283)
From: Andres Toomsalu <andres@active.ee>
In-Reply-To: <20130325194511.GA27105@redhat.com>
Date: Mon, 25 Mar 2013 23:29:28 +0200
Message-Id: <F1E05E1A-5FD0-43C0-BA8C-FC3588DEE23C@active.ee>
References: <1374A7DD-6B0E-4F25-8D2D-4D0AEA62C82B@active.ee>
	<20130325194511.GA27105@redhat.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] LVM thin LV filesystem superblock corruption
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
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Snitzer <snitzer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>


On 25.03.2013, at 21:45, Mike Snitzer wrote:

> On Fri, Mar 22 2013 at 11:12am -0400,
> Andres Toomsalu <andres@active.ee> wrote:
>=20
>> Update! Issue seems to be active only with PERC H800 and MD1200 disks - =
local raid with PERC H700 and lvm thin lv-s work fine without corrupting on=
 reboot.
>>=20
>>=20
>> We stumbled on strange lvm thinly provisioned LV filesystem corruption c=
ase - here are steps that reproduce the issue:
>>=20
>> lvcreate --thinpool pool -L 8T --poolmetadatasize 16G VolGroupL1
>> lvcreate -T VolGroupL1/pool -V 2T --name thin_storage
>> mkfs.ext4 /dev/VolGroupL1/thin_storage
>> mount /dev/VolGroupL1/thin_storage /storage/
>> reboot
>=20
> Couple things:
> 1) mkfs.ext4 does buffered IO so there is no gaurantee the superblock or
>   any other block group destriptors, have actually been committed to
>   non-volatile storage when mkfs.ext4 completes

I see. While this could have been true during the tests I did later after d=
iscovering the issue - its a bit unlikely the case for first time the issue=
 appeared - as there was about 24h time window between mkfs and host reboot=
 then - and data was copied into new /storage LV.

One more strange thing about the issue - during the tests I made repeatedly=
 thin LV setups cycles with different pool, pool metadata and lv sizes - fr=
om 50G to 8TB - which seemed not to affect anything.
Once it failed - it failed repeatedly - until the moment it started to work=
 again and then it worked repeatedly - that behaviour actually could suppor=
t the buffered IO theory=EF=BF=BD
Right now I cant reproduce the issue anymore at will - waiting for failure =
again.

> 2) reboot sequence is very distro specific; /storage may not have been
>   unmounted before reboot -- if it was unmounted then all data
>   should've been pushed out to non-volatile storage

Distro is CentOS 6.4 - should unmount LV-s correctly as far as I know.

>=20
> So if you add this to command before "reboot" do you no longer have
> missing data after the system reboots?:
>=20
> echo 3 > /proc/sys/vm/drop_caches

will try next time

>=20
>> # NB! without host reboot unmount/mount succeeds!
>>=20
>> [root@node3 ~]# mount /dev/VolGroupL1/thin_storage /storage/
>> mount: you must specify the filesystem type
>>=20
>> Tried also to set poolmetadatasize to 2G, 14G, 15G and pool size to 1T, =
2T - no change - corruption still happens.
>>=20
>> Hardware setup:=20
>> * Underlaying block device (sdb) is hosted by PERC H800 controller and d=
isks are coming from SAS disk expansion box (DELL MD1200).
> ...
>> What could be the issue here?
>=20
> I assume by "reboot" you mean the host (with the PERC card) never loses
> power?

Yes - soft reboot - no power cut.

>=20
> What layers of hardware writeback caching are in place in the
> H800+MD1200 case vs H700+localraid?

H800 has RAID10 array with cache set to 'writethrough'
H700 has RAID10 array with cache set to 'writeback'

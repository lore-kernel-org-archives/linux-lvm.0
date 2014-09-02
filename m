Received: from [10.34.131.181] (mperina.brq.redhat.com [10.34.131.181])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8296fMa010801
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2014 05:06:41 -0400
Message-ID: <540588A0.50402@redhat.com>
Date: Tue, 02 Sep 2014 11:06:40 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAAN_kG2zBvS1iVhdqO2zvQ2+QW-SpyM2PhHG2j+zhSFZbOmnRg@mail.gmail.com>
In-Reply-To: <CAAN_kG2zBvS1iVhdqO2zvQ2+QW-SpyM2PhHG2j+zhSFZbOmnRg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Data percentage too large after thin_dump
	--repair/thin_restore
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 1.9.2014 v 20:13 Timur Alperovich napsal(a):
> Hi there,
>
> I'm using LVM 2.02.98 and encountered a metadata corruption issue. To recover
> from it, I attempted to perform the following steps:
> 1. thin_check /dev/mapper/pool_tmeta
> 2. thin_dump /dev/mapper/pool_tmeta > /tmp/metadata

Hi

NEVER EVER use _tmeta device from running active thin-pool volume.
It's the very same case like you would be running  'fsck' on
a mounted filesystem.


> 3. dd if=/dev/zero of=/dev/mapper/pool_tmeta
> 4. thin_restore -i /tmp/metadata -o /dev/mapper/pool_tmeta
>
> All of the above steps have succeeded, however, when attempting to list the
> _metadata\_percent_ field, I get an error:

I'm surprised you've not got kernel OOPS after such brutal destruction
of life metadata device (i.e. almost equal to zeroing your root volume).

> Is this a known issue and is there a workaround? I need to be able to examine
> the _metadata\_percent_ field to make sure we don't exhaust the metadata space.
>

Normal way -

lvconvert --repair vg/pool


If this is not working - then you can 'swap' metadata out of your thin-pool
using following sequence-

- make sure pool is not active.
- build temporary local LV   (lvcreate -l1 vg -n temp)
- swap this LV with metadata of to-be-repaired pool
   (lvconvert --thinpool vg/fixpool --poolmetadata temp)
- activate 'temp' LV now with pool's metadata
   (lvchange -ay vg/temp)
- repair metadata
   (you may need other 'bigger' volume to restore fixed metadata)
   (i.e.  thin_restore -i /dev/vg/temp -o /dev/vg/biggertemp)
- thin_check restored volume
- thin_dump - and compare  vgcfgrestore & this dump are at the same
   transaction_id state (look at lvm2 metadata for thin pool)
- deactivate again related volumes
- swap repaired LV back
   (lvconvert --thinpool vg/fixpool --poolmetadata repairedtemp)
- try to active repaired thin pool
- remove unneeded volumes from vg....


Zdenek

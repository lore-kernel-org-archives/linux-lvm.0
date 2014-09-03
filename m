Received: from [10.34.130.202] (dhcp130-202.brq.redhat.com [10.34.130.202])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8395vnj025604
	for <linux-lvm@redhat.com>; Wed, 3 Sep 2014 05:05:57 -0400
Message-ID: <5406D9F3.4060402@redhat.com>
Date: Wed, 03 Sep 2014 11:05:55 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAAN_kG2zBvS1iVhdqO2zvQ2+QW-SpyM2PhHG2j+zhSFZbOmnRg@mail.gmail.com>	<540588A0.50402@redhat.com>
	<CAAN_kG1HmmoXzZscxvqScULvUaqv=Ay-b6BLADiH+A=u-r2-vg@mail.gmail.com>
In-Reply-To: <CAAN_kG1HmmoXzZscxvqScULvUaqv=Ay-b6BLADiH+A=u-r2-vg@mail.gmail.com>
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

Dne 2.9.2014 v 16:11 Timur Alperovich napsal(a):
> Thanks for the reply Zdenek!
>
> I realized that the biggest confusion for me is that I'm using LVM2 tools
> 2.02.98-6 (which is the latest version in Ubuntu) and the swapping support was
> added in 2.02.98-9 (I'm curious why they didn't pick the latest of 2.02.98).
>
> On Tue, Sep 2, 2014 at 2:06 AM, Zdenek Kabelac <zkabelac@redhat.com
> <mailto:zkabelac@redhat.com>> wrote:
>
>     Dne 1.9.2014 v 20:13 Timur Alperovich napsal(a):
>
>         Hi there,
>
>         I'm using LVM 2.02.98 and encountered a metadata corruption issue. To
>         recover
>         from it, I attempted to perform the following steps:
>         1. thin_check /dev/mapper/pool_tmeta
>         2. thin_dump /dev/mapper/pool_tmeta > /tmp/metadata
>
>
>     Hi
>
>     NEVER EVER use _tmeta device from running active thin-pool volume.
>     It's the very same case like you would be running  'fsck' on
>     a mounted filesystem.
>
>         3. dd if=/dev/zero of=/dev/mapper/pool_tmeta
>         4. thin_restore -i /tmp/metadata -o /dev/mapper/pool_tmeta
>
>         All of the above steps have succeeded, however, when attempting to
>         list the
>         _metadata\_percent_ field, I get an error:
>
>
>     I'm surprised you've not got kernel OOPS after such brutal destruction
>     of life metadata device (i.e. almost equal to zeroing your root volume).
>
>
>         Is this a known issue and is there a workaround? I need to be able to
>         examine
>         the _metadata\_percent_ field to make sure we don't exhaust the
>         metadata space.
>
>
>     Normal way -
>
>     lvconvert --repair vg/pool
>
>
> I believe this was added in 2.02.102. Unfortunately, upgrading LVM2 is a bit
> tricky on Ubuntu (will need to build the package from source).
>
>
>
>     If this is not working - then you can 'swap' metadata out of your thin-pool
>     using following sequence-
>
>     - make sure pool is not active.
>     - build temporary local LV   (lvcreate -l1 vg -n temp)
>     - swap this LV with metadata of to-be-repaired pool
>        (lvconvert --thinpool vg/fixpool --poolmetadata temp)
>
>
> This command fails, as --poolmetadata is not a valid option. I found that the
> swapping was not supported until 2.02.98-9 and I'm using 2.02.98-6 (in
> 2.02.98-9 changelog: "Add lvconvert support to swap thin pool metadata
> volume."). Is there a way to do this without the swapping support? I guess I
> should be able to do it with dmsetup? I'm not sure how painful that would be.
>
> I'll look into upgrading the version, as well (which is probably the right
> thing to do).

IMHO by far the compilation of upstream git repo is the simplest way how
to do it - everything else is much much more complicated.

You could probably active thin-pool - and via dmsetup remove running pool 
target - which should left active  _tmeta device - and then you should be able 
to play with this - thought it will be very tricky to not make a mistake
with this type of work.

Zdenek

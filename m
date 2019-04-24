MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 24 Apr 2019 21:41:56 +0300
From: Anssi Hannula <anssi.hannula@iki.fi>
In-Reply-To: <20190424180557.GC3218@redhat.com>
References: <eacb8d5110c2c658fa83dbd589fd6fbf@iki.fi>
	<3ec9acca2f8161282341f561c3c7c988@iki.fi>
	<20190424180557.GC3218@redhat.com>
Message-ID: <e7707fb452eb063e1fa9d360663f03d1@iki.fi>
Subject: Re: [linux-lvm] Internal error: Referenced LV pvmove0 not listed in
 VG
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
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

David Teigland kirjoitti 2019-04-24 21:05:
> On Wed, Apr 24, 2019 at 08:10:11PM +0300, Anssi Hannula wrote:
>> Anssi Hannula kirjoitti 2019-04-24 02:06:
>> > Hi all,
>> >
>> > I'm getting the following error when trying to run a pvmove command:
>> >
>> > # pvmove -v /dev/md0:18122768-19076597
>> >     Cluster mirror log daemon not included in build.
>> >     Archiving volume group "delta" metadata (seqno 72).
>> >     Creating logical volume pvmove0
>> >     activation/volume_list configuration setting not defined: Checking
>> > only host tags for delta/home_r.
>> >     Moving 167398 extents of logical volume delta/home_r.
>> >     activation/volume_list configuration setting not defined: Checking
>> > only host tags for delta/data_r.
>> >   Internal error: Referenced LV pvmove0 not listed in VG delta.
>> >
>> > This is with git master, but I see the same on 2.02.177.
> 
> This old comment stands out as possibly related:
> 
>   /* FIXME Cope with non-contiguous => splitting existing segments */
> 
> https://sourceware.org/git/?p=lvm2.git;a=blob;f=tools/pvmove.c;h=c5e39292228393d6d2ce0a21018dba5b5c306da5;hb=HEAD#l342
> 
> It seems you're trying to pvmove a range that covers two segments, 
> which I
> guess doesn't work (I don't know why it doesn't check for this to 
> provide
> a better error.)  If you pvmove segments separately it should avoid 
> that
> limitation (your test works for me if I do "pvmove
> /dev/loop0:18122768-18909199" which avoids crossing a segment 
> boundary.)

Thanks, pvmoving the segments separately seems to work around the issue 
(well, at least the first pvmove started fine).


> 
> 
>> Here is a short reproducer:
>> 
>> ------clip------
>> #!/bin/sh
>> 
>> set -ex
>> 
>> mkdir -p lvmtestdir
>> mount -t tmpfs none lvmtestdir
>> cd lvmtestdir
>> 
>> truncate --size=$((156275497728*512)) testimg1
>> truncate --size=$((46883372928*512)) testimg2
>> 
>> dev1="$(losetup -f --show testimg1)"
>> dev2="$(losetup -f --show testimg2)"
>> 
>> pvcreate "$dev1"
>> pvcreate "$dev2"
>> 
>> vgcreate TESTVG "$dev1" "$dev2"
>> 
>> lvcreate --name=lv0 -l $((1048576+167398)) TESTVG \
>> 	"$dev1":0+655360 \
>> 	"$dev1":17037866+393216 \
>> 	"$dev1":18909200+167398
>> lvcreate --name=lv1 -l $((16382506+1478118)) TESTVG \
>> 	"$dev1":917504+16120362 \
>> 	"$dev1":655360+262144 \
>> 	"$dev1":17431082+1478118
>> 
>> # ERROR
>> pvmove -v "$dev1":18122768-19076597 || :
>> 
>> # cleanup
>> vgremove --force TESTVG
>> losetup -d "$dev1"
>> losetup -d "$dev2"
>> cd ..
>> sleep 1 # lvmtestdir busy?
>> umount lvmtestdir
>> ------clip------

-- 
Anssi Hannula

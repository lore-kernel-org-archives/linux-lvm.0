Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9C6vwLE005154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 12 Oct 2016 02:57:59 -0400
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CE2B7F76E
	for <linux-lvm@redhat.com>; Wed, 12 Oct 2016 06:57:57 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id f128so2356248qkb.0
	for <linux-lvm@redhat.com>; Tue, 11 Oct 2016 23:57:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANh6N62PTyFj5FmJz9iZF7f7dAx0CK=2HOovNk1bAWP9wZU4Mw@mail.gmail.com>
References: <CANh6N61D51T9KjYSsh2WdKYPzjrPeVHOkv9JrL9_B4cRHw2USQ@mail.gmail.com>
	<CAE-HYsMjvbBXEoMHPF1gybwC-XVLequ4D7bzmzfmwJRjkGFhAA@mail.gmail.com>
	<CANh6N62PvwaTK4JXUpxmzfSbTY80Yc=f6c7JiKEfVhsXNL=9tw@mail.gmail.com>
	<CAE-HYsNiu1W8Wv9VH5KbPWq04OTyY9e1AkBg=-scb6R399sXrg@mail.gmail.com>
	<CANh6N62PTyFj5FmJz9iZF7f7dAx0CK=2HOovNk1bAWP9wZU4Mw@mail.gmail.com>
From: Giuliano Procida <giuliano.procida@gmail.com>
Date: Wed, 12 Oct 2016 07:57:36 +0100
Message-ID: <CAE-HYsPgRQiSQ_hMunSbJJgRkRGZLLEf1K5T2SA_zH8YhrfE8w@mail.gmail.com>
Subject: Re: [linux-lvm] LVM RAID5 out-of-sync recovery
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On 9 October 2016 at 20:00, Slava Prisivko <vprisivko@gmail.com> wrote:
> I tried to reassemble the array using 3 different pairs of correct LV
> images, but it doesn't work (I am sure because I cannot luksOpen a LUKS
> image which is in the LV, which is almost surely uncorrectable).

I would hope that a luks volume would at least be recognisable using
file -s. If you extract the image data into a regular file you should
be able to losetup that and then luksOpen the loop device.

> This is as useful as it gets (-vvvv -dddd):
>     Loading vg-test_rmeta_0 table (253:35)
>         Adding target to (253:35): 0 8192 linear 8:34 2048
>         dm table   (253:35) [ opencount flush ]   [16384] (*1)
>     Suppressed vg-test_rmeta_0 (253:35) identical table reload.
>     Loading vg-test_rimage_0 table (253:36)
>         Adding target to (253:36): 0 65536 linear 8:34 10240
>         dm table   (253:36) [ opencount flush ]   [16384] (*1)
>     Suppressed vg-test_rimage_0 (253:36) identical table reload.
>     Loading vg-test_rmeta_1 table (253:37)
>         Adding target to (253:37): 0 8192 linear 8:2 1951688704
>         dm table   (253:37) [ opencount flush ]   [16384] (*1)
>     Suppressed vg-test_rmeta_1 (253:37) identical table reload.
>     Loading vg-test_rimage_1 table (253:38)
>         Adding target to (253:38): 0 65536 linear 8:2 1951696896
>         dm table   (253:38) [ opencount flush ]   [16384] (*1)
>     Suppressed vg-test_rimage_1 (253:38) identical table reload.
>     Loading vg-test_rmeta_2 table (253:39)
>         Adding target to (253:39): 0 8192 linear 8:18 1217423360
>         dm table   (253:39) [ opencount flush ]   [16384] (*1)
>     Suppressed vg-test_rmeta_2 (253:39) identical table reload.
>     Loading vg-test_rimage_2 table (253:40)
>         Adding target to (253:40): 0 65536 linear 8:18 1217431552
>         dm table   (253:40) [ opencount flush ]   [16384] (*1)
>     Suppressed vg-test_rimage_2 (253:40) identical table reload.
>     Creating vg-test
>         dm create vg-test
> LVM-Pgjp5f2PRJipxvoNdsYmq0olg9iWwY5pJjiPmiesfxvdeF5zMvTsJC6vFfqNgNnZ [
> noopencount flush ]   [16384] (*1)
>     Loading vg-test table (253:84)
>         Adding target to (253:84): 0 131072 raid raid5_ls 3 128 region_size
> 1024 3 253:35 253:36 253:37 253:38 253:39 253:40
>         dm table   (253:84) [ opencount flush ]   [16384] (*1)
>         dm reload   (253:84) [ noopencount flush ]   [16384] (*1)
>   device-mapper: reload ioctl on (253:84) failed: Invalid argument
>
> I don't see any problems here.

In my case I got (for example, and Gmail is going to fold the lines, sorry):

[...]
    Loading vg0-photos table (254:45)
        Adding target to (254:45): 0 1258291200 raid raid6_zr 3 128
region_size 1024 5 254:73 254:74 254:37 254:38 254:39 254:40 254:41
254:42 254:43 254:44
        dm table   (254:45) [ opencount flush ]   [16384] (*1)
        dm reload   (254:45) [ noopencount flush ]   [16384] (*1)
  device-mapper: reload ioctl on (254:45) failed: Invalid argument

The actual errors are in the kernel logs:

[...]
[144855.931712] device-mapper: raid: New device injected into existing
array without 'rebuild' parameter specified
[144855.935523] device-mapper: table: 254:45: raid: Unable to assemble
array: Invalid superblocks
[144855.939290] device-mapper: ioctl: error adding target to table

128 means 128*512 so this is 64k as in your case. I was able to verify
that my extracted images matched the RAID device. My problem was not
assembling the array, it was that the array would be rebuilt on every
subsequent use:

    Loading vg0-var table (254:21)
        Adding target to (254:21): 0 52428800 raid raid5_ls 5 128
region_size 1024 rebuild 0 5 254:11 254:12 254:13 254:14 254:15 254:16
254:17 254:18 254:19 254:20
        dm table   (254:21) [ opencount flush ]   [16384] (*1)
        dm reload   (254:21) [ noopencount flush ]   [16384] (*1)
        Table size changed from 0 to 52428800 for vg0-var (254:21).

>> You can check the rmeta superblocks with
>> https://drive.google.com/open?id=0B8dHrWSoVcaDUk0wbHQzSEY3LTg
>
> Thanks, it's very useful!
>
> /dev/mapper/vg-test_rmeta_0
> found RAID superblock at offset 0
>  magic=1683123524
>  features=0
>  num_devices=3
>  array_position=0
>  events=56
>  failed_devices=0
>  disk_recovery_offset=18446744073709551615
>  array_resync_offset=18446744073709551615
>  level=5
>  layout=2
>  stripe_sectors=128
> found bitmap file superblock at offset 4096:
>          magic: 6d746962
>        version: 4
>           uuid: 00000000.00000000.00000000.00000000
>         events: 56
> events cleared: 33
>          state: 00000000
>      chunksize: 524288 B
>   daemon sleep: 5s
>      sync size: 32768 KB
> max write behind: 0
>
> /dev/mapper/vg-test_rmeta_1
> found RAID superblock at offset 0
>  magic=1683123524
>  features=0
>  num_devices=3
>  array_position=4294967295
>  events=62
>  failed_devices=1
>  disk_recovery_offset=0
>  array_resync_offset=18446744073709551615
>  level=5
>  layout=2
>  stripe_sectors=128
> found bitmap file superblock at offset 4096:
>          magic: 6d746962
>        version: 4
>           uuid: 00000000.00000000.00000000.00000000
>         events: 60
> events cleared: 33
>          state: 00000000
>      chunksize: 524288 B
>   daemon sleep: 5s
>      sync size: 32768 KB
> max write behind: 0
>
> /dev/mapper/vg-test_rmeta_2
> found RAID superblock at offset 0
>  magic=1683123524
>  features=0
>  num_devices=3
>  array_position=2
>  events=62
>  failed_devices=1
>  disk_recovery_offset=18446744073709551615
>  array_resync_offset=18446744073709551615
>  level=5
>  layout=2
>  stripe_sectors=128
> found bitmap file superblock at offset 4096:
>          magic: 6d746962
>        version: 4
>           uuid: 00000000.00000000.00000000.00000000
>         events: 62
> events cleared: 33
>          state: 00000000
>      chunksize: 524288 B
>   daemon sleep: 5s
>      sync size: 32768 KB
> max write behind: 0
>
> The problem I see here is that events count is different for the three
> rmetas.

The event counts relate to the intent bitmap (I believe).

That looks OK, because failed devices is 1, meaning 0b0...01; i.e.,
device 0 of the array is "failed". The real problem is device 1 which
has

>  array_position=4294967295

This should be 1 instead. This is 32-bit unsigned 0xf...f. It may be
that it has special significance in kernel or LVM code. I've not
checked beyond noticing one test: role < 0.

I recommend using diff3 or pairwise diff on the metadata dumps to
ensure you have not missed any other differences.

One possible way forward:

(Optionally) adapt my resync code so it writes back to the original
files instead instead of outputting corrected linear data.

Modify the rmeta data to remove the failed flag and reset the bad
position to the correct value. sync and power off (or otherwise
prevent the device mapper from writing back bad data).

It's possible the RAID volume will fail to sync due to bitmap
inconsistencies. I don't know how to re-write the superblocks to say
"trust me, all data are in sync".

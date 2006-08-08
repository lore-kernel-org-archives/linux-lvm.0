Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k78AeW8w000551
	for <linux-lvm@redhat.com>; Tue, 8 Aug 2006 06:40:32 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.168])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k78AePjJ010405
	for <linux-lvm@redhat.com>; Tue, 8 Aug 2006 06:40:25 -0400
Received: by ug-out-1314.google.com with SMTP id c2so67708ugf
	for <linux-lvm@redhat.com>; Tue, 08 Aug 2006 03:40:24 -0700 (PDT)
Message-ID: <67d53e40608080340y484e4674j8937f47877cda2f4@mail.gmail.com>
Date: Tue, 8 Aug 2006 13:40:24 +0300
From: "Markus Laire" <malaire@gmail.com>
Subject: Re: [linux-lvm] lvm partition on lv
In-Reply-To: <67d53e40608080334l7445e32fga32f7381ed49dc65@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <eb8oo1$rj2$1@sea.gmane.org>
	<67d53e40608080334l7445e32fga32f7381ed49dc65@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 8/8/06, Markus Laire <malaire@gmail.com> wrote:
> On 8/8/06, Randall Smith <randall@tnr.cc> wrote:
> > Let's say on /dev/vg1/test I had one LVM partition and one ext3
> > partition.  How can I access those separate partitions since it's only
> > one device (/dev/vg1/test)?  Normally, a partitioned block device
> > (/dev/hda) would show up like /dev/hda1, dev/hda2, etc.
>
> With loop-device, you can use only part of the block-device as new
> block-device (See options -o and -s in man:losetup)
>
> So if you know the positions where the partitions start, and their
> lengths (both in bytes), you could do something like this: (I havn't
> tested this, so there might be some errors in these commands. But the
> basic idea should work)
>
> # make LVM partition available at /dev/loop1
> losetup -o $lvm_start -s $lvm_size /dev/loop1 /dev/vg1/test
> mkdir /mnt/test
> # Mount ext3-partition at /mnt/test using loop-device
> mount -t ext3 -o offset=$ext3_start,sizelimit=$ext3_length
> /dev/vg1/test /mnt/test

Well, last command is missing at least "loop" option - i.e. it should be

mount -t ext3 -o loop,offset=$ext3_start,sizelimit=$ext3_length
/dev/vg1/test /mnt/test

or you could use these instead
losetup -o $ext3_start -s $ext3_length /dev/loop2 /dev/vg1/test
mount -t ext3 /dev/loop2 /mnt/test

I hope I didn't make other mistakes...

($lvm_size and $ext3_length both means the size of the partition in
bytes - I should've used 'size' or 'length' for both for consistency)

-- 
Markus Laire

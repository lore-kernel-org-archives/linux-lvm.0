Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5MHvrgi020322
	for <linux-lvm@redhat.com>; Mon, 22 Jun 2009 13:57:53 -0400
Received: from thor.merit.edu (thor.merit.edu [198.108.1.14])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n5MHvS1q007415
	for <linux-lvm@redhat.com>; Mon, 22 Jun 2009 13:57:28 -0400
Message-Id: <0B98E9FF-2CFB-4501-B200-07039DF2819A@merit.edu>
From: Anthony Clark <anthony@merit.edu>
In-Reply-To: <4A3FC045.1080709@knebb.de>
Mime-Version: 1.0 (Apple Message framework v935.3)
Subject: Re: [linux-lvm] recovering data from inside a partitioned lv
Date: Mon, 22 Jun 2009 13:57:27 -0400
References: <104D56B6-A5AA-44BC-A1A6-EDCF2FC098A8@merit.edu>
	<4A3FC045.1080709@knebb.de>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

The loop device solution worked!

thank you Christian!
--
Anthony Clark - anthony@merit.edu
734 527 5744 - (aim)anthonyclark




On Jun 22, 2009, at 1:32 PM, Christian V=EF=BF=BDlker wrote:

> Hi,
>
>> Server has been rebooted, and now only /dev/vg1/lv1 is shown.  parted
>> can open the lv and shows 1 partition inside, but doesn't understand
>> ext3 volumes, so can't copy the partition to another disk.  tune2fs
>> can't see /dev/vg1/lv1p1, or I'd use that to change the fs type to =20
>> ext2.
> I think the partition entry under /dev is missing. After the initial
> fdisk it was created.
> So two ways to recover:
> -Open fdisk on the lv. Do not do any changes, but leave and (w)rite. =20
> I'd
> say the entries lv1p1 will be re-created then. Mount it, copy the data
> and get rid of partition.
> -Use loop device. This is much more complicated but will work, though:
> losetup -o$[512*63] /dev/loop1 /dev/vg1/lv1
> So it will create a loop device /dev/loop1 from lv1 with an offset of
> 512*63 (default blocksize and partitioning schema, may vary thought) .
> And then simply mount the loop device with the "-o loop" option for
> mount. Copy and get rid of partition.
>
> Hope this helps, let us know if it does.
> GReetings
>
> Christian
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

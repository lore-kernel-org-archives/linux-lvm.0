Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k94LN5tq002978
	for <linux-lvm@redhat.com>; Wed, 4 Oct 2006 17:23:05 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.230])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k94LMwjm009672
	for <linux-lvm@redhat.com>; Wed, 4 Oct 2006 17:22:58 -0400
Received: by wx-out-0506.google.com with SMTP id i30so383341wxd
	for <linux-lvm@redhat.com>; Wed, 04 Oct 2006 14:22:58 -0700 (PDT)
Message-ID: <da2267130610041422pa597b5dq619ca685a5e2de02@mail.gmail.com>
Date: Wed, 4 Oct 2006 15:22:58 -0600
From: "Jason Gunthorpe" <jgunthorpe@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_102942_4207902.1159996978003"
Subject: [linux-lvm] LVM2, RAID5 and ext3 stride
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
To: linux-lvm@redhat.com

------=_Part_102942_4207902.1159996978003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi All,

I wonder if anyone on this list might be able to clarify the best method for
optimizing the performance of ext3 on a RAID 5 through LVM. My understanding
is that when making the disk the stride parameter should be set the to the
RAID 5 stripe size divided by the ext3 block size, which is easy.. But, I've
also read, that to get the full performance gain it is necessary for the
ext3 filesystem to reside in extents that are naturally aligned to the RAID
5 block side (ie the real LBA of block 0 on the filesystem modulo the raid
block size must be 0). Is this even true? It sort of makes sense if the
stride parameter is building the filesystem so that things are clustered
together to avoid the RAID5 partial block read-modify-write penalty..

When I went to verify this I found that the LVM's PE's have been shifted by
384 sectors from the start of the partition, so the filesystem is not
aligned.. ie:
$ dm table
main-xen0: 0 6291456 linear 8:2 384

Is there some way to run pvcreate to get 4M extents that are always 4M
aligned, and still be able to do interesting things like grow the pv?

Additionally, is there a straightforward method to get the partition the LVM
is on aligned as well? (The partition is necessary because the RAID is the
only disk in the system and there is a small /boot partition).

If this really is necessary, it would be a handy feature to be able to get
pvcreate to check the partition alignment and add the necessary padding so
that the extents are aligned..

As an aside, I'm using a 3ware RAID controller to build a 3 disk RAID 5 with
the unit's stripe size set to 64k, so I expect to use a ext3 stride
parameter of 16 and an alignment of at least 64k on the PE's.

Thanks,
Jason

------=_Part_102942_4207902.1159996978003
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi All,<br><br>I wonder if anyone on this list might be able to clarify the best method for optimizing the performance of ext3 on a RAID 5 through LVM. My understanding is that when making the disk the stride parameter should be set the to the RAID 5 stripe size divided by the ext3 block size, which is easy.. But, I've also read, that to get the full performance gain it is necessary for the ext3 filesystem to reside in extents that are naturally aligned to the RAID 5 block side (ie the real LBA of block 0 on the filesystem modulo the raid block size must be 0). Is this even true? It sort of makes sense if the stride parameter is building the filesystem so that things are clustered together to avoid the RAID5 partial block read-modify-write penalty..
<br><br>When I went to verify this I found that the LVM's PE's have been shifted by 384 sectors from the start of the partition, so the filesystem is not aligned.. ie:<br>$ dm table<br>main-xen0: 0 6291456 linear 8:2 384<br>
<br>Is there some way to run pvcreate to get 4M extents that are always 4M aligned, and still be able to do interesting things like grow the pv?<br><br>Additionally, is there a straightforward method to get the partition the LVM is on aligned as well? (The partition is necessary because the RAID is the only disk in the system and there is a small /boot partition).
<br><br>If this really is necessary, it would be a handy feature to be able to get pvcreate to check the partition alignment and add the necessary padding so that the extents are aligned..<br><br>As an aside, I'm using a 3ware RAID controller to build a 3 disk RAID 5 with the unit's stripe size set to 64k, so I expect to use a ext3 stride parameter of 16 and an alignment of at least 64k on the PE's.
<br><br>Thanks,<br>Jason<br><br>

------=_Part_102942_4207902.1159996978003--

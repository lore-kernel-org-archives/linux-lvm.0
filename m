Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7B864tZ024116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 11 Aug 2015 04:06:04 -0400
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mx1.redhat.com (Postfix) with ESMTPS id 3D6638E933
	for <linux-lvm@redhat.com>; Tue, 11 Aug 2015 08:06:03 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so50234892wic.0
	for <linux-lvm@redhat.com>; Tue, 11 Aug 2015 01:06:02 -0700 (PDT)
Message-ID: <55C9AD4F.5050900@siteground.com>
Date: Tue, 11 Aug 2015 11:07:43 +0300
From: vaLentin chernoZemski <valentin@siteground.com>
MIME-Version: 1.0
References: <55C86723.4000707@siteground.com>
	<20150810174900.GC22719@redhat.com>
In-Reply-To: <20150810174900.GC22719@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvremove does not pass discards if volume is part
	of thin pool
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: linux-lvm@redhat.com

> Plese verify your kernel has this commit:
> 19fa1a6756e ("dm thin: fix discard support to a previously shared block")
>
> But it doesn't look like you're using snapshots so this may not matter.

The kernel we are using includes the changes listed in that commit.

> If you do have the patch I referenced above then something else is going
> on.  You should probably run with: lvremove -vvvv to see if lvm is
> actually issuing a discard.  Or you could use blktrace to see if the
> thin device you're removing is actually receiving a discard.

lsblk -D shows DISC-ZERO as 1 for loop dev, thingroup_tmeta and 
thingroup_tdata

However it shows DISC-ZERO as 0 for thingroup-tpool in both tmeta and 
tdata sections and all its child devices.

It appears to me that for some reason device mapper or kernel (not sure 
which should do that) are not advertising _tpool_ tmeta and tdata 
devices to support discards (as confirmed by lsblk). That's why during 
lvremove lvm skips issuing discards on those devices.

The only references in lvremove -f -vvvv that are stating discards are those

#libdm-deptree.c:2681     Suppressed testgroup-thingroup (253:36) 
identical table reload.
#ioctl/libdm-iface.c:1795         dm status   (253:35) ON   [16384] (*1)
#libdm-deptree.c:1444         Thin pool transaction id: 3 status: 3 
32/2560 1679/160928 - rw discard_passdown.
#ioctl/libdm-iface.c:1795         dm message   (253:35) OF  delete 1 
[16384] (*1)
#ioctl/libdm-iface.c:1795         dm message   (253:35) OF 
set_transaction_id 3 4 [16384] (*1)
#ioctl/libdm-iface.c:1795         dm status   (253:35) ON   [16384] (*1)
#libdm-deptree.c:1444         Thin pool transaction id: 4 status: 4 
18/2560 0/160928 - rw discard_passdown.
#activate/dev_manager.c:3127         Creating CLEAN tree for thingroup.
#activate/dev_manager.c:1789         Getting device info for 
testgroup-thingroup 
[LVM-qg1G3n02Kkjm0KKnhGhzP7JfoeGiiemlrsYfP0Ti5MCUiiPOWhTxoyRlvclhd3EH-pool]
#ioctl/libdm-iface.c:1795         dm info 
LVM-qg1G3n02Kkjm0KKnhGhzP7JfoeGiiemlrsYfP0Ti5MCUiiPOWhTxoyRlvclhd3EH-pool OF 
   [16384] (*1)
#ioctl/libdm-iface.c:1795         dm deps   (253:36) OF   [16384] (*1)
#ioctl/libdm-iface.c:1795         dm deps   (253:35) OF   [16384] (*1)
#ioctl/libdm-iface.c:1795         dm deps   (253:34) OF   [16384] (*1)
#ioctl/libdm-iface.c:1795         dm deps   (253:33) OF   [16384] (*1)

Those are the name of the devices with those minor major numbers:

testgroup-thingroup (253:36)
  `-testgroup-thingroup-tpool (253:35)
     |-testgroup-thingroup_tdata (253:34)
     |  `- (7:2)
     `-testgroup-thingroup_tmeta (253:33)
        `- (7:2)
testgroup-testvol (253:37)
  `-testgroup-thingroup-tpool (253:35)
     |-testgroup-thingroup_tdata (253:34)
     |  `- (7:2)
     `-testgroup-thingroup_tmeta (253:33)
        `- (7:2)

And this is the output of lsblk -D

NAME                                                       DISC-ALN 
DISC-GRAN DISC-MAX DISC-ZERO
|-testgroup-thingroup_tmeta (dm-33)                               0 
    4K       4G         1
| `-testgroup-thingroup-tpool (dm-35)                             0 
   64K      64K         0
|   |-testgroup-thingroup (dm-36)                                 0 
   64K      64K         0
|   `-testgroup-testvol (dm-37)                                   0 
   64K      64K         0
`-testgroup-thingroup_tdata (dm-34)                               0 
    4K       4G         1
   `-testgroup-thingroup-tpool (dm-35)                             0 
    64K      64K         0
     |-testgroup-thingroup (dm-36)                                 0 
    64K      64K         0
     `-testgroup-testvol (dm-37)                                   0 
    64K      64K         0

I am yet to test with latest kernel, libdevmapper, and lvm2 but if you 
have any other ideas I will be happy to hear.

Sincerely,

vaLentin

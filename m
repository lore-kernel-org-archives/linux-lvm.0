Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j33JpfpH011887
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2005 20:51:41 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DIB8H-0000hw-2c
	for linux-lvm@redhat.com; Sun, 03 Apr 2005 20:51:41 +0100
Date: Sun, 3 Apr 2005 20:51:41 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM Error
Message-ID: <20050403195141.GR14307@agk.surrey.redhat.com>
References: <200504031040.05910.t-rigby@shaw.ca>
	<200504031046.00394.t-rigby@shaw.ca>
	<20050403191940.GO14307@agk.surrey.redhat.com>
	<200504031238.16673.t-rigby@shaw.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200504031238.16673.t-rigby@shaw.ca>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Apr 03, 2005 at 11:38:16AM -0800, Terry Rigby wrote:
> I did figure out the problem though.  I had a symlink to /dev/hdd and I think 

Ah.  Debian cdrom mix-up again?

> fileserver:~# vgchange -a y 4474
>   Volume group 4474 metadata is inconsistent
>   Volume group for uuid not found: 
> lIoGSWjLzjHDN61mdY0yqVbilyBU9xzFSoVzKiy750swPFxT8D0ijXGNAi3FddlG
>   0 logical volume(s) in volume group "4474" now active
 
Need more info: why it's inconsistent.  [Add -vvvv with 2.00.33]

Compare the metadata on each disk [vgcfbackup -P -f file] and
see if one of them is different/wrong.  If so, vgcfgrestore
from the correct version.

Alasdair
-- 
agk@redhat.com

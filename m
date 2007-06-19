Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5JAl3aR016688
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 06:47:03 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5JAl0Hx000904
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 06:47:01 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1I0ana-000628-KV
	for linux-lvm@redhat.com; Tue, 19 Jun 2007 12:18:59 +0200
Received: from p57a0fc0a.dip.t-dialin.net ([87.160.252.10])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 12:18:58 +0200
Received: from gator_ml by p57a0fc0a.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 12:18:58 +0200
From: Peter Daum <gator_ml@yahoo.de>
Date: Tue, 19 Jun 2007 11:49:32 +0200
Message-ID: <f588rd$trl$1@sea.gmane.org>
References: <f56smj$275$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <f56smj$275$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: pvresize after extending RAID array
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
To: linux-lvm@redhat.com


Little Addendum:
After a reboot (which of course defeats the purpose a little) lvm
recognizes the new device size:

# pvresize -v  -d  /dev/sdb
    Using physical volume(s) on command line
    Archiving volume group "raid6_12" metadata (seqno 30).
    Resizing physical volume /dev/sdb from 1192067 to 1549687 extents.
    Resizing volume "/dev/sdb" to 12695041664 sectors.
    Updating physical volume "/dev/sdb"
    Creating volume group backup "/etc/lvm/backup/raid6_12" (seqno 31).
  Physical volume "/dev/sdb" changed
  1 physical volume(s) resized / 0 physical volume(s) not resized

The figures reported by pvresize are the same as below (except without
warnings this time) so I guess it generally would be o.k in such a case
to just use the kernel's device size and set it manually with
"--setphysicalvolumesize"?


Peter Daum wrote:
> I have a physical volume consisting of 1 hardware raid array (/dev/sdb).
> Now I added some disks to the raid array, extending its size from 4.5
> to ~6 TB. The kernel (Linux 2.6.16.51) now correctly reports the new
> device size:
> 
> # cat /sys/block/sdb/size
> 12695042048
> 
>>From reading the manuals I got the impression, that all that is needed
> to be able to use the additional space is "pvresize /dev/sdb".
> Unfortunately, it looks like pvresize insists on the old device size:
> 
> # pvresize -v  -d  /dev/sdb
> File descriptor 3 left open
>     Using physical volume(s) on command line
>     Archiving volume group "raid6_12" metadata (seqno 19).
>     No change to size of physical volume /dev/sdb.
>     Resizing volume "/dev/sdb" to 9765416576 sectors.
>     Updating physical volume "/dev/sdb"
>     Creating volume group backup "/etc/lvm/backup/raid6_12" (seqno 20).
>   Physical volume "/dev/sdb" changed
>   1 physical volume(s) resized / 0 physical volume(s) not resized
> 
> Did I miss something? Is there anything to worry about or should I just
> go ahead and set the new device size manually:
> # pvresize -v  -d --setphysicalvolumesize 6347521024k /dev/sdb
> File descriptor 3 left open
>     Using physical volume(s) on command line
>     Archiving volume group "raid6_12" metadata (seqno 22).
>   WARNING: /dev/sdb: Overriding real size. You could lose data.
>     /dev/sdb: Pretending size is 12695042048 not 12695035904 sectors.
>     No change to size of physical volume /dev/sdb.
>     Resizing volume "/dev/sdb" to 12695041664 sectors.
>     Updating physical volume "/dev/sdb"
>     Creating volume group backup "/etc/lvm/backup/raid6_12" (seqno 23).
>   Physical volume "/dev/sdb" changed
>   1 physical volume(s) resized / 0 physical volume(s) not resized
> 
> In this case, pvresize comes up with yet another size for the device
> (12695035904 sectors) - is this the actual size of the device minus
> the space needed for lvm's metadata? Should I manually set to this?

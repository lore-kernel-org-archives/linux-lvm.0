Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5MJAlwj009666
	for <linux-lvm@redhat.com>; Thu, 22 Jun 2006 15:10:47 -0400
Received: from electra.uleth.ca (electra.uleth.ca [142.66.3.44])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5MJAkco010276
	for <linux-lvm@redhat.com>; Thu, 22 Jun 2006 15:10:46 -0400
Received: from [142.66.6.17] (port=50967 helo=juliet.netsrv.uleth.ca)
	by electra.uleth.ca with esmtp (Exim 4.52) id 1FtUZX-0004v6-Ky
	for linux-lvm@redhat.com; Thu, 22 Jun 2006 13:10:35 -0600
Received: from [142.66.136.200] (port=48459 helo=[142.66.136.200])
	by juliet.netsrv.uleth.ca with smtp (Exim 4.52) id 1FtUZX-0005A7-Jn
	for linux-lvm@redhat.com; Thu, 22 Jun 2006 13:10:35 -0600
From: Steven Mosimann <steven.mosimann@uleth.ca>
Date: Thu, 22 Jun 2006 13:12:40 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606221312.41790.steven.mosimann@uleth.ca>
Subject: [linux-lvm] lvm - problem replacing failed disk
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

>On Thu, Jun 15, 2006 at 03:41:20PM -0600, Steven Mosimann wrote:
>> (1) Replaced the failed disk with one of the same size  
>> (2) Used pvcreate to make the same physical volumes on the new disk
>> that were present on the failed disk.  Example of the actual command I
>> used was:
>>   pvcreate --uuid xxxxx /dev/sdb1
>> where xxxxx was the pv uuid from pvdisplay 
>
>Missing the --restorefile arg there (for safety - if it was originally
>created by lvm2 with default options it'll make no difference).
> 
>Missing a 'vgcfgrestore' step.
>
>> (3) Used vgchange -a y -P to activate the volume group
>
>No need for -P here.  That's what you use if you *don't* do steps 1 and 2 
>etc.
>
>Alasdair

I checked the commands I issued.  I got the pvcreate correct and the 
vgcfgrestore is present (though it was out of order with vgchange).  Here is 
what I have done in detail:

fdisk /dev/sdb 
(created three partitions of type LVM that are identical to those on the 
failed disk)

mkfs.ext3 /dev/sdb1
mkfs.ext3 /dev/sdb2
mkfs.ext3 /dev/sdb3
(formatted as ext3)

pvcreate --uuid xxxxx --restorefile /etc/lvm/archive/xxxx.ar /dev/sdb1
pvcreate --uuid xxxxx --restorefile /etc/lvm/archive/xxxx.ar /dev/sdb2
pvcreate --uuid xxxxx --restorefile /etc/lvm/archive/xxxx.ar /dev/sdb3

(chose archive file with all PV, LV and VG's from the functioning LVM setup)

vgcfgrestore -f /etc/lvm/backup/VG_data VG_data

(the VG_data matches the functioning LVM setup from above)

vgchange -ay

mount -t ext3 /dev/VG_data/LV_data /data
gives  
"error: wrong fs type, bad option, bad superblock on /dev/VG_data/LV_data, or 
too many mounted filesystems" 

mount /dev/VG_data/LV_data /data
gives
"mount: you must specify filesystem type" 
  

Any suggestions regarding how to proceed.

Steve 
(PS. our lab was out of town for a week so I'm only back at it now).
-- 
Steven Mosimann, PhD

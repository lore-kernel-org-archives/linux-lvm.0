Message-ID: <5345703E.2050401@ucdavis.edu>
Date: Wed, 09 Apr 2014 09:07:26 -0700
From: Ryan Davis <rrdavis@ucdavis.edu>
MIME-Version: 1.0
References: <016e01cf504d$68e3b0d0$3aab1270$@edu> <5342A6A9.6060104@redhat.com>
In-Reply-To: <5342A6A9.6060104@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Can't mount LVM RAID5 drives
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
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Thanks for explaining some of the aspects of LVs.  Used them for years 
but it's not until they break that I started reading more into it.

Here is the block device size of scdc1:

[root@hobbes ~]# blockdev --getsz /dev/sdc1

7812441596

Here is the output of pvs -o pv_all /dev/sdc1


Fmt PV UUID DevSize PV PMdaFree PMdaSize 1st PE PSize PFree Used Attr PE 
Alloc PV Tags #PMda #PMdaUse lvm2 8D67bX-xg4s-QRy1-4E8n-XfiR-0C2r-Oi1Blf 
3.64T /dev/sdc1 92.50K 188.00K 192.00K 3.64T 0 3.64T a-- 953668 953668 1 1


Thanks for the support!

Ryan
On 4/7/14, 6:22 AM, Peter Rajnoha wrote:
> On 04/04/2014 11:32 PM, Ryan Davis wrote:
>> [root@hobbes ~]# mount  -t ext4 /dev/vg_data/lv_home /home
>>
>> mount: wrong fs type, bad option, bad superblock on /dev/vg_data/lv_home,
>>
>>         missing codepage or other error
>>
>>         (could this be the IDE device where you in fact use
>>
>>         ide-scsi so that sr0 or sda or so is needed?)
>>
>>         In some cases useful info is found in syslog - try
>>
>>         dmesg | tail  or so
>>
>>   
>>
>> [root@hobbes ~]# dmesg | tail
>>
>>   
>>
>> EXT4-fs (dm-0): unable to read superblock
>>
>>   
>>
> That's because an LV that is represented by a device-mapper
> mapping doesn't have a proper table loaded (as you already
> mentioned later). So such device is unusable until proper
> tables are loaded...
>
>> [root@hobbes ~]# mke2fs -n /dev/sdc1
>>
>> mke2fs 1.39 (29-May-2006)
>>
>> Filesystem label=
>>
>> OS type: Linux
>>
>> Block size=4096 (log=2)
>>
>> Fragment size=4096 (log=2)
>>
>> 488292352 inodes, 976555199 blocks
>>
>> 48827759 blocks (5.00%) reserved for the super user
>>
>> First data block=0
>>
>> Maximum filesystem blocks=4294967296
>>
>> 29803 block groups
>>
>> 32768 blocks per group, 32768 fragments per group
>>
>> 16384 inodes per group
>>
>> Superblock backups stored on blocks:
>>
>>          32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632,
>> 2654208,
>>
>>          4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
>>
>>          102400000, 214990848, 512000000, 550731776, 644972544
>>
> Oh! Don't use the PV directly (the /dev/sdc1), but always use the
> LV on top (/dev/vg_data/lv_home) otherwise you'll destroy the PV.
> (Here you used "-n" so it didn't do anything to the PV fortunately.)
>
>>   
>>
>> Is the superblock issue causing the lvm issues?
>>
>> Thanks for any input you might have.
>>
>>
> We need to see why the table load failed for the LV.
> That's the exact problem here.
>
>
>> LVM info:
>>
>> #vgs
>>
>>    VG      #PV #LV #SN Attr   VSize VFree
>>
>>    vg_data   1   1   0 wz--n- 3.64T    0
>>
>> #lvs
>>
>>    LV      VG      Attr   LSize Origin Snap%  Move Log Copy%  Convert
>>
>>    lv_home vg_data -wi-d- 3.64T
>>
>>   
>>
>> Looks like I have a mapped device present without tables (d) attribute.
>>
>>   
>>
>> #pvs
>>
>>    PV         VG      Fmt  Attr PSize PFree
>>
>>    /dev/sdc1  vg_data lvm2 a--  3.64T    0
>>
>>   
>>
>> #ls /dev/vg_data
>>
>> lv_home
>>
>>   
>>
>> #vgscan --mknodes
>>
>>   
>>
>>    Reading all physical volumes.  This may take a while...
>>
>>    Found volume group "vg_data" using metadata type lvm2
>>
>>   
>>
>> #pvscan
>>
>>    PV /dev/sdc1   VG vg_data   lvm2 [3.64 TB / 0    free]
>>
>>    Total: 1 [3.64 TB] / in use: 1 [3.64 TB] / in no VG: 0 [0   ]
>>
>>   
>>
>> #vgchange -ay
>>
>>    1 logical volume(s) in volume group "vg_data" now active
>>
>>    device-mapper: ioctl: error adding target to table
>>
>>   
>>
>> #dmesg |tail
>>
>> device-mapper: table: device 8:33 too small for target
>>
>> device-mapper: table: 253:0: linear: dm-linear: Device lookup failed
>>
>> device-mapper: ioctl: error adding target to table
>>
>>   
> The 8:33 is the /dev/sdc1 which is the PV used.
> What's the actual size of the /dev/sdc1?
> Try "blockdev --getsz /dev/sdc1" and see what the size is.
>

Received: from glen-mhor.englab.brq.redhat.com
	(glen-mhor.englab.brq.redhat.com [10.34.32.149])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8M8YKiG008910
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 04:34:20 -0400
Message-ID: <4AB88C0B.6020203@redhat.com>
Date: Tue, 22 Sep 2009 10:34:19 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] I've tried to get some support on this list about lvm
References: <200909152137.44474.whobedobe@dodo.com.au>	<20090915114939.GA2715@agk-dp.fab.redhat.com>
	<200909172059.49369.whobedobe@dodo.com.au>
In-Reply-To: <200909172059.49369.whobedobe@dodo.com.au>
Content-Transfer-Encoding: 7bit
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

Hugh wrote:
> On Tuesday 15 September 2009 21:49:39 Alasdair G Kergon wrote:
>   
>> On Tue, Sep 15, 2009 at 09:37:44PM +1000, Hugh wrote:
>>     
>>> Sep 10 20:55:46 fc11-64 kernel: device-mapper: table: device 8:18
>>> too small for target
>>>       
>> There's your answer: You're trying to make it bigger than the underlying
>> device.
>>
>> Use pvs -v to check device sizes for discrepancies.
>> (--units s if necessary).
>>
>> Alasdair
>>     
>
> Thanks, now I can see what the problem is:
>
> [root@fc11-64 ~]# pvs -v 
>     Scanning for physical volume names
>   PV         VG         Fmt  Attr PSize  PFree  DevSize PV UUID                               
>   /dev/sda2  vg_fc1164  lvm2 a-   99.80G     0   99.80G qunnek-OG2y-hp2j-31J8-
> J3HT-0Aye-3w2rMN
>   /dev/sdb2  VolGroup00 lvm2 a-   67.91G 20.00G  47.93G eCuGyH-jV7L-Tgdg-JyYW-
> sWK1-ehZY-OLw0WS
>
>
> How is this possible?
> What's the solution?
> How can I grow the DevSize?
> Probably a better question to ask is, how can I add the unused space into the 
> device and then the volume?
>
>   
Hi Hugh,
taking into account this:
> Maybe I should provide some more background.
> I have a vmware virtual disk and I have grown the disk size by 20G.
>   
and...
> [root@fc11-64 ~]# parted -l
> Model: VMware, VMware Virtual S (scsi)
> Disk /dev/sda: 107GB
> Sector size (logical/physical): 512B/512B
> Partition Table: msdos
>
> Number  Start   End    Size   Type     File system  Flags
>  1      32.3kB  210MB  210MB  primary  ext3         boot 
>  2      210MB   107GB  107GB  primary               lvm  
>
>
> Model: VMware, VMware Virtual S (scsi)
> Disk /dev/sdb: 73.0GB
> Sector size (logical/physical): 512B/512B
> Partition Table: msdos
>
>   
...this:
> Number  Start   End     Size    Type     File system  Flags
>  1      32.3kB  74.0MB  74.0MB  primary  ext3         boot 
>  2      74.0MB  51.5GB  51.5GB  primary               lvm  
>
>   
you have to resize sdb2 partition first.

Though I do not understand why it is possible to resize PV beyond end of 
device (doing that should display a warning message, but command will 
pass), this is definitely not a LVM bug.

HTH,

-- Marian
> Model: Linux device-mapper (dm)
> Disk /dev/mapper/VolGroup00-LogVol00: 49.3GB
> Sector size (logical/physical): 512B/512B
> Partition Table: loop
>
> Number  Start  End     Size    File system  Flags
>  1      0.00B  49.3GB  49.3GB  ext3              
>
>
> Model: Linux device-mapper (dm)
> Disk /dev/mapper/VolGroup00-LogVol01: 2114MB
> Sector size (logical/physical): 512B/512B
> Partition Table: loop
>
> Number  Start  End     Size    File system  Flags
>  1      0.00B  2114MB  2114MB  linux-swap        
>
>
> Model: Linux device-mapper (dm)
> Disk /dev/mapper/vg_fc1164-lv_swap: 4194MB
> Sector size (logical/physical): 512B/512B
> Partition Table: loop
>
> Number  Start  End     Size    File system  Flags
>  1      0.00B  4194MB  4194MB  linux-swap        
>
>
> Model: Linux device-mapper (dm)
> Disk /dev/mapper/vg_fc1164-lv_root: 103GB
> Sector size (logical/physical): 512B/512B
> Partition Table: loop
>
> Number  Start  End    Size   File system  Flags
>  1      0.00B  103GB  103GB  ext3              
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   

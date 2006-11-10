In-Reply-To: <1163174415.2961.95.camel@laguna.nwhq.nl>
References: <1163152099.2961.68.camel@laguna.nwhq.nl>
	<02ac015d0526931d1024f1549d98a49c@redhat.com>
	<1163174415.2961.95.camel@laguna.nwhq.nl>
Mime-Version: 1.0 (Apple Message framework v624)
Message-Id: <0a12967f06b1379791a2705e538e603d@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] LVM groups not visible
Date: Fri, 10 Nov 2006 13:03:38 -0600
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
To: jlblom@neuroweave.nl
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hmmm, did you ever add your usb device to a volume group using 
'vgextend'?  (If so, that probably wasn't a good idea. :)  Otherwise, I 
suppose you might have had the USB drive plugged in when you installed 
your system... leading it to believe it was an internal drive perhaps, 
thus including it in a volume group...

I'm not exactly sure what's going on here.  Perhaps you want to take a 
look at the contents of your lvm backup files, located in 
/etc/lvm/backup.  This way, you can see what the USB device is included 
with (if anything).

  brassow

On Nov 10, 2006, at 10:00 AM, J.L. Blom wrote:

> On Fri, 2006-11-10 at 09:27 -0600, Jonathan E Brassow wrote:
>> I can't imagine putting LVM on a USB drive...  Are you sure LVM is 
>> even
>> involved here?
>>
>> You can type 'mount' or 'df' at the command prompt.  That will tell 
>> you
>> how the usbdisk is mounted.  If it is mounted from /dev/sda1 - then
>> there is no LVM in the mix.
>>
>>   brassow
>
> Jonathan,
> Thanks for your reply.
> I didn't know that an USB disk couldn't be used for logical volumes as
> pvcreate and lvcreate did not complain.
> However, when I now do a lvscan it gives me:
> _______________________________________
> [root@laguna ~]# lvscan
>   Couldn't find device with uuid
> 'G6vIxd-bp54-0zd0-PKzf-WI31-xPmr-qoeFAT'.
>   Couldn't find all physical volumes for volume group VolGroup00.
>   Couldn't find device with uuid
> 'G6vIxd-bp54-0zd0-PKzf-WI31-xPmr-qoeFAT'.
>   Couldn't find all physical volumes for volume group VolGroup00.
>   Volume group "VolGroup00" not found
>   ACTIVE            '/dev/VolGroup01/LogVol00' [9.75 GB] inherit
>   ACTIVE            '/dev/VolGroup01/LogVol02' [9.75 GB] inherit
>   ACTIVE            '/dev/VolGroup01/LogVol03' [4.88 GB] inherit
>   ACTIVE            '/dev/VolGroup01/LogVol04' [9.75 GB] inherit
>   ACTIVE            '/dev/VolGroup01/LogVol05' [9.75 GB] inherit
>   ACTIVE            '/dev/VolGroup01/LogVol01' [9.75 GB] inherit
> _________________________________________________________________
> As VolGroup00 is on the USB disk which I just had connected.
>
> df gives:
> _____________________________________
> /dev/mapper/VolGroup01-LogVol00
>                        9903432   1035860   8356392  12% /
> /dev/hda1                99043     25640     68289  28% /boot
> tmpfs                   512492         0    512492   0% /dev/shm
> /dev/mapper/VolGroup01-LogVol02
>                        9903432   1789628   7602624  20% /home
> /dev/mapper/VolGroup01-LogVol03
>                        4951688   4137648    558452  89% /usr
> /dev/mapper/VolGroup01-LogVol04
>                        9903432    342224   9050028   4% /usr/local
> /dev/mapper/VolGroup01-LogVol05
>                        9903432    761312   8630940   9% /var
>
> /dev/sda1            240362656  38037368 190115488  17% /media/disk
> ___________________________________________________
>
> and fdisk says:
> _____________________________________________________
> The number of cylinders for this disk is set to 30400.
> There is nothing wrong with that, but this is larger than 1024,
> and could in certain setups cause problems with:
> 1) software that runs at boot time (e.g., old versions of LILO)
> 2) booting and partitioning software from other OSs
>    (e.g., DOS FDISK, OS/2 FDISK)
> Warning: invalid flag 0x0000 of partition table 4 will be corrected by
> w(rite)
>
> Command (m for help): p
>
> Disk /dev/sda1: 250.0 GB, 250056705024 bytes
> 255 heads, 63 sectors/track, 30400 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
>
>      Device Boot      Start         End      Blocks   Id  System
>
> Command (m for help): q
> ______________________________________
> So I'm at a loss how this is possible. The disk can be reached but
> neither lvm nor fdisk can tell me what's on the disk,
> Can you perhaps shine some light on it?
> (sorry for the long mail).
> Joep
>
>
>

Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAAKZNft020297
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 15:35:23 -0500
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAAKZ7Ee031407
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 15:35:07 -0500
Received: by gwb11 with SMTP id 11so239161gwb.33
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 12:35:07 -0800 (PST)
Message-ID: <4CDB01F8.6090202@gmail.com>
Date: Wed, 10 Nov 2010 15:35:04 -0500
From: Mauricio Tavares <raubvogel@gmail.com>
MIME-Version: 1.0
References: <4CDAAE84.5060806@gmail.com>
	<Pine.LNX.4.64.1011101235510.1807@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1011101235510.1807@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Bad disk?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 11/10/2010 12:41 PM, Stuart D. Gathman wrote:
> On Wed, 10 Nov 2010, Mauricio Tavares wrote:
>
>> Those dm-0 messages do not make me happy. dmesg and vgchange make me think the
>> problem is on the new drive:
>
> Those dm-0 messages are probably a logical error.  For instance, a snapshot
> that is full would give those errors.  You need to tell us what dm-0 is
> mapped to.  Look in /dev/mapper for starters.
>
	Sorry for that: I did not think it would be there. But, as you said, it is:

lrwxrwxrwx 1 root root      7 2010-11-10 09:30 export-vms -> ../dm-0

the export vg is in /dev/sdc1.

>> [  268.024593] scsi 0:0:0:0: Direct-Access     ATA      ST3500320NS  SN04 PQ:
>> 0 ANSI: 5
>> [  268.024900] sd 0:0:0:0: [sdc] 976773168 512-byte logical blocks: (500
>> GB/465 GiB)
>> [  268.024918] sd 0:0:0:0: Attached scsi generic sg2 type 0
>> [  268.024996] sd 0:0:0:0: [sdc] Write Protect is off
>> [  268.025003] sd 0:0:0:0: [sdc] Mode Sense: 00 3a 00 00
>> [  268.025046] sd 0:0:0:0: [sdc] Write cache: enabled, read cache: enabled,
>> doesn't support DPO or FUA
>> [  268.025377]  sdc: sdc1
>> [  268.049853] sd 0:0:0:0: [sdc] Attached SCSI disk
>
> This is normal for your new disk.
>
>> [  335.467482] quiet_error: 3 callbacks suppressed
>> [  335.467492] Buffer I/O error on device dm-0, logical block 104857584
>> [  335.467540] Buffer I/O error on device dm-0, logical block 104857584
>> [  335.467589] Buffer I/O error on device dm-0, logical block 104857598
>> [  335.467615] Buffer I/O error on device dm-0, logical block 104857598
>> [  335.467647] Buffer I/O error on device dm-0, logical block 0
>> [  335.467671] Buffer I/O error on device dm-0, logical block 0
>> [  335.467703] Buffer I/O error on device dm-0, logical block 1
>> [  335.467734] Buffer I/O error on device dm-0, logical block 104857599
>> [  335.467762] Buffer I/O error on device dm-0, logical block 104857599
>> [  335.467788] Buffer I/O error on device dm-0, logical block 104857599
>
> Again, this is on dm-0, not sdc.
>
>> raub@strangepork:~$ sudo sfdisk -l /dev/sdc
>>
>> Disk /dev/sdc: 60801 cylinders, 255 heads, 63 sectors/track
>> Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting from 0
>>
>>     Device Boot Start     End   #cyls    #blocks   Id  System
>> /dev/sdc1          0+  60800   60801- 488384001   8e  Linux LVM
>> /dev/sdc2          0       -       0          0    0  Empty
>> /dev/sdc3          0       -       0          0    0  Empty
>> /dev/sdc4          0       -       0          0    0  Empty
>
> This is normal, not sure what is has to do with filesystem desciptors.
>
> Tell us exactly what you mean by "put a LVM on it".  Did you run
> pvcreate?  vgcreate?  lvcreate? You might find the output of "pvs"
> enlightening.  That will tell us what PVs you have created.
> And list /dev/mapper so we know what dm-0 is, and include the output of "lvs".
>
	Let me put this way, I thought I did. I mean, after creating the 
partition, setting it to LVM (8e), then running

pvcreate /dev/sdc1
vgcreate export /dev/sdc1
lvcreate -L 400G --name vms export

I used mkfs.ext4 to create partition (on /dev/mapper/export-vms) and off 
I went. Do you think I missed a step?

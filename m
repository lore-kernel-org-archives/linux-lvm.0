References: <29712c7c-0d4d-2ad3-8eec-380b38ff3589@gmail.com>
	<33276b38-bdde-a3fa-2324-755fb165b075@redhat.com>
From: Danniello <danniello@gmail.com>
Message-ID: <319747ab-1cc1-2bc1-1050-148c1be414a8@gmail.com>
Date: Mon, 12 Jun 2017 17:16:51 +0200
MIME-Version: 1.0
In-Reply-To: <33276b38-bdde-a3fa-2324-755fb165b075@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Subject: Re: [linux-lvm] Problem with mount QNAP disks in Linux
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
To: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

W dniu 12.06.2017 o 15:42, Marian Csontos pisze:
>> $ sudo vgs
>>    VG     #PV #LV #SN Attr   VSize   VFree
>>    vg1      1   4   0 wz--n-   5,44t    0
>
> VFree 0 - that's bad...
>
>>
>> I tried to activate it with lvchange but there is message that manual 
>> repair of vg1/tp1 is required:
>> $ sudo lvchange -ay vg1/lv2
>>    Check of pool vg1/tp1 failed (status:1). Manual repair required!
>>
>> I tried command lvconvert --repair vg1/tp1 with no success:
>> $ sudo lvconvert --repair vg1/tp1
>>    Using default stripesize 64,00 KiB.
>>    Volume group "vg1" has insufficient free space (0 extents): 4096 
>> required.
>
> Repair needs some space to write new metadata, and the message says it 
> all: there is no free space in the volume group.
>
> Add more space to the volume group: vgextend vg1 DEVICE. You will 
> either need to add a disk, or carve out some space out of other MD 
> devices.
>
> Or free some space in the VG: you can not shrink thin pool, so the 
> only other option is, if the data on vg1/lv544 are not interesting or 
> can be moved elsewhere, you could remove that and let repair use that 
> space.
>
> Also I noticed the size of logical volume lv1 alone is 5,42t (and with 
> lv2 it is approximately 5,9t) while thin pool's is only 5,40t: that is 
> not a good setup - it will eventually overfill (maybe it already did) 
> and you will not be able to resize the pool any further to accommodate 
> all data - with older kernels this was a serious problem and could 
> lead to a file system corruption.
>
> If that's what the NAS created for you, it should be reported to the 
> manufacturer as well.
>
> Once you can mount the volumes, I strongly recommend shrinking lv1. 

This setup was done by me on QNAP QTS - at beginning I had only 
DataVol1, but after some time I added "small" DataVol2. It is not good 
configuration, but in QTS system there was no option to shrink DataVol1.
Anyway it was working OK in QNAP QTS system (but with warnings that pool 
is almost full). Unfortunately my QNAP is no longer working - 
motherboard defected...

I have backup of all important data on other places, but wanted to try 
restore also "not important data":)

In QNAP QTS system it should work without additional actions - only 
after unlock encrypted DataVol1 and DataVol2 there should be message 
about check filesystem. I do not have access to other working QNAP, so I 
tried with my desktop system with Fedora, but activate lv1 and lv2 was 
not working on default configuration.

Probably you are right - I should add storage and then try to repair it. 
But I found "workaround" by modifying /etc/lvm/lvm.conf in global section:
thin_check_executable = ""

I know that disable thin_check is generally not recommended, but I 
wanted try everything before do more drastic methods. After this change 
I could activate volumes lv1 and lv2:
lvchange -ay /dev/vg1

Decrypt:
cryptsetup luksOpen /dev/vg1/lv1 crypt_lv1
cryptsetup luksOpen /dev/vg1/lv2 crypt_lv2

And mount:
mount -r /dev/mapper/crypt_lv1 /mnt/lv1
mount -r /dev/mapper/crypt_lv2 /mnt/lv2
Data accessible:)

I want only copy some data from it, so repair will not be necessary. 
Next I plan build my own NAS, so I will reformat disks from scratch.

Thank you!
Daniel

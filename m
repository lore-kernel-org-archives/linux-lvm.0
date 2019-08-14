References: <843935217a8de82c4cf47f02953489c6@cs.uni-dortmund.de>
	<7f6f03e1-dbb1-971c-7f1f-f6c380a16b77@redhat.com>
	<0f1ce51503d454e2068d9e0f65947273@cs.uni-dortmund.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <110d7a9c-c075-65bc-cedd-eca0c9904d23@redhat.com>
Date: Wed, 14 Aug 2019 13:07:45 +0200
MIME-Version: 1.0
In-Reply-To: <0f1ce51503d454e2068d9e0f65947273@cs.uni-dortmund.de>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] dmsetup says "Device does not exist",
	though it exists
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>

Dne 14. 08. 19 v 9:22 Christoph Pleger napsal(a):
> Hello,
> 
>>> I have a volume group with 20 logical volumes. Only the last one of these 
>>> volumes has a strange problem with dmsetup, shown by these commands and 
>>> output on the command line:
>>>
>>> root@host:/home/linux# /sbin/dmsetup info -c -o name --noheadings /dev/vg/lv20
>>> Device does not exist.
>>> Command failed
>>>
>>> root@host:/home/linux# lvdisplay -c /dev/vg/lv20
>>>    /dev/vg/lv20:vg:3:1:-1:0:4194304:512:-1:0:-1:253:19
>>>
>>> root@host:/home/linux# mount /dev/vg/lv20 /mnt
>>> root@host:/home/linux# ls /mnt
>>> lost+found data1 data2
>>>
>>> That is, dmsetup says "Device does not exist" about a logical volume, 
>>> though the volume exists and is operating normally. What is the possible 
>>> problem here?
>>>
> 
>>
>> Have you tried  strace ?
> 
> I attached the relevant lines of the strace output. I am really wondering what 
> is happening there:
> 
> 1. A stat() on /dev/mapper/lv20 is performed, though I requested 
> /dev/mapper/vg-lv20
> 2. A stat() on/dev/mapper/vg-lv15-real is performed. What does this have to do 
> with lv20 (after I wrote what is at number 3, I know)
> 3. I do not even know where /dev/mapper/vg-lv15-real is coming from. I created 
> a logical volume named lv15, but none named lv15-real. And really, 'ls -l 
> /dev/vg/' does not list lv15-real, but 'ls -l /dev/mapper' lists vg-lv15-real 
> and shows that is has the same link target /dev/dm-18 as lv20.
> 4. Though stat() found /dev/mapper/vg-lv15-real, ioctl() says that this device 
> does not exist.
> 
> 
>> Kernel version, lvm version,  distribution... ?
> 
> Kernel Debian amd64 4.9.168-1+deb9u2, LVM version 2.03.02(2), Debian 9 (stretch)

Hi

So are you actually trying to access not a 'normal' LV - but an LV under 
snapshot ?

Debian is using it's own modified udev-rules - so I can't really tell without
exactly looking what sort of rules are running there.

You can try to provide   'lvchange -ayvvvv' debug trace when you activate such 
LV and you can enable verification of udev rule processing with lvm.conf option:

         verify_udev_operations = 1

That should 'create'  missing links if they were not created by udev.

NOTE: this is a cruel hack - nothing I'd advice to use normally - since udev 
rules should handle this case normally - but it can give us some hints,
where the issue could be buried-in.

So try above steps and check if the  LV links are in  /dev/vgname dir.

Regards

Zdenek

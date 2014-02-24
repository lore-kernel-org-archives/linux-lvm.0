Message-ID: <530B059F.3060502@redhat.com>
Date: Mon, 24 Feb 2014 09:41:03 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <530A77EC.5090900@mglug.de>
In-Reply-To: <530A77EC.5090900@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] unwanted autocreation of /dev/mapper/ entries while
 using parted on lvm devices
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: rath@mglug.de

On 02/23/2014 11:36 PM, Oliver Rath wrote:
> Hi List,
> 
> Im not sure, if the udev-rules of lvm is creating this. Im Using Ubuntu
> 12.04.4 + lvm git yesterday, compiles with --enable-udev_sync
> --enable-udev_rules. Here my testing results:
> 
> 
> root@dmicrash\:rules.d# vgcreate myvg /dev/sdc1 /dev/sdd1
>   Volume group "myvg" successfully created
> root@dmicrash\:rules.d# lvcreate --name test --size 20G myvg
>   Logical volume "test" created
> root@dmicrash\:rules.d# parted /dev/myvg/test mklabel msdos
> 
> root@dmicrash\:rules.d# parted /dev/myvg/test mkpart primary  0% 40%
>      
> root@dmicrash\:rules.d# ls /dev/mapper/
> control  myvg-test  myvg-test1
> 
> The device myvg-test1 was created automatically (normally this is done
> by kpartx?). I disabled gnome-automounter, didnt help.
> 
> I tried to monitor this with udevadm --monitor, but i didnt get
> displayed the rule-file who did this.
> 
> Any hints?

The parted itself creates a new device-mapper mapping that represents
the partition. Then it's like any other device-mapper device and so
the /dev content is created by 10-dm-disk.rules (the /dev/mapper
content) and 13-dm-disk.rules (the /dev/disk content).

Parted has this functionality integrated so there's no need to call
kpartx in addition.

-- 
Peter

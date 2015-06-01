Message-ID: <556C1A92.3040504@redhat.com>
Date: Mon, 01 Jun 2015 10:40:50 +0200
From: Ondrej Kozina <okozina@redhat.com>
MIME-Version: 1.0
References: <20150530054508.Horde.UHD8nrE6gSp5bNvnIOGDQA5@webmail.df.eu>
In-Reply-To: <20150530054508.Horde.UHD8nrE6gSp5bNvnIOGDQA5@webmail.df.eu>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM problem: Unable to mount encrypted Luks HDs
 after reinstalling Ubuntu; Error: unknown filesystem type 'LVM2_member'
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
Cc: st@ateneto.com


Hi Sebastian,

I'm not familiar with Ubuntu so the only thing I can help you with is 
trying to explain what went (probably) wrong.

>
> This is the situation in the terminal:
> sog@sog-workstation:~$ sudo cryptsetup luksOpen /dev/sdb5 encrypted
> Enter passphrase for /dev/sdb5:
> sog@sog-workstation:~$ sudo mkdir /media/encrypted
> sog@sog-workstation:~$ sudo mount /dev/mapper/encrypted /media/encrypted
> mount: unknown filesystem type 'LVM2_member'

This seems like you're about to mount lvm2 PV (VG member) instead of LV 
with actual filesystem residing in.

You should always try to mount LVM2 LV like follows:
mount /dev/<your_vg_name>/<your_lv_name> /mnt/point

Could you paste here 'lsblk' output here so we have better picture about 
your device stack?

> sog@sog-workstation:~$ sudo vgscan --mknodes
>     Reading all physical volumes. This may take a while...
>     Found volume group "it-vg" using metadata type lvm2
>     Found volume group "it-vg" using metadata type lvm2
> sog@sog-workstation:~$ sudo vgchange -ay
>     device-mapper: create ioctl on it--vg-root failed: Device or resource busy
>     device-mapper: create ioctl on it--vg-swap_1 failed: Device or resource busy
>     0 logical volume(s) in volume group "it-vg" now active
>     2 logical volume(s) in volume group "it-vg" now active

Seems like an activation issue. We can't help you more without -vvvv 
debug ouput. (vgchane -ay -vvvv). Also 'dmsetup table' and 'dmsetup 
info' commands output would help after failure in any activation command.

Regards
Ondrej

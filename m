Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6IHcNuo015404
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2007 13:38:23 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.177])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6IHcJHs025346
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2007 13:38:20 -0400
Received: by py-out-1112.google.com with SMTP id p76so533678pyb
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2007 10:38:19 -0700 (PDT)
Message-ID: <42f5c4430707181038y689c36dbvb4a75dd6d5539478@mail.gmail.com>
Date: Wed, 18 Jul 2007 11:38:18 -0600
From: "Thierry Thelliez" <thierry.thelliez.tech@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Live Cloning of Root LVM (or Dynamic LVM?)
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
To: linux-lvm@redhat.com

Hello,

I wanted to perform a live clone of a remote server main drive . The
constraint would be to do that while the system is still running
(without booting from a LiveCD). In case of crash or damage to the OS
or applications settings, the idea would be to be back with minimal
intervention: just remove the bad drive and boot from the clone.

I thought it could be easy but I am encountering some problems with
LVM configuration duplication.

Below are the steps I followed:
1- Main OS
The OS is installed on the main drive:
/hda1 = /boot ext3
/hda2 = LVM
The LVM is itself split in three:
VolGroup00/LogVol00 = /  ext3
VolGroup00/LogVol01 = swap
VolGroup00/LogVol02 = /data

2- Clone preparation
I added a second drive for the cloning. Manually configured the
partitions and LVM to look like the main drive.
/hdb1 = /boot ext3  (fdisk then mkfs.ext3 and e2label)
/hdb2 = LVM (fdisk then LVM created with Fedora core 6 LVM GUI)
The LVM is itself split in three:
VolGroup01/LogVol00 = /  ext3
VolGroup01/LogVol01 = swap (+mkswap /dev/VolGroup01/LogVol01)
VolGroup01/LogVol02 = /data

(In my current configuration the two drives are not the same
brand/size. Also I am not trying to clone the /data volume. So
everything is the same size but the */LogVol02 volumes).

3- Copy
I created a snapshot of VolGroup00/LogVol00 and dd it to VolGroup01/LogVol00
Of course the above is taking VolGroup00 references to the VolGroup01
The /boot was copied with cp -av

4- Modification of LVM references.
I booted from a knoppic CD to mount hdb and modify few LVM references
(changed VolGroup00 to VolGroup01).
/boot/grub/grub.conf
/etc/fstab
/boot/initrd-xyz.fc6.img (with gzip, cpio,..)

5- MBR
Still under knoppic CD, I also created an MBR (mounted proc and dev,
then chroot to the clone drive, then grub root and setup).

Now if I boot from the clone, the MBR seems to work. Grub starts. But
just after the 'Uncompressing kernel' message, I get an error about
allocating Ram0 (grow_buffer: requested out of range block ... for
device Ram0). I am guessing the a reference of the VolGroup00 is left
somewhere. Or maybe a swap definition issue?

Any suggestions on what to clean on the clone to make it working?
Somehow I was hoping that the LVM information would be dynamically
read. But there must be some hidden references left.

Thanks
Thierry

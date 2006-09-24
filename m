Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8O237Sd019080
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 22:03:07 -0400
Received: from mail1.lowvoice.nl (mail.lowvoice.nl [81.171.111.151])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8O230lU005063
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 22:03:00 -0400
Message-ID: <4515E788.5050809@lowvoice.nl>
Date: Sun, 24 Sep 2006 04:03:52 +0200
From: Marius Karthaus <linux-lvm@lowvoice.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LV remains open after setup
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

Hi,

I have a problem with LVs remaining open after I unmount them.

vm_foo_hda1            vg-sda -wi-ao   4.00G

but:

/home/# cat /proc/mounts
rootfs / rootfs rw 0 0
/dev2/root2 / ext3 rw,data=ordered 0 0
proc /proc proc rw 0 0
sysfs /sys sysfs rw 0 0
usbfs /proc/bus/usb usbfs rw 0 0
/dev2/root2 /dev/.static/dev ext3 rw,data=ordered 0 0
tmpfs /dev tmpfs rw 0 0
tmpfs /dev/shm tmpfs rw 0 0
devpts /dev/pts devpts rw 0 0

The creation of the LV is done from a script which creates the LV, 
formats it as ext3, mounts it fills it with data, unmounts it. The 
script than fails because we want to extend or reduce the LV if 
necessary and that cannot be done on an 'open' lv.
The thing we do now is rename the LV and try again with an other pass of 
the script. The 'old' one that remained open is removed after a next 
reboot, which as of yet seems the only option to get it closed again.
I have no place to start debugging, nog logs no debug info, nothing that 
is of any informational value.
Can anyone please help me figure out what is going on? How am I going to 
find out what is keeping the LV open, or why LVM is wrongly thinking it 
is...

Thanks in advance,
Marius Karthaus
LowVoice

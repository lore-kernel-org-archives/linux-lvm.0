Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n19KZoeD013975
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 15:35:50 -0500
Received: from mail-bw0-f160.google.com (mail-bw0-f160.google.com
	[209.85.218.160])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n19KYUlC005939
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 15:35:34 -0500
Received: by mail-bw0-f160.google.com with SMTP id 4so1893529bwz.3
	for <linux-lvm@redhat.com>; Mon, 09 Feb 2009 12:35:34 -0800 (PST)
MIME-Version: 1.0
Sender: pgnet.trash@gmail.com
Date: Mon, 9 Feb 2009 12:35:34 -0800
Message-ID: <dbd51810902091235l3669eb73w9f9266b87f323d48@mail.gmail.com>
From: PGNet <pgnet.trash+lvm@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm 'filter = [...]' by VG or LV name?
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

i've a RAID device, with a VolumeGroup & a LovicalVolume,

       /dev/md3 -> VG('VG01'):LV('test'):'/home/test'

i've added a new LV to VGO1's available space,

       lvcreate -n new_DomU -L 4G /dev/VG01
       dd if=.../template of=/dev/VG01/new_DomU

i need to *exclude* '/dev/VG01/new_DomU' from lvm scanning, but make
sure the 'home/test/ mount is still scanned.

in lvm.conf, if i set,

       filter =[ "a|/dev/md[3]|", "r|.*|" ]

it correctly excludes the entire block-dev, and it's VG/LV contents.
but, @ attempt to, e.g.,

       dd if=.../template of=/dev/VG01/new_DomU

then returns,

       Volume group "VG01" not found

iiuc, the 'filter=' specification filters on block-devices only, not
VG/LV names (at least i've not figured out a regex that works, yet).

is there any way to exclude just certain LVM's in/on a block device,
leaving the rest scannable?

thanks.

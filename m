Message-ID: <34BE27FD7F4BD111B9C600805F15B7DC016E7D99@info-akh.linz.at>
From: Michelic Adalbert <adalbert.michelic@akh.linz.at>
Subject: [linux-lvm] Cannot access VG due to "hd error"
Date: Wed, 2 Aug 2000 11:30:40 +0200 
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

Hello,

I have the following problem:

I had the following disks in my machine:
  hda: several partionions; hda6 is a PV
  hdc: hdc is a PV
  hde: temporary disk; hde1 was ReiserFS

On my hdc-disk I had a ext2-filesystem and i wanted to move this
to a ReiserFS on a LVM-volume, so i put in the hde-disk; copied
everything to hde, then i did the following:
  pvcreate /dev/hdc
  vgextend vg01 /dev/hdc
a cat /proc/lvm told me, that there are 1007 LE on /dev/hdc
  lvcreate -l 1007 -n mp3z vg01 /dev/hdc
(I wanted the mp3z-volume to completly reside on the hdc-disk, so
i could turn it off, since it is very rarely used).

everything okay; then i created the filesystem on /dev/vg01/mp3z
and copied all files from /dev/hde1 to /dev/vg01/mp3z, changed
the mountpoint in /etc/fstab and mounted it. /dev/hde was now
not in use anymore.

Now i have shutdown my machine, removed /dev/hde and rebooted.

Now vgscan gave me errors like the following:
hdc: read_intr: status=0x59 { DriveReady SeekComplete DataRequest \
  Error }    <-- one line
hdc: read_intr: error=0x04 { DriveStatusError }

I thought the disk is defect and have re-inserted /dev/hde and
moved the whole /dev/hdc to /dev/hde (dd id=/dev/hdc of=/dev/hde
bs=1k), then I inserted the new hde-disk as secondary master (hdc).

Copying was okay; the new hde disk is (tested!) 100% okay; it is not
physically defect.

After rebooting I got still the same errors, so I thought the
controller might be defect and tried inserting it is /dev/hde.

But the errors are still the same - with the disk inserted as
/dev/hde I get the following output from vgscan:

<vgscan>
  hde: read_intr: status=0x59 { DriveReady SeekComplete DataRequest \
     Error }
  hde: read_intr: error=0x04 { DriveStatusError }
  hde: read_intr: status=0x59 { DriveReady SeekComplete DataRequest \
     Error }
  hde: read_intr: error=0x04 { DriveStatusError }
  hde: read_intr: status=0x59 { DriveReady SeekComplete DataRequest \
     Error }
  hde: read_intr: error=0x04 { DriveStatusError }
  ide2: reset success
  hde: read_intr: status=0x59 { DriveReady SeekComplete DataRequest \
     Error }
  hde: read_intr: error=0x04 { DriveStatusError }
  hde: read_intr: status=0x59 { DriveReady SeekComplete DataRequest \
     Error }
  hde: read_intr: error=0x04 { DriveStatusError }
  hde: read_intr: status=0x59 { DriveReady SeekComplete DataRequest \
     Error }
  hde: read_intr: error=0x04 { DriveStatusError }
  hde: read_intr: status=0x59 { DriveReady SeekComplete DataRequest \
     Error }
  hde: read_intr: error=0x04 { DriveStatusError }
  ide2: reset success
  hde: read_intr: status=0x59 { DriveReady SeekComplete DataRequest \
     Error }
  hde: read_intr: error=0x04 { DriveStatusError }
  end_request: I/O error, dev 21:01 (hde), sector 0
  vgscan -- found inactive voulme group "vg01"
  vgscan -- error -154: can't get data of volume group "vg01" from \
     physical volume(s)
  vgscan -- error -154: creating /etc/lvmtab and /etc/lvmtab.d
</>

I'm using lvm version 0.8e with Kernel 2.2.14 (this is the Kernel that
is shipped with SuSE 6.4).

This messages sound like a hardware problem, but I think this is a
problem with the LVM, because the occur always - I have tried to use
another disk (which is completely new), I have to user another IDE-
cable (a new U-DMA/66 cable), i tried another controller.

Has anyone an idea, what this could be?


Please excuse my bad english,

Rgds, Adalbert

Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBMKJauo007800
	for <linux-lvm@redhat.com>; Tue, 22 Dec 2009 15:19:36 -0500
Received: from mail-bw0-f214.google.com (mail-bw0-f214.google.com
	[209.85.218.214])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBMKJJ72010167
	for <linux-lvm@redhat.com>; Tue, 22 Dec 2009 15:19:20 -0500
Received: by bwz6 with SMTP id 6so4573694bwz.11
	for <linux-lvm@redhat.com>; Tue, 22 Dec 2009 12:19:19 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 22 Dec 2009 22:19:19 +0200
Message-ID: <4cd59bf50912221219j6cd0588dp6a207b332f25b41@mail.gmail.com>
From: Gabriel <jarod125@gmail.com>
Subject: [linux-lvm] fsadm unable to resize LV if newsize is not specified
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I tried using fsadm to resize a fs that resides on a LV, but I get the
following error:

root@ubuntu:~# fsadm -n -v -l resize /dev/myvg/root
shift: 397: can't shift that many

I used both 2.02.56 and 2.02.57(1) (from CVS).

If I specify newsize, I don't get the error.

However, when I specify newsize, it still does not behave as I would
expect: although I used the -n option, the LV was actually extended:

root@ubuntu:~# fsadm -n -v -l resize /dev/myvg/root 799G
fsadm: "ext3" filesystem found on "/dev/mapper/myvg-root"
fsadm: Device "/dev/mapper/myvg-root" size is 785979015168 bytes
fsadm: Parsing tune2fs -l "/dev/mapper/myvg-root"
    Finding volume group myvg
    Executing: fsadm --verbose check /dev/myvg/root
fsadm: "ext3" filesystem found on "/dev/mapper/myvg-root"
fsadm: Executing fsck /dev/mapper/myvg-root
fsck from util-linux-ng 2.16
e2fsck 1.41.9 (22-Aug-2009)
root: clean, 1048711/47972352 files, 181942908/191889408 blocks
    Archiving volume group "myvg" metadata (seqno 32).
  Extending logical volume root to 799,00 GiB
    Found volume group "myvg"
    Found volume group "myvg"
    Loading myvg-root table (252:1)
    Suspending myvg-root (252:1) with device flush
    Found volume group "myvg"
    Resuming myvg-root (252:1)
    Creating volume group backup "/etc/lvm/backup/myvg" (seqno 33).
  Logical volume root successfully resized
    Executing: fsadm --verbose resize /dev/myvg/root 837812224K
fsadm: "ext3" filesystem found on "/dev/mapper/myvg-root"
fsadm: Device "/dev/mapper/myvg-root" size is 857919717376 bytes
fsadm: Parsing tune2fs -l "/dev/mapper/myvg-root"
fsadm: Resizing filesystem on device "/dev/mapper/myvg-root" to
857919717376 bytes (191889408 -> 209453056 blocks of 4096 bytes)
fsadm: Executing resize2fs /dev/mapper/myvg-root 209453056
resize2fs 1.41.9 (22-Aug-2009)
Please run 'e2fsck -f /dev/mapper/myvg-root' first.

fsadm: Resize ext3 failed
  fsadm failed: 1

The filesystem was not resized, but it probably would have been, if
the error above would not show up.

A minor nuisance is the fact that you must use an integer for the
newsize value. Specifying a floating point number returns this:

root@ubuntu:~# fsadm -n -v -l resize /dev/myvg/root 799.3G
fsadm: "ext3" filesystem found on "/dev/mapper/myvg-root"
fsadm: Device "/dev/mapper/myvg-root" size is 857919717376 bytes
fsadm: Parsing tune2fs -l "/dev/mapper/myvg-root"
/sbin/fsadm: 406: arithmetic expression: expecting EOF: " 799.3 * 1073741824 "

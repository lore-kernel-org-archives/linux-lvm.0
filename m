Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r989jFBw012517
	for <linux-lvm@redhat.com>; Tue, 8 Oct 2013 05:45:15 -0400
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r989jDUt008891
	for <linux-lvm@redhat.com>; Tue, 8 Oct 2013 05:45:14 -0400
Received: by mail-bk0-f48.google.com with SMTP id my13so3055638bkb.21
	for <linux-lvm@redhat.com>; Tue, 08 Oct 2013 02:45:13 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 8 Oct 2013 17:45:13 +0800
Message-ID: <CAHuLeSnsBk5PNGpKfa__16Z0VCj7vDuYNLf0Htndgf8ouC6rJw@mail.gmail.com>
From: Justin Lee <justinlee5455@gmail.com>
Subject: [linux-lvm] Vague "mirror_image_fault_policy" behavior specified in
	lvm.conf
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

Hello List,

When I set

    mirror_image_fault_policy = "allocate"

in file lvm.conf, the comments in that file tell me:

    # "allocate" - Remove the faulty device and try to allocate space on
    #            a new device to be a replacement for the failed device.
    #            Using this policy for the log is fast and maintains the
    #            ability to remember sync state through crashes/reboots.
    #            Using this policy for a mirror device is slow, as it
    #            requires the mirror to resynchronize the devices, but it
    #            will preserve the mirror characteristic of the device.
    #            This policy acts like "remove" if no suitable device and
    #            space can be allocated for the replacement.

As far as I know with my experiments, when mirror sync is in progress
and an IO error occurs during the sync on one of the mirror image
devices, the sync state of the mirror will be preserved (in the mirror
log) for a period of time before LVM actually allocates space to
restart mirror sync somewhere else on a new device. So if run

    lvs --all

right after the IO error occurs, the Copy% indicating the sync
progress will stay in a constant for a while (2 or 3 minutes or so in
my experience), and after that, LVM begins to allocates space
somewhere else and discards the old sync state so the Copy% is reset
and counts up from 0% on a new device.

On the other hand, if the IO error condition on the mirror image
device (e.g. imaging a remote SAN volume or iSCSI target) can be
eliminated before the sync state is discarded, the sync can be resumed
and a resync from 0% can be avoided!

So I wonder is there a timeout value that LVM respects and use the
timeout value to decide how long the old sync state is preserved? If
such a timeout exists, how can I change it? (say if I want to preserve
the sync state for 3 or 4 hours before it discards the state)

Please correct me if I am wrong and any help/idea/discussion is appreciated!

Justin

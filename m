Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAQLHgBd011787
	for <linux-lvm@redhat.com>; Wed, 26 Nov 2008 16:17:42 -0500
Received: from mail.esperi.org.uk (41-052.adsl.zetnet.co.uk [194.247.41.52])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAQLHUvI028066
	for <linux-lvm@redhat.com>; Wed, 26 Nov 2008 16:17:31 -0500
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	mAQLHStq029794
	for <linux-lvm@redhat.com>; Wed, 26 Nov 2008 21:17:28 GMT
From: Nix <nix@esperi.org.uk>
Date: Wed, 26 Nov 2008 21:17:27 +0000
Message-ID: <87iqqajifs.fsf@hades.wkstn.nix>
MIME-Version: 1.0
Subject: [linux-lvm] pvmove of mounted volume fails
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

(This is with LVM 2.02.42, device-mapper 1.02.28, kernel 2.6.27.5.)

I'd just pvmoved an unmounted volume without incident. So, I thought,
let's pvmove a mounted one. I know it used to work but now...

hades:/home# pvmove -v --name polipo /dev/hda5 /dev/hdc
    Finding volume group "global"
    Archiving volume group "global" metadata (seqno 28).
    Creating logical volume pvmove0
    Moving 32 extents of logical volume global/polipo
    Found volume group "global"
    Updating volume group metadata
    Creating volume group backup "/etc/lvm/backup/global" (seqno 29).
    Found volume group "global"
    Found volume group "global"
    Suspending global-polipo (253:4) with device flush
    Found volume group "global"
    Found volume group "global"
    Creating global-pvmove0
  device-mapper: create ioctl failed: Device or resource busy
    Loading global-polipo table
  device-mapper: reload ioctl failed: Invalid argument
    Checking progress every 15 seconds
  WARNING: dev_open(/dev/hda5) called while suspended
  WARNING: dev_open(/dev/hdc) called while suspended
  WARNING: dev_open(/dev/hda5) called while suspended
  WARNING: dev_open(/dev/hdc) called while suspended
  WARNING: dev_open(/dev/hda5) called while suspended
  WARNING: dev_open(/dev/hdc) called while suspended
  Number of segments in active LV pvmove0 does not match metadata
  ABORTING: Mirror percentage check failed.


I tried 'pvs', but it hung until I did

# dmsetup resume /dev/mapper/global-polipo

whereupon that came back to life. But now, even if I pvmove it after
unmounting, I see:

hades:/home# pvmove -v --name polipo /dev/hda5 /dev/hdc
    Finding volume group "global"
  Detected pvmove in progress for /dev/hda5
  Ignoring remaining command line arguments
    Found volume group "global"
    Found volume group "global"
    Checking progress every 15 seconds
  Number of segments in active LV pvmove0 does not match metadata
  ABORTING: Mirror percentage check failed.

Abort worked:

hades:/home# pvmove --abort
  device-mapper: create ioctl failed: Device or resource busy
  Unable to reactivate logical volume "pvmove0"

And then the pvmove, of the now-unmounted volume, worked.


Isn't pvmove supposed to not care if things are mounted or not?

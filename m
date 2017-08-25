Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9476D777CA
	for <linux-lvm@redhat.com>; Fri, 25 Aug 2017 13:27:31 +0000 (UTC)
Received: from mklab.ph.rhul.ac.uk (mklab.rhul.ac.uk [134.219.128.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E3BD5BECB
	for <linux-lvm@redhat.com>; Fri, 25 Aug 2017 13:27:29 +0000 (UTC)
Message-Id: <201708251320.v7PDKrtR004269@mklab.ph.rhul.ac.uk>
Date: Fri, 25 Aug 2017 14:20:53 +0100 (BST)
From: TPClvm@mklab.ph.rhul.ac.uk
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2-2.02.173 breaks Slackware-current systems with
	snapshots
Reply-To: TPClvm@mklab.ph.rhul.ac.uk,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com
Cc: TPClvm@mklab.ph.rhul.ac.uk

My message below was originally posted to Usenet NG alt.os.linux.slackware
but I did not get any feedback there.  The slackware package is built using
this http://slackware.osuosl.org/slackware-current/source/a/lvm2/lvm2.SlackBuild
simple script using the LVM source tarball and a patch file in that directory.

Can anyone explain what the problem is and how to fix it?  Let me know if any 
further information is needed?

Please help!

Thanks
Tom Crane

--------------------------------------------------------------------------
Some recent updates have broken my 32-bit Slackware-current system,
rendering it un-bootable.  I believe the source of the trouble is that
I have the root partition on an LV and that I keep snapshots of that
(and other) LVs.  After installing updates with 'slackpkg upgrade-all'
I do something like,

cd /boot
mkinitrd -L -c -k 4.9.44 -m ext2:ext3:dm-snapshot -f ext3 -r /dev/VG0/root -u && mv initrd.gz initrd_4.9.44.gz

and then run lilo, where the corresponding section is, eg.,

  image = /boot/vmlinuz-generic-4.9.44
  root = /dev/VG0/root
  initrd = /boot/initrd_4.9.44.gz
  label = lin-4.9.44

The only modification I have to the default /etc/lvm/lvm.conf contents is this,

         snapshot_autoextend_threshold = 50
         snapshot_autoextend_percent = 10

In /etc/rc.d/rc.local I use,

pidof -s dmeventd || dmeventd

to ensure the dmevent daemon is running to monitor and dynamically resize my LVs as needed.

I use daily & monthly cronjobs to update the snapshots with,

  lvremove -f /dev/VG0/<older-snapshot>
  lvrename VG0 <newer-snapshot> <older-snapshot-name>
  lvcreate -L<snapshot-size> --snapshot --name <snapshot-same> /dev/VG0/<snapshot-name>
  # Ensure snapshot monitoring after recreating snapshots
  vgchange --monitor y --poll y --ignoreskippedcluster VG0
 

This arrangement has worked for many years.  When lvm2-2.02.172-i586-1
got updated to lvm2-2.02.173-i586-1 a few weeks ago, rebooting gave
the following failure,

http://www.mklab.rhul.ac.uk/~tom/IMG_20170802_184614.jpg

where it bails out in the initrd.  Checking the PVs from the initrd gave this,

http://www.mklab.rhul.ac.uk/~tom/IMG_20170802_184654.jpg

suggesting they are corrupt.  Similarly,

http://www.mklab.rhul.ac.uk/~tom/IMG_20170802_184731.jpg

However, booting with the Slackware 14.1 CD and checking the PVs, VGs
& LVs shows they are all present and correct.  Similarly, with pvck,

http://www.mklab.rhul.ac.uk/~tom/IMG_20170802_185229.jpg.


Experimenting in the initrd, I tried turning on and off the '-u'
(udev) option to mkinitrd and also incorporating /sbin/dmeventd into
the initrd but neither made any difference.

Later I upgraded all packages again which updated the 4.9.41 kernel to
4.9.44, but kept lvm2-2.02.172-i586-1 on rebooting ended up with the
same broken system as illustrated above.  After a lot of messing
around I downloaded lvm2-2.02.154-i586-1.txz from Slackware-14.2 and
installed that.  After rerunning the above mkinitrd and lilo I had a
bootable system again.  However now all the lvm commands I tried,
eg. 'pvs' all result in 'Invalid units specification'.


Nothing in /usr/doc/LVM2.2.02.173/WHATS_NEW* changelogs gave any
obvious pointers to my problem.


One other thing, I mention in case it is relevant: A long standing
irritant I have with this configuration is that booting can takes ages
-- anything up to 20minutes.  The long pause takes place early in the
boot, where volume activation 'vgchange -ay' takes place in the
initrd.  The length of the pause is related to the size of the
snapshots.  ie. if the snapshots are all small, having only just been
created or when very few changes have taken place on the original
FSes, the pause is short.  During the pause there is continuous HD
activity with the HD activity LED on continuously.  I have never
understood what it is doing here -- presumably some sort of checking
of the snapshots...

I have verified all of the above symptoms on a second machine with a
similar setup.


Any thoughts?

Thanks
Tom Crane

-- 
Tom Crane, Dept. Physics, Royal Holloway, University of London, Egham Hill,
Egham, Surrey, TW20 0EX, England. 
Email:  T.Crane@rhul.ac.uk

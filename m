Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3R2Hdwc007676
	for <linux-lvm@redhat.com>; Sat, 26 Apr 2008 22:17:39 -0400
Received: from nlpi053.prodigy.net (nlpi053.sbcis.sbc.com [207.115.36.82])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3R2HFhf027312
	for <linux-lvm@redhat.com>; Sat, 26 Apr 2008 22:17:16 -0400
Received: from mail.kdzbn.homelinux.net
	(adsl-75-40-228-163.dsl.klmzmi.sbcglobal.net [75.40.228.163])
	(authenticated bits=0)
	by nlpi053.prodigy.net (8.13.8 smtpauth/dk/8.13.8) with ESMTP id
	m3R2H7UB024931
	for <linux-lvm@redhat.com>; Sat, 26 Apr 2008 21:17:07 -0500
Received: from beta.mydomain ([192.168.2.237])
	by mail.kdzbn.homelinux.net with esmtp (Exim 4.62)
	(envelope-from <bryan@kadzban.is-a-geek.net>) id 1JpwRx-0007an-Tu
	for linux-lvm@redhat.com; Sat, 26 Apr 2008 22:17:09 -0400
Message-ID: <4813E225.7040900@kadzban.is-a-geek.net>
Date: Sat, 26 Apr 2008 22:17:09 -0400
From: Bryan Kadzban <bryan@kadzban.is-a-geek.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Offline fsck (checking snapshots)
References: <48110C2D.5020800@kadzban.is-a-geek.net>
	<4813D644.7080003@Media-Brokers.com>
In-Reply-To: <4813D644.7080003@Media-Brokers.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: RIPEMD160

Charles Marcus wrote:
> Bryan Kadzban wrote:
>> I've gotten a script that I think is reasonable, that handles this.
>> With some help from others, it now works with XFS as well as ext2/3,
>> and it's supposed to also work with JFS.  Since it requires LVM, I
>> think it might make sense to put something like it into the LVM
>> userspace tools.
> 
> Sounds interesting... but any particular reason you're ignoring
> reiserfs?

No particular reason, no.  I just haven't used it in maybe 6 years, so I
don't remember much about it.  I also assume that nobody listening to
the discussion on ext3-users uses it either (based on the fact that
nobody else asked for it).  So it didn't get added.  :-)

I assume fsck.reiserfs is the right executable to use?  (I seem to
remember a reiserfsck, but not whether they were equivalent...)  What
args should be used to get it to check the snapshot FS, preferably
making as few changes as possible?  (E.g., ext3 requires a pre-check
check to clean up orphan inodes, otherwise the real check will exit with
a failure status; does reiserfs require anything similar?)

I don't remember whether it stores the last-fsck time either; if it
does, is there some way to get that out (for try_get_check_date)?  Does
it support updating that time while an LV is online?  What about forcing
a check (per-filesystem) on the next reboot?  (Any ability to set the
last-fsck time would work for both preventing a check and forcing a
check, of course.)

Google says it can do an external journal; how can you tell whether
that's in use (to skip making snapshots of only half the device)?

Thanks!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIE+IlS5vET1Wea5wRA9jiAKDWRfyU42n5gVbmeN5oqdt4ElhhkgCfZ+we
T5XNVLgYw/tG4r5g5uaNIAU=
=Vdq3
-----END PGP SIGNATURE-----

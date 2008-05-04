Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m440jnIF023799
	for <linux-lvm@redhat.com>; Sat, 3 May 2008 20:45:49 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m440jcsk019660
	for <linux-lvm@redhat.com>; Sat, 3 May 2008 20:45:38 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m440jX61024541
	for <linux-lvm@redhat.com>; Sat, 3 May 2008 20:45:33 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m440jXIL006717
	for <linux-lvm@redhat.com>; Sat, 3 May 2008 20:45:33 -0400
Date: Sat, 3 May 2008 20:45:33 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0805022200280.13318@engineering.redhat.com>
Message-ID: <Pine.LNX.4.44.0805032037140.6617-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Temporary shapshots
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2 May 2008, Mikulas Patocka wrote:

> To use temporary storage for snapshot, a special command for lvm would be 
> more appropriate --- a command that would setup snapshot and write nothing 
> about it to metadata, so that the snapshot would be forgotten on next 
> reboot --- then, you can setup the snapshot on any device outside the 
> volume group. You can already do this with dmsetup.

This is an excellent idea - and not just for ramdisks.  The hardest part
of using snapshots for backups is making sure they are deleted afterward.
Not having to check at reboot would be one less 'i' to dot.

Now supposing this feature is added to lvm - what if an enterprising 
admin decides to create *two* snapshots using the same block device?
This could be a caveat emptor - or it could check that the block device
was not in use by anything else, like another snapshot.

Couldn't a LV be used for a temporary snapshot also?  It would just
look like the COW instead of the snapshot image.  I could allocate
a backup_cow LV for backup use only.

The only problem I see is newbies getting very confused wondering why
their "snapshot" won't mount.  That's why I suggest *not* calling the
examples (of the temporary snapshot feature) in the docs anything with "snap"
in the name.  I suggest "cow" as above.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

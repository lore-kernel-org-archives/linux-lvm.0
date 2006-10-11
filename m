Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9BHYrno025511
	for <linux-lvm@redhat.com>; Wed, 11 Oct 2006 13:34:53 -0400
Received: from mx1.suse.de (ns1.suse.de [195.135.220.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9BHYVPC031625
	for <linux-lvm@redhat.com>; Wed, 11 Oct 2006 13:34:31 -0400
Received: from Relay1.suse.de (mail2.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.suse.de (Postfix) with ESMTP id 18B4410125
	for <linux-lvm@redhat.com>; Wed, 11 Oct 2006 19:34:26 +0200 (CEST)
Date: Wed, 11 Oct 2006 19:34:21 +0200
From: Jan Blunck <jblunck@suse.de>
Message-ID: <20061011173421.GC4636@hasse.suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [RFC] Let udev play with snapshots
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

Hi,

it seems that the snapshot problem isn't solved completely by our latest
changes. I looked into it and found something:

The problem is that udev isn't able to differentiate between dm targets that
aren't supposed to be opened by anything else than the lvm2 tools itself or
not. When we are creating a snapshot, this is what we do:

- creating "vg-snapshot"
- clearing the start of "vg-snapshot"
- removing "vg-snapshot"                                                  (1)
- creating "vg-origin-real"
- creating "vg-snapshot-cow"
- creating "vg-snapshot"
- suspending "vg-origin" and "vg-origin-real"
- reload tables
- resuming "vg-origin-real", "vg-snapshot-cow", "vg-snapshot" and         (2)
  "vg-origin"

At the point (1) udev already run vol_id on vg-snapshot. This LV is only
created to clear the exception store of the snapshot to be created. So
lvcreate tries to remove the still open vg-snapshot.

What we need to do is to tell udev that it shouldn't open the intermediate
vg-snapshot target but wait until (2) to open it.

I'm not quite certain about how to do this. IIRC Heinz told me during the
summit about the tagging possibilities. The problem is that tags are not
supported by snapshots but as the first LV isn't a snapshot ... So I propose
the tagging of all kind of intermediate LVs so that udev can easily
differentiate by calling "dmsetup lstag" (or maybe lsattr ;)

Comments?

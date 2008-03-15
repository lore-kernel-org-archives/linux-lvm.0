Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2FMcRcX014543
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 18:38:27 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2FMbvHv003664
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 18:37:57 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m2FMbqVp003892
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 18:37:52 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m2FMbqvb002277
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 18:37:52 -0400
Date: Sat, 15 Mar 2008 18:37:52 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] how to recover lvm after OS re-install
In-Reply-To: <Pine.LNX.4.44.0803151828140.2199-100000@bmsred.bmsi.com>
Message-ID: <Pine.LNX.4.44.0803151834380.2199-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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

On Sat, 15 Mar 2008, Stuart D. Gathman wrote:

> > Obviously, if I format it, there will be no problem in mounting, but will
> > lose all the data on it. 
> 
> You've wiped the super block, so recovery will be complex.

Also, your new LV won't be in the same physical locations as your old.  LVs
are *not* partitions.  Since you have a backup of /etc/lvm, after you
verify which hd used to contain your VG, you should be able to restore
the metadata (which you wiped out with the pvcreate).  Depending on how
much of the LV was zeroed out when you created the new one (I think only
the superblock), you should be able to fsck the filesystem using a spare
superblock (ext3 keeps several).

> > Is there a way to mount this lv without losing data? Or, should I forget
> > about all the data on that disk?
> 
> Didn't the pvcreate warn you about wiping out an existing VG?
> If it didn't, then you might be confused about which disk your VG
> was on.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2FMX3nq012861
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 18:33:03 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2FMWCmc000984
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 18:32:12 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m2FMW6ta003677
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 18:32:06 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m2FMW6EF002250
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 18:32:06 -0400
Date: Sat, 15 Mar 2008 18:32:06 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] how to recover lvm after OS re-install
In-Reply-To: <56318.49971.qm@web58308.mail.re3.yahoo.com>
Message-ID: <Pine.LNX.4.44.0803151828140.2199-100000@bmsred.bmsi.com>
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

On Sat, 15 Mar 2008, lemon lemon wrote:

> Now struggling to recover the logical volume I had before the server crash.
> It is full of files, data etc. OS was not (and is not) on that hard disk.
> That is a separate data partition (actually a hard raid array). There is no
> any hard disk failure. And, I didn't formatted this disk during re-install
> OS. So, I think, the data should be there untouched.

So far so good.

> What I did:
> #pvcreate /dev/sdc
> #vgcreate -s 32M raid_vg0 /dev/sdc (I used the same PE size as before)
> #lvcreate -l 23839 -n raid_lv0 raid_vg0 (maximum extents from vgdisplay)

That, however, just wiped out your data.  Why did you do that???

> Unfortunately, it complains when mounting raid_lv0:
> #mount: you must specify the filesystem type

Yep, you wiped out the filesystem.

> Obviously, if I format it, there will be no problem in mounting, but will
> lose all the data on it. 

You've wiped the super block, so recovery will be complex.

> Is there a way to mount this lv without losing data? Or, should I forget
> about all the data on that disk?

Didn't the pvcreate warn you about wiping out an existing VG?
If it didn't, then you might be confused about which disk your VG
was on.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

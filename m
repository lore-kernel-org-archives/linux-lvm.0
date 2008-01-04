Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m04KxuYX021439
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 15:59:56 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m04KxaMf014980
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 15:59:36 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m04KxUWc012498
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 15:59:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m04KxUCw005899
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 15:59:30 -0500
Date: Fri, 4 Jan 2008 15:59:30 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: RE: [LINUX-LVM] shrinking a volume inside an LVM
In-Reply-To: <F61B3F3722111146AF452DF29FDCCF5F038D1BD8@xchg03.bolivar.k12.mo.us>
Message-ID: <Pine.LNX.4.44.0801041556120.5886-100000@bmsred.bmsi.com>
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

On Fri, 4 Jan 2008, Kemp, Levi wrote:

> Most of this makes sense. Especially the part about using a live CD. But if
> you don't mind I'm gonna pick your brain on the other parts because I like to
> understand a command before I use it, so I can blame myself when I mess up
> ;-) Actually the only part I'm unsure about is 9-11. resize2fs will resize my
> ext2/3 file system which will clear up more room in my lvm to create another
> lv correct? Or do you have to shrink the file system then the lv to have the
> space back? I'm going to back up anything that I need to be safe, but I'd
> like to avoid a total reinstall right now(that's for May). Thanks again. I
> think you've got me on track. One more quick one, on 9 you said "amount
> occupied + some" wouldn't it be minus some?

The plan given was to shrink the fs first, then reduce the LV to something
*bigger* than the shrunk filesystem.  I would add a little to the size
on lvreduce just to be sure.  The second resize is then to grow the fs
into the exact size of the LV (which it can do automatically and safely).

Shrinking is more dangerous than growing with current tools because the
lvreduce isn't smart enough to know exactly how big the filesystem
inside is, and you had better have shrunk the fs sufficiently first.

resize2fs, on the other hand, *does* know exactly how big the underlying LV or
other device is when expanding.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

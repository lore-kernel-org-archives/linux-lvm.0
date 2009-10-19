Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9JHLILt000873
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 13:21:18 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9JHL8EH018518
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 13:21:08 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n9JHL7TB027176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 13:21:07 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n9JHL7qW015519
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 13:21:07 -0400
Date: Mon, 19 Oct 2009 13:21:07 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
In-Reply-To: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0910191319270.15449@bmsred.bmsi.com>
References: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com>
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

On Mon, 19 Oct 2009, Lou Arnold wrote:

> 1) I have been trying to add a 2nd drive (one partition) to my system, and
> then to see the total free space via the file browser. But this doesn't work
> if I create a new volume group and add the drive to that. Why is this so?

File system free space is unrelated to LVM free space.  The free space of
each VG is independent.  (That is a main point of multiple volume groups.)

> 2) I also tried adding the drive to the existing volume group (VolGroup00)
> and created a new logical volume group (LogVol02) for the drive. But again,
> the file browser shows different amounts of free space at root (31GB) vs
> after the mount point of the new drive (/mnt/X2nd40GB) (35 GB). Why does it
> not show 66 GB free no matter what folder I look at?

If file browser means file system browser, it would not be expected to show
LVM free space.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

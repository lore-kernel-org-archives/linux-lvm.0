Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o85JfsGT011581
	for <linux-lvm@redhat.com>; Sun, 5 Sep 2010 15:41:54 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o85JfiOu010687
	for <linux-lvm@redhat.com>; Sun, 5 Sep 2010 15:41:45 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o85JfiMk007009
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 5 Sep 2010 15:41:44 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o85JfiAf017735
	for <linux-lvm@redhat.com>; Sun, 5 Sep 2010 15:41:44 -0400
Date: Sun, 5 Sep 2010 15:41:44 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4c8249ae.07c1640a.2f38.ffff91c3@mx.google.com>
Message-ID: <Pine.LNX.4.64.1009051537580.17691@bmsred.bmsi.com>
References: <4c8249ae.07c1640a.2f38.ffff91c3@mx.google.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Important diretories are missing after adding space.
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 4 Sep 2010, For Miscelenious wrote:

> Checked -alm directories were in place. Proceeded with creation a few large
> files * also worked fine. Switched the machiine off and went to bed.
> Next day booted to discover that few , but the most important, dies are
> missing.

The sfdisk output looks ok.  Now don't be offended, just ruling out 
obvious things that could have gone wrong.  You did shutdown before
switching off the machine, right?

> e2fsck -f /dev/mapper/VG_Storage-LV_00

By any chance, did fsck fix stuff?  Have you looked in lost+found?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

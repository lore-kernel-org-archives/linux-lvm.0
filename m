Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6MNRXwn031294
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2010 19:27:33 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6MNRNKf010059
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2010 19:27:23 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o6MNRM74011213
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2010 19:27:22 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o6MNRMLG004414
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2010 19:27:22 -0400
Date: Thu, 22 Jul 2010 19:27:22 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTinLlKbDFlkIRRpITw723CQyInvx_0JnZJ2a_dh3@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1007221926160.4361@bmsred.bmsi.com>
References: <4c475b80.017c8d0a.36d8.253a@mx.google.com>
	<20100721213406.GA15829@bdmcc-us.com>
	<AANLkTinLlKbDFlkIRRpITw723CQyInvx_0JnZJ2a_dh3@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [SOLVED?] rebuilding LV ext4 filesystem
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

On Thu, 22 Jul 2010, Ken Bass wrote:

> MilkDrops? I didn't even have WinAmp installed. Maybe it, or some of its
> plugins were installed by other a/v apps. I am guessing that I can ignore
> them. But the funny thing is: these were the only files with any given
> extension under lost+found after I fixed my LV filesystem.

I suspect it has to do with information about partially recovered files
or directories.  I wouldn't throw them out just yet.  Perhaps
a google on e2fsck and .milk ?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

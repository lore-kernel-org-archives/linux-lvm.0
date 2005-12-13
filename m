Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBD2Kc120303
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 21:20:38 -0500
Received: from mail1.merlins.org (Debian-exim@magic.merlins.org
	[209.81.13.136])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBD2KZ9L027010
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 21:20:35 -0500
Received: from merlin by mail1.merlins.org with local (Exim 4.34 #1)
	id 1ElzmF-0005wH-Rs by authid <merlin>
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 18:20:27 -0800
Date: Mon, 12 Dec 2005 18:20:27 -0800
From: Marc MERLIN <marc_lvm@merlins.org>
Subject: Re: [linux-lvm] lvm1 to lvm2 upgrade failed: confused on pv between
	sda1 and md5
Message-ID: <20051213022027.GD28650@merlins.org>
References: <20051212182045.GA30998@merlins.org>
	<20051212184408.GD25866@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051212184408.GD25866@agk.surrey.redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Dec 12, 2005 at 06:44:08PM +0000, Alasdair G Kergon wrote:
> Hi Marc,
> 
> On Mon, Dec 12, 2005 at 10:20:45AM -0800, Marc MERLIN wrote:
> >   LVM version:     2.01.04 (2005-02-09)
> 
> There have been many bug fixes since that release.
> 
> First of all, try the last 2.01.* release (2.01.15) and see 
> whether that fixes it.
> 
> >   Library version: 1.01.00-ioctl (2005-01-17)
> 
> Also suggest updating device-mapper to 1.01.05.
> 
> Check that you have in lvm.conf devices section:
>   md_component_detection = 1 
> (i.e. not = 0)
 
That was the one, thank you so much.
For some reason, the debian package I got had this set to 0 by default

Ideally, I would have known about this file, but I didn't realize it
appeared between lvm1 and lvm2

Thanks for your help (the VG is indeed up and happy now)

Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
Microsoft is to operating systems & security ....
                                      .... what McDonalds is to gourmet cooking
Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key

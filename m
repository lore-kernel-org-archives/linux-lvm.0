Date: Sat, 22 Sep 2012 18:34:12 +0200
From: Miquel van Smoorenburg <mikevs@xs4all.net>
Message-ID: <20120922163411.GA6975@xs4all.net>
References: <50477429.8080204@xs4all.net>
	<20120914133556.GI15728@agk-dp.fab.redhat.com>
	<5053939A.7070104@xs4all.net> <20120917100750.GA2316@xs4all.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20120917100750.GA2316@xs4all.net>
Subject: Re: [linux-lvm] [PATCH] automatically filter disks with imsm or ddf
 superblocks, v2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair G Kergon <agk@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

According to Miquel van Smoorenburg:
> Here's version two of the patch. I've taken your comments into account,
> and I've also fixed some wrong assumptions (like size being in sectors,
> not bytes). It's been tested on both imsm and ddf formatted disks.

Hmm, I caused a small cosmetic bug when I implemented one of
your suggestions, this should fix it (I'l send a full patch as well):

--- a/lib/filters/filter-md.c	2012-09-16 21:05:34.000000000 +0000
+++ b/lib/filters/filter-md.c	2012-09-22 16:24:18.528609536 +0000
@@ -29,7 +29,7 @@
 		return 1;
 	
 	if ((ret = dev_is_md(dev, NULL)) != 0)
-		sb_type = "ddf";
+		sb_type = "md";
 	else if ((ret = dev_is_ddf(dev, NULL)) != 0)
 		sb_type = "ddf";
 	else if ((ret = dev_is_imsm(dev, NULL)) != 0)

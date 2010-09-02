Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o823iHdO002622
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 23:44:17 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o823i8rB013701
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 23:44:09 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o823i81M013626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 23:44:08 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o823i8TT010734
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 23:44:08 -0400
Date: Wed, 1 Sep 2010 23:44:08 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4C7F02F2.3040500@tlinx.org>
Message-ID: <Pine.LNX.4.64.1009012333310.10561@bmsred.bmsi.com>
References: <4C7F02F2.3040500@tlinx.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lsm space giveth and space taketh away: missing
 space?
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

On Wed, 1 Sep 2010, Linda A. Walsh wrote:

> lvresize /dev/Backups/Backups -L +3.15G
>  Rounding up size to full physical extent 3.15 GB
>  Extending logical volume Backups to 10.91 TB
>  Logical volume Backups successfully resized
> 
> Um...HELLO?  Extending to 10.91?  But it was at 10.91!

3.15G is not significant compared to 10.91TB.  You know the saying, 
"A billion here and a billion there, and pretty soon you're talking
about real storage."

> So why does parted show a 12TB disk while lvm shows only a 10.91T
> disk and why did lvm show 3.15G free when it wasn't really there?

12.0 TeraBytes (12*10^12) ~= 10.91 TibiBytes (10.91*2^40) to 4 decimals.  The
3.15G was there, you added it to your LV (but you still need to resize the
filesystem).  10.91*2^40 + 3.15*2^30 ~= 10.91*2^40 to 4 decimals.

> How do I get my 1.09T back from lvm?  That seems like awfully
> high for an overhead number for lvm.  I'd expect more like "0.09T".

http://www.innumeracy.com/

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB3Gi92A029824
	for <linux-lvm@redhat.com>; Fri, 3 Dec 2010 11:44:09 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB3GhxlB000868
	for <linux-lvm@redhat.com>; Fri, 3 Dec 2010 11:43:59 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oB3GhwuI019925
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 3 Dec 2010 11:43:58 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id oB3GhwRu004897
	for <linux-lvm@redhat.com>; Fri, 3 Dec 2010 11:43:58 -0500
Date: Fri, 3 Dec 2010 11:43:58 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4CEEAD7D.5040506@shiftmail.org>
Message-ID: <Pine.LNX.4.64.1012031138050.4701@bmsred.bmsi.com>
References: <4CEEAD7D.5040506@shiftmail.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Losing one of various PVs in VG
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

On Thu, 25 Nov 2010, Spelic wrote:

> Now I'm wondering what happens if we lose an array: all data on all arrays
> will be lost because the VG is lost?

No.

If you use LVM level raid0 (striping) on a particular LV, then losing any
component of the stripe will lose the LV (but not the VG).

If you use LVM level raid1 (mirroring) on a particular LV, then losing
any component of the mirror does not lose the LV (or the VG).

For linear LVs (extents on minimum number of PVs), losing a PV used by 
the LV will lose the LV, but not the VG.

You do not gain anything by assigning a separate VG to each array -
unless you want to be able to easily remove the array.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

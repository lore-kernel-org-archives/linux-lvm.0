Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o823qDAI017046
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 23:52:13 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o823q4J3010996
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 23:52:05 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o823q2Np013785
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 23:52:02 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o823q2ir010858
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 23:52:02 -0400
Date: Wed, 1 Sep 2010 23:52:02 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1009012333310.10561@bmsred.bmsi.com>
Message-ID: <Pine.LNX.4.64.1009012346090.10561@bmsred.bmsi.com>
References: <4C7F02F2.3040500@tlinx.org>
	<Pine.LNX.4.64.1009012333310.10561@bmsred.bmsi.com>
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

On Wed, 1 Sep 2010, Stuart D. Gathman wrote:

> 12.0 TeraBytes (12*10^12) ~= 10.91 TibiBytes (10.91*2^40) to 4 decimals.  The
> 3.15G was there, you added it to your LV (but you still need to resize the
> filesystem).  10.91*2^40 + 3.15*2^30 ~= 10.91*2^40 to 4 decimals.
> 
> http://www.innumeracy.com/

I didn't mean to be quite so snarky.  It is a real problem that the storage
units (binary vs. decimal) are not consistently labeled in the various
utilities.  Blame it on disk manufacturers who started using decimal units
to inflate the apparent size of their drives in the eyes of naive buyers.
(But you should have had some sense of how insignificant a Giga anything is
compared to a Tera anything, whether binary or decimal.)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

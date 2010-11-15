Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAFMvnf6024292
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 17:57:49 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFMvL0I012801
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 17:57:32 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oAFMvId8015222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 17:57:18 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id oAFMvIoG004527
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 17:57:18 -0500
Date: Mon, 15 Nov 2010 17:57:18 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <20101115203757.GA5876@yahoo.fr>
Message-ID: <Pine.LNX.4.64.1011151755270.4470@bmsred.bmsi.com>
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
	<20101115203757.GA5876@yahoo.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] advice for curing terrible snapshot performance?
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

On Mon, 15 Nov 2010, Stephane Chazelas wrote:

> ddsnap (zumastor) worked great but is no longer maintained.
> 
> - LVM snapshots: poor performace or very few snapshots
> - ddsnap: got to stick with an old kernel

zumastor doesn't depend on kernel versions - it uses device-mapper just
like regular snapshots.  (Or does it have a special device-mapper
kernel module?)

> - btrfs, not really production ready yet. Probably your best bet
> though.

This is good too, but at a different level.  We still need LV snapshot.

> - fuse solutions, with all the fuse related issues.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6RLSwXJ024935
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2016 17:28:58 -0400
Received: from mail.gathman.org (unknown [50.248.53.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 974F28B13D
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2016 21:28:56 +0000 (UTC)
Received: from elissa.gathman.org (elissa.gathman.org
	[IPv6:2001:470:8:809:11::1009]) (authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id u6RJHZl4021714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2016 15:17:41 -0400
References: <CAOXD2Kufsndmiian5NwV5Cmg+CAZeiKRyzDRQdazbkOzs0LL9Q@mail.gmail.com>
From: Stuart Gathman <stuart@gathman.org>
Message-ID: <aa376169-db61-4b17-06cf-10e6495e8b15@gathman.org>
Date: Wed, 27 Jul 2016 15:17:35 -0400
MIME-Version: 1.0
In-Reply-To: <CAOXD2Kufsndmiian5NwV5Cmg+CAZeiKRyzDRQdazbkOzs0LL9Q@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots & data security
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
To: linux-lvm@redhat.com

On 07/19/2016 11:28 AM, Scott Sullivan wrote:
>
> Could someone please clarify if there is a legitimate reason to worry
> about data security of a old (removed) LVM snapshot?
>
> For example, when you lvremove a LVM snapshot, is it possible for data
> to be recovered if you create another LVM and it happens to go into
> the same area as the old snapshot we lvremoved?
>
> If this helps clarify, do we have to worry about security scrubbing a
> LVM snapshot for data security ?
>
Another idea: if your VG is on SSD, and properly aligned, then DISCARD
on the new LV will effectively zero it as far as any guest VMs are
concerned.  (The data is still on the flash until erased by the
firmware, of course.)  If VG and PE size do not align with the SSD erase
block, then you can still zero the "edges" of the new LV, which is much
faster (and less wear on the SSD) than zeroing the whole thing.  You
could always read-verify that the data is actually all zero.

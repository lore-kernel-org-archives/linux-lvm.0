Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qBEIqf1X025047
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2012 13:52:41 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBEIqefu006762
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2012 13:52:41 -0500
Received: from sdg.bmsi.com (sdg.bmsi.com [192.168.9.34] (may be forged))
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id qBEIqdpr004660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2012 13:52:40 -0500
Message-ID: <50CB7577.4050906@bmsi.com>
Date: Fri, 14 Dec 2012 13:52:39 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <50C9F2D6.7090802@ubuntu.com>
In-Reply-To: <50C9F2D6.7090802@ubuntu.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Non 512 byte sectors
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 12/13/2012 10:23 AM, Phillip Susi expounded in part:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Is it possible to get dm to report > 512 byte sector size?  If so, how?
>
>
blockdev --getss /dev/vg/lv  (or any other block device)

That is probably logical sector size, however.  The only way I know to 
get physical sector size is:

hdparm -I /dev/sda

which reports logical and physical sector size.  Some WD devices are 
known to lie about physical sector size, however.

If you always align stuff to 4096, there won't be a problem.  In fact, 
new technology tends to have much larger alignment requirements for 
optimum performance - say 128k, the size of an erase block, or 64k for a 
RAID chunk size.  So aligning everything to 1M should hold you for a while.

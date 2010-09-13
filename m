Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8D1ouJj025654
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2010 21:50:56 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8D1oj1e002610
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2010 21:50:45 -0400
Received: from [192.168.10.38] (fairfax.gathman.org [72.209.196.211])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o8D1oivh024191
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2010 21:50:44 -0400
Message-ID: <4C8D8374.6040706@bmsi.com>
Date: Sun, 12 Sep 2010 21:50:44 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <1284181378.3968.14.camel@pc7.dolda2000.com>
In-Reply-To: <1284181378.3968.14.camel@pc7.dolda2000.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Errors from a mirrored LV
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

On 09/11/2010 01:02 AM, Fredrik Tolf wrote:
> Having a disk that's going awry, I'm glad I've got the data in a
> mirrored LV so that I can replace it.
>
> sd 3:0:0:0: [sdd] Add. Sense: Unrecovered read error - auto reallocate
> failed
> end_request: I/O error, dev sdd, sector 662969514
> ata4: EH complete
> I/O error in filesystem ("dm-3") meta-data dev dm-3 block 0x27841ae8
> ("xfs_trans_read_buf") error 5 buf count 4096
>
> Note that last line of log, emitted by XFS.
>
> Shouldn't LVM, when a read fails in a mirror, try to fetch that data
> from the second disk instead?
>   
Correct me if I'm wrong, but LVM mirror support is still experimental
and doesn't do a lot of things.  If you need reliable mirroring now, use
the md driver for raid1, and add the /dev/md* devices as physical volumes.

In the meantime, you should probably remove the failing PV.

AIX is still the best LVM mirroring I've seen.  I know ZFS is great too,
but it is more tied to a specific filesystem.

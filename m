Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j259Nwn05191
	for <linux-lvm@redhat.com>; Sat, 5 Mar 2005 04:23:58 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j259Nqoa009337
	for <linux-lvm@redhat.com>; Sat, 5 Mar 2005 04:23:52 -0500
Date: Sat, 5 Mar 2005 10:23:51 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM Question
Message-ID: <20050305092351.GI3192@percy.comedia.it>
References: <CEEE90D87043AA4487634844B31B03631141B17B@ukspkem01.corp.hds.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CEEE90D87043AA4487634844B31B03631141B17B@ukspkem01.corp.hds.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Mar 04, 2005 at 12:49:00PM -0000, Matthias Rudolph wrote:
>Hello all,
> 
>how can I force to activate a VG on a special device file?
>One FC Storage Disk is visible over two pathes (sda and sdb). We use our
>Path Management Software. It creates sddlmaa. After creating the VG the
>sddlmaa is ACTIVE - OK. But after deactivating and activating sdb is ACTIVE.
>This means: no pathfailover.

switch to lvm2 and use filters in /etc/lvm/lvm.conf

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

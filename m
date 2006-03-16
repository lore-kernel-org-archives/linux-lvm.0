Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2GICm130100
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 13:12:48 -0500
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2GICkCG001268
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 13:12:47 -0500
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by tungsten.msp.technicality.org (8.13.4/8.13.4/Debian-3) with ESMTP id
	k2GICYuc003490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 12:12:34 -0600
Date: Thu, 16 Mar 2006 12:12:34 -0600 (CST)
From: Nate Carlson <natecars@natecarlson.com>
Subject: RE: [linux-lvm] online resize
In-Reply-To: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>
Message-ID: <Pine.LNX.4.63.0603161210200.30335@tungsten.msp.technicality.org>
References: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 16 Mar 2006, Roger Lucas wrote:
> We use Reiser3 here and it can grow a volume whilst it is mounted, but 
> you have to unmount the volume before you can shrink it.
>
> The man pages for resize_reiserfs indicate that it should be used on 
> unmounted volumes...
>
> AFAIK, Reiser is the only filesystem in common use that allows volumes 
> to be reduced.

Note that Reiser4 no longer supports this.  :(

------------------------------------------------------------------------
| nate carlson | natecars@natecarlson.com | http://www.natecarlson.com |
|       depriving some poor village of its idiot since 1981            |
------------------------------------------------------------------------

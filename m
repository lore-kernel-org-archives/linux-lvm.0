Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0BJGTbx023437
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 14:16:29 -0500
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0BJGRne032691
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 14:16:27 -0500
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by tungsten.msp.technicality.org (8.13.4/8.13.4/Debian-3sarge3) with
	ESMTP id l0BJGHJB000531
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 13:16:18 -0600
Date: Thu, 11 Jan 2007 13:16:17 -0600 (CST)
From: Nate Carlson <natecars@natecarlson.com>
Subject: Re: [linux-lvm] Combination of clvm and non-cluster?
In-Reply-To: <20070111172004.GF21980@agk.surrey.redhat.com>
Message-ID: <Pine.LNX.4.63.0701111316090.28722@tungsten.msp.technicality.org>
References: <Pine.LNX.4.63.0701111112520.28722@tungsten.msp.technicality.org>
	<20070111172004.GF21980@agk.surrey.redhat.com>
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

On Thu, 11 Jan 2007, Alasdair G Kergon wrote:
> Clustering is a volume group property.
>  vgchange -c
>
> Can't mix local and clustered volumes in the same VG.
>
> Best to use version 2.02.17 with built-in clustered locking
> (locking type 3).
>
> New config parameters
>  fallback_to_clustered_locking
>  fallback_to_local_locking
> (see example.conf, but default settings are normally OK)

I will experiment with this -- thanks!

------------------------------------------------------------------------
| nate carlson | natecars@natecarlson.com | http://www.natecarlson.com |
|       depriving some poor village of its idiot since 1981            |
------------------------------------------------------------------------

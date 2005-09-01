Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j81CZqHQ007668
	for <linux-lvm@redhat.com>; Thu, 1 Sep 2005 13:35:53 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EAoIK-0005S9-RL
	for linux-lvm@redhat.com; Thu, 01 Sep 2005 13:35:52 +0100
Date: Thu, 1 Sep 2005 13:35:52 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove is stuck
Message-ID: <20050901123552.GM15141@agk.surrey.redhat.com>
References: <1125522968.11068.9.camel@avenin.ebourne.me.uk>
	<20050831213759.GI15141@agk.surrey.redhat.com>
	<1125525121.11068.12.camel@avenin.ebourne.me.uk>
	<20050831222947.GL15141@agk.surrey.redhat.com>
	<1125528606.11068.23.camel@avenin.ebourne.me.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1125528606.11068.23.camel@avenin.ebourne.me.uk>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Aug 31, 2005 at 11:50:05PM +0100, Martin Ebourne wrote:
> But is there any other possible explanation than a bad sector? Only
> there's several reasons I don't think there are any bad sectors:
 
Well check for yourself if the mirroring process has worked:
read the data from each side of the mirror and check it's
identical.  If a small part of it isn't, try copying that
part manually and see if it gives any errors.

Alasdair
-- 
agk@redhat.com

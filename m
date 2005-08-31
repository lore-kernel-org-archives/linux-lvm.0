Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j7VLbxHQ026073
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 22:37:59 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EAaHP-0004k4-2o
	for linux-lvm@redhat.com; Wed, 31 Aug 2005 22:37:59 +0100
Date: Wed, 31 Aug 2005 22:37:59 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove is stuck
Message-ID: <20050831213759.GI15141@agk.surrey.redhat.com>
References: <1125522968.11068.9.camel@avenin.ebourne.me.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1125522968.11068.9.camel@avenin.ebourne.me.uk>
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

On Wed, Aug 31, 2005 at 10:16:08PM +0100, Martin Ebourne wrote:
> volume onto the new disk. Now pvmove is stuck at 75.1% and refuses to
> progress any further:
 
Diagnostics required:
  lvs -av
  dmsetup info -c
  dmsetup table
  dmsetup status

Alasdair
-- 
agk@redhat.com

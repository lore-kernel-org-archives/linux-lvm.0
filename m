Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3MKhOD5012377
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 21:43:24 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FXOwu-0002Vf-JQ
	for linux-lvm@redhat.com; Sat, 22 Apr 2006 21:43:24 +0100
Date: Sat, 22 Apr 2006 21:43:24 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Another XFS + LVM2 snapshots problems
Message-ID: <20060422204324.GE4809@agk.surrey.redhat.com>
References: <003f01c66616$de010400$0100a8c0@inspiron>
	<20060422180104.GD4809@agk.surrey.redhat.com>
	<20060422195644.GF15564@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060422195644.GF15564@percy.comedia.it>
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

On Sat, Apr 22, 2006 at 09:56:44PM +0200, Luca Berra wrote:
> is there a documented compatibility matrix between dm driver version and
> device-mapper library version?
 
The general rule is that the version of libdevmapper should be at
least as new as the latest one available at the time when the upstream
kernel you're using was released.  And lvm2 should normally be at
least as new as libdevmapper.

In brief, new libdevmappers will normally work with older kernels, but
new kernels won't necessarily work with older libdevmappers, though
incompatibilities are rare.  When possible, we add support for kernel
changes to the userspace tools some time before the features
themselves hit the upstream kernel to allow time for the new tools to
propagate.  (A current example is dm mirror block_on_error support.)

Alasdair
-- 
agk@redhat.com

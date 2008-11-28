Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mASFdv4T024694
	for <linux-lvm@redhat.com>; Fri, 28 Nov 2008 10:39:57 -0500
Received: from mail.linbit.com (nudl.linbit.com [212.69.162.21])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mASFdfYL012309
	for <linux-lvm@redhat.com>; Fri, 28 Nov 2008 10:39:42 -0500
Received: from soda.linbit (office.linbit [86.59.100.100])
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id C6B582E0520F
	for <linux-lvm@redhat.com>; Fri, 28 Nov 2008 16:39:40 +0100 (CET)
Date: Fri, 28 Nov 2008 16:39:40 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: Re: [linux-lvm] XFS_freeze and LVM
Message-ID: <20081128153940.GI18698@barkeeper1-xen.linbit>
References: <OFEEAC56CA.4D4B448B-ONC125750E.00300773-C125750E.00305B8E@lippi.fr>
	<E3E8DACD-916F-4A20-AE40-535AE1373326@idmedia.com>
	<alpine.LNX.1.10.0811271006200.27683@bernoulli.globalphasing.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LNX.1.10.0811271006200.27683@bernoulli.globalphasing.com>
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Thu, Nov 27, 2008 at 10:28:05AM +0000, Peter Keller wrote:
> Hi,
>
> IIRC sometime around 2005 developments in LVM meant that using xfs_freeze 
> before creating a snapshot became the wrong thing to do. See the entry in 
> the changelog for revision 0.15 of the LVM how-to at  
> http://tldp.org/HOWTO/LVM-HOWTO/ . You will probably find that 
> authoritative recommendations to use xfs_freeze relate to versions of LVM 
> from before this time. (Please correct me if I am wrong about this, 
> someone.)
>
> Also bear in mind that filesystem transactions do not correspond to 
> database (i.e. MySQL) transactions. To get a reliable backup using a 
> snapshot you may need to allow uncommitted database transactions to 
> complete or roll back while preventing new ones from being started, then 
> take the snapshot. Oracle has a way of doing this that doesn't need the 
> database to be completely shut down, but I have no experience with MySQL 
> so I can't be more specific.

at some stage lvm/devicemapper started to do the freeze implicitly
(on file systems that support freeze), and somewhen in between I think
there was a deadlock on "double freeze" (some long time ago).
maybe that is what you see.

on "modern" systems, it should work either way, with or without the
explicit freeze (as long as you don't try to freeze your root fs,
probably).

for mysql and (innodb) transaction safety, yes,
it is enough to use (writeable) snapshots.

however, iirc, you better do a "FLUSH TABLES WITH READ LOCK" (which may
take a long time, as it waits for all pending statements to complete),
then create the snapshot (which implicitly also freezes/unfreezes the
fs), and "UNLOCK TABLES" again.

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD� and LINBIT� are registered trademarks of LINBIT, Austria.

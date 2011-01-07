Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p0719cei002933
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2011 20:09:38 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p0719Rr6019164
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2011 20:09:28 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p0719Rgu012199
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2011 20:09:27 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p0719QCZ014909
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2011 20:09:26 -0500
Date: Thu, 6 Jan 2011 20:09:26 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D25EAB4.6050606@cfl.rr.com>
Message-ID: <Pine.LNX.4.64.1101061943130.14845@bmsred.bmsi.com>
References: <581831.19828.qm@web39308.mail.mud.yahoo.com>
	<Pine.LNX.4.64.1101051343590.3928@bmsred.bmsi.com>
	<413157.10262.qm@web39310.mail.mud.yahoo.com>
	<4D25EAB4.6050606@cfl.rr.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] snapshot pools, lvm roadmap
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 6 Jan 2011, Phillip Susi wrote:

> On 1/5/2011 3:56 PM, Brian Neu wrote:
> > servers.  I've written some cron scripts that take and release lvm
> > snapshots on a schedule, but compared to the Volume Shadow Copy of NTFS
> > that Microsoft released 
> > in 2003, it's just cumbersome and basic.  We're approaching 8 years without
> > a comparable response.  I'm just rather shocked when thinking about it.
> 
> rsync-backup?

I'm not sure what "Volume Shadow Copy" actually does, but we use DRBD (Data
Replicating Block Device) to remotely mirror block devices - which could be
marketed as "Volume Shadow Copy".  

On local 1000BT lan, it supports transparent migration of Virtual Machines
between servers.  (Shared iSCSI is more often used for the purpose in an
enterprise, but DRBD is great for the poor man.)  

Remotely, it sends all block devices updates to a remote backup server - if
updates overwhelm the buffer, it switches to "sync" mode, then goes back to
sending all updates.

DRBD 8.3 comes with Fedora and with Centos-5.5 in the "extras" repository (and
presumably with EL5.5 also).  I see Debian and Ubuntu mentioned a lot in
support forums.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

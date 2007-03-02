Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l22B4hG7020128
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 06:04:43 -0500
Received: from homer.panici.net (homer.panici.net [207.234.145.200])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l22B4ggQ009412
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 06:04:42 -0500
Received: from homer.panici.net (localhost.localdomain [127.0.0.1])
	by homer.panici.net (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l22B4dBj028433
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 11:04:39 GMT
Received: (from paddy@localhost)
	by homer.panici.net (8.13.4/8.13.4/Submit) id l22B4ZSo028424
	for linux-lvm@redhat.com; Fri, 2 Mar 2007 11:04:35 GMT
Date: Fri, 2 Mar 2007 11:04:35 +0000
From: paddy@panici.net
Subject: Re: [linux-lvm] partition table needed for lvm ?
Message-ID: <20070302110435.GC23934@homer.panici.net>
References: <20070301171425.30ktkd2oroo4cco0@www.mail.yale.edu>
	<20070301231907.GG3319@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070301231907.GG3319@agk.surrey.redhat.com>
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
To: linux-lvm@redhat.com

On Thu, Mar 01, 2007 at 11:19:07PM +0000, Alasdair G Kergon wrote:
> On Thu, Mar 01, 2007 at 05:14:25PM -0500, Chris Hunter wrote:
> > Do I reallly need to make partition tables on all my disks to use lvm2 ?
>  
> Other packages such as the installer like to have them.

surely this is more to do with booting than anything else ?

It certainly used to be the case that the recommended and intended
primary use of LVM was using whole physical volumes (ie: a entire 
hard disk, say /dev/hde rather than /dev/hde1) as PVs (hence the name!)

note that using disks in this way is not the same as not having
partitions on your *boot* volume.

is redhat really so broken ? surely not!

Regards,
Paddy

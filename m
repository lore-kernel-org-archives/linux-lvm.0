Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i68Esw010629
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2004 10:54:58 -0400
Received: from server.echohome.org (s233-64-29-217.try.wideopenwest.com
	[64.233.217.29])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i68EsqXn011210
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2004 10:54:52 -0400
Received: from echohome.org (localhost [127.0.0.1])
	by server.echohome.org (8.11.6/linuxconf) with ESMTP id i68Eskv25936
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2004 10:54:46 -0400
Message-ID: <1043.64.233.217.29.1089298486.squirrel@64.233.217.29>
In-Reply-To: <1089297779.9242.19.camel@case.mps.ohio-state.edu>
References: <1089297779.9242.19.camel@case.mps.ohio-state.edu>
Date: Thu, 8 Jul 2004 10:54:46 -0400 (EDT)
Subject: Re: [linux-lvm] lvm and renaming of drives
From: "Erik Ohrnberger" <Erik@server.echohome.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: Erik@server.echohome.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

> very brief characteristics:
>   large fileserver
>   RHEL v3 AS (2.4.21-based kernel)
>
> I have a large RAID device on an external SCSI chain.  Currently the 2
> drives I've carved out of this device are /dev/sdj and /dev/sdk.
> Whenever I add a new drive to the internal SCSI chain on the machine the
> external devices drive letters increment (1 new internal -> /dev/sdk and
> /dev/sdl).  My question is, if I make /dev/sdk a physical volume what
> happens when I add a new internal drive?  Will LVM recognize that
> /dev/sdk is now /dev/sdl and activate the volume group/logical volumes
> without any problem?  I assume this isn't a problem with DM and 2.6, but
> I'm not there yet.
>
> Thanks,
> Tim
>
>
> --

<snip>

IMHO: I think you should do an volumn group export, add the drive, and
then a volumn group import.  I think that this is needed to make sure that
the LVM service finds the volume set again, after the device letters are
bumped.

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0UKo8s6013829
	for <linux-lvm@redhat.com>; Fri, 30 Jan 2009 15:50:08 -0500
Received: from mail.systemheld.net (brain.systemheld.net [91.198.114.35])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0UKnnsP002958
	for <linux-lvm@redhat.com>; Fri, 30 Jan 2009 15:49:49 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.systemheld.net (Postfix) with ESMTP id 9687833A4F
	for <linux-lvm@redhat.com>; Fri, 30 Jan 2009 21:49:46 +0100 (CET)
Received: from mail.systemheld.net ([127.0.0.1])
	by localhost (mail.systemheld.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CDpW0klatZCj for <linux-lvm@redhat.com>;
	Fri, 30 Jan 2009 21:49:45 +0100 (CET)
Received: from [192.168.178.38] (pD9ED379B.dip0.t-ipconnect.de
	[217.237.55.155]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: lists-mario-eckl)
	by mail.systemheld.net (Postfix) with ESMTP id 3894933801
	for <linux-lvm@redhat.com>; Fri, 30 Jan 2009 21:49:27 +0100 (CET)
Message-Id: <682C30CE-D69E-4726-8BE4-40037E7C84F7@mario-eckl.de>
From: Mario Eckl <lists@mario-eckl.de>
In-Reply-To: <20090129075521.GB9988@lupe-christoph.de>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v930.3)
Subject: Re: [linux-lvm] lvcreate --mirror, specifying multiple PVs per copy
Date: Fri, 30 Jan 2009 21:48:48 +0100
References: <20090129075521.GB9988@lupe-christoph.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

Am 29.01.2009 um 08:55 schrieb Lupe Christoph:

> Hi!
>
> I'm still integrating mirrored LVM volumes in our configuration
> management system, and the most recent challenge is a volume that is
> explicitly placed by specifying the PVs the original, the mirror  
> copies,
> and the mirror log reside on.
>
> lvcreate builds a mirrored volume OK that requires multiple segments  
> per
> copy when you let it determine where to place the segments. But this  
> is
> not acceptable when you have disks that are located in different
> locations for fault tolerance = you must be sure that all the segments
> of a copy reside on disks in a single location.
>
> The manpage or the command help for lvcreate do not specify the
> algorithm that is used in picking the PVs lvcreate uses for the mirror
> copies or the mirror log.
>
> I tried "lvcreate --mirror 1 ... testvg PV0a,PV0b PV1a,PV1b PV2" but
> that does not work...
>
> Please advise. Thank you!
> Lupe Christoph
> -- 
> | There is no substitute for bad design except worse  
> design.                   |
> | / 
> me 
>                                                                           |
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

Hi!

You can force LVM to place the mirror log on a specific volume like  
this:

   lvcreate -m 1 -n <lv_name> -L <size> testvg /dev/<pv0> /dev/<pv1> / 
dev/<pv-log>:0

The :0 "forces" lvcreate to use only one extent on the specified  
volume, which is not enough for the two mirror legs and only leaves  
the log volume as a possibility (if the size of the logical volume is  
bigger than the extent size).


I hope this helps.

// Mario

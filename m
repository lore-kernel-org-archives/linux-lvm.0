Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9SHZ8V27752
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 13:35:08 -0400
Received: from volumehost.com
	(IDENT:bMWu+SkI6I8DgEcqrmFxyp6EqoFP0flU@adsl-69-154-123-201.dsl.fyvlar.swbell.net
	[69.154.123.201])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9SHZ2tw021305
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 13:35:07 -0400
Received: from volumehost.com (localhost.localdomain [127.0.0.1])
	by volumehost.com (8.12.8/8.12.5) with ESMTP id j9SHYuUN008331
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 12:34:56 -0500
Received: (from apache@localhost)
	by volumehost.com (8.12.8/8.12.8/Submit) id j9SHYu5Z008329
	for linux-lvm@redhat.com; Fri, 28 Oct 2005 12:34:56 -0500
Message-ID: <1130520895.4362613f9fc02@webmail.volumehost.com>
Date: Fri, 28 Oct 2005 12:34:55 -0500
From: Zac Slade <krakrjak@volumehost.com>
Subject: Re: [linux-lvm] Problem with lvm2 and softwareraid
References: <43623017.7080906@evva.com>
In-Reply-To: <43623017.7080906@evva.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Quoting Johannes Ullmann <j.ullmann@evva.com>:

> Hello!
> 
> I'm building a backup to disk system and i have strange problem with lvm 
> on top of 2 software raid 5 devices.
> Each SW Raid-5 has 7x400GB HDDs (=2,4TB). On top of these two SW Raid 
> devices I created one big LV with 4,8TB.
> I use Reiserfs as filesystem. I worked fine while the disk usage was 
> below 1,5TB, above that, the Filesystem was destroyed. I tried the same 
> with ext3 and had the same results.  So I't not the Filesystem. I also 
> checked the Softwareraid and the LV for any Problems but i haven't found 
> anything.
> After reading many Mails/howtos/man-pages I quess that LVM can't handle 
> PV's which are larger than 2TB is this correct?
> I haven't found anything in the documentation about the maximum PV size.

Yes and No.  There was a max pv size.  If you use metadata format for version 1
it has a hard limit of 2 TiB for a pv size.  Using metadata format version 2 it
is an unsigned long int so the max pv size is 4 exabytes in length.  If you feel
that the pv size is holding you back you can force metadata version 2 when you
execute pvcreate (e.g. pvcreate -M1 for metadata version 1 or pvcreate -M2 for
metadata version 2).
 
> thanks for any help.

I hope that helps.  I can't imagine it actually being in reiser so I'd try
recreating the pvs.

Zac Slade
krakrjak@volumehost.com


-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/

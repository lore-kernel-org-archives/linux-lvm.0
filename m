Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9BEPsYe010525
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 10:25:54 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.10])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9BEPcS9022635
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 10:25:39 -0400
Message-ID: <4CB31DDC.5040206@johestephan.de>
Date: Mon, 11 Oct 2010 16:23:24 +0200
From: =?ISO-8859-1?Q?J=F6rg_Stephan?= <ml@johestephan.de>
MIME-Version: 1.0
References: <4CB2C290.7040307@johestephan.de>	<Pine.LNX.4.64.1010110838020.25038@bmsred.bmsi.com>	<4CB30A1B.8040609@johestephan.de>
	<Pine.LNX.4.64.1010110918570.25121@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1010110918570.25121@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Lvm Strange Problem
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


> I believe your problem is with your SAN, not LVM (you did mention using iSCSI).
> I'm talking about SAN snapshots, not LVM snapshots (although the SAN server 
> could very well use LVM underneath).  The SAN volumes have no names, just
> LUNs.  At boot, they are searched for a matching UUID, just like directly
> attached physical volumes.  When taking a SAN snapshot (clone), the UUID
> of the clone is the same as the original, whether a filesystem or VG is
> on the SAN LUN.
>
>   

Okay, but we dont use SAN snapshots, we use an lvcreate --snapshot on
the client. So the storage just dont know about them.

What happens is, we lv snapshot a volume, mount it copy the data to the
new volume we create after snapshooting the source, remove the old
snapshot and turning of the new machine. It rans about half an year,
gets stoped, and after it turning on again the lvm data on the iscsi
volume is last cahnged on the 23 februar 2010, even if the snapshot was
made much earlier.

Greets

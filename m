Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9IC8CV26272
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 08:08:12 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.171])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9IC8BBN017046
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 08:08:11 -0400
Message-ID: <4354E55E.8040003@gmx.net>
Date: Tue, 18 Oct 2005 14:06:54 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] xfs_freeze & lvm2
References: <434FB3D0.5010704@hq.vsaa.lv>
In-Reply-To: <434FB3D0.5010704@hq.vsaa.lv>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-xfs@oss.sgi.com

Rich schrieb:
> i am not subscribed, so i would be thankful if i could get a reply with 
> cc. thanks.
> 
> i tried making snapshots of xfs filesystem on lvm2. if xfs was frozen, 
> lvcreate stopped at
> 
>     Suspending space-data
>          dm suspend space-data  N
> 
> issuing xfs_freeze -u allowed the process to continue.
> in this list, Thu, 09 Jun 2005 Klaus Strebel wrote :
> 
> "with LVM2 the XFS filesystem is 'frozen' automaticly on the mount 
> -onouuid,ro ( not quite sure, but probably also for LVM1 ..., think it's 
> in the XFS code ).
> So, forget xfs_freeze."
> 
> as i understand it, consistent copy is created when lvcreate is issued, 
> not when snapshot volume is mounted - is this right ?
As i understood things, no. Mounttime matters ;-) see 
<http://www.tldp.org/HOWTO/LVM-HOWTO/snapshotintro.html> and as example 
<http://www.tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html>.

> if so, shouldn't filesystem also be frozen when a snapshot volume is 
> created ?
... see above ...
> if it actually is done together with snapshot, does this mean that i 
> really can forget about xfs_freeze and just create snapshots ?
> must i specify ro in mount options or is this optional ?
Well, if i'm wrong ( and to be honest, i didn't play around with all the 
stuff for 1 1/2 years now :-( ) somebody might correct me, but if i 
remember postings from linux-xfs mailing list, rw-snapshots with XFS is 
not quite unstable ...

Cheers
Klaus

-- 

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \

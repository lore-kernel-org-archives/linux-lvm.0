Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p05J15ba009727
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 14:01:05 -0500
Received: from web39301.mail.mud.yahoo.com (web39301.mail.mud.yahoo.com
	[66.94.238.168])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id p05J0uc5026346
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 14:00:57 -0500
Message-ID: <4082.44403.qm@web39301.mail.mud.yahoo.com>
References: <581831.19828.qm@web39308.mail.mud.yahoo.com>
Date: Wed, 5 Jan 2011 10:34:15 -0800 (PST)
From: Brian Neu <proclivity76@yahoo.com>
In-Reply-To: <581831.19828.qm@web39308.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

So I'm seeing that this is actually 1 year to the day that Jonathan Brassow 
f/Red Hat wrote that shared snapshots was the current priority.

http://www.redhat.com/archives/linux-lvm/2010-January/msg00012.html

I believe that's the term for what I'm seeking.  Any update?



----- Original Message ----
> From: Brian Neu <proclivity76@yahoo.com>
> To: linux-lvm@redhat.com
> Sent: Wed, January 5, 2011 2:11:16 AM
> Subject: [linux-lvm] snapshot pools, lvm roadmap
> 
>   For many years, I've greatly desired a snapshotting solution which goes  
>above 
>
> and beyond the current lvm features.  I'd love to see the ability  to 
>instantiate 
>
> a storage pool for creating snapshots, with either a  first-in-first-out or 
>even 
>
> some other method for bumping snapshots when the  pool fills up.  The 
> inefficiency of the former style of lvm snapshots  in both space and speed and 

> the cumbersome nature of managing them has kept  me looking for alternatives. 
>  Btrfs isn't quite there yet and may not be  through 2011 or beyond.  zfs-fuse 

> can't seem to act as a volume manager  and I'm having problems with crashes. 
>  Frustrated, I'm turning back to  lvm.
> 
>    So now I'm looking at the lvm wiki and I'm seeing "shared  exception store". 
>
>  Can someone fill me in on the current status of this  effort as the wiki was 
> last updated in May-2009  ?
> 
> Thanks!
> 
> _______________________________________________
> linux-lvm  mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at  http://tldp.org/HOWTO/LVM-HOWTO/
> 

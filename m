Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3723pVK006773
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 22:03:51 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3723nbH010668
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 22:03:49 -0400
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.6/8.13.3) with ESMTP id k3723q0J001920
	for <linux-lvm@redhat.com>; Fri, 7 Apr 2006 04:03:52 +0200
Subject: Re: [linux-lvm] fsck for LVM?
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <OF3B16C5BB.0FB8E06C-ON88257148.007618A5-88257148.0077796C@us.ibm.com>
References: <OF3B16C5BB.0FB8E06C-ON88257148.007618A5-88257148.0077796C@us.ibm.com>
Date: Fri, 07 Apr 2006 04:03:51 +0200
Message-Id: <1144375431.8601.66.camel@pc7.dolda2000.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2006-04-06 at 14:44 -0700, Graham Norris wrote:
> I've got a user complaining that his filesystem in an lv is being
> corrupted. It's not clear whether it is the lv that is corrupted or
> the filesystem, I've not actually seen it in this state. I have seen a
> fsck log from when it is formatted with reiserfs failing though.
> 
> The user says he's tried both reiserfs and ext3 in this lv, and both
> end up corrupted after a period of time (days). Since this user
> obviously has root (or they couldn't format the lv), I have to suspect
> they're breaking their own filesystem. They, OTOH, seem to think it is
> LVM's fault and want me to fix it.
> 
> Is there something which can be run on an LVM setup to verify its
> integrity in much the same way as fsck is used on file systems? I've
> used vgck, vgscan, vgdisplay, lvscan, lvdisplay, pvscan and pvdisplay
> on the various pieces, and can see no problems. I've also scanned the
> physical disk the pv lives on and that shows no problems either.

If I were you, I would firstly go about checking the physical integrity
of the hard drives themselves, and run memtest86 on the system (if it's
a PC, that is). Also, did you check the logs for any kernel messages
about it (filesystem warnings, etc.)?

That might just be me, though. Someone else might have a real idea. :)

Fredrik Tolf

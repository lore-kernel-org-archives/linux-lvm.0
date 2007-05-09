Received: from [172.16.44.152] (friday.brisbane.redhat.com [172.16.44.152])
	by pobox.brisbane.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l497E4KA027363
	for <linux-lvm@redhat.com>; Wed, 9 May 2007 17:14:05 +1000
Message-ID: <464174BC.1050809@gmail.com>
Date: Wed, 09 May 2007 17:14:04 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't use LVM1 VG/LVs under LVM2; LV xxx: inconsistent
	LE count 32 != 64
References: <4641541D.2010709@opendreams.net>
In-Reply-To: <4641541D.2010709@opendreams.net>
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

Jesse Molina wrote:
> 
> I'm having a problem getting a Debian system from Linux kernel 2.4 to 
> 2.6 due to LVM.  On the 2.4 kernel/LVM1, the VGs and LVs work fine, 
> mount up, and show absolutely no sign of any problem.  However, I can't 
> get the 2.6 kernel/LVM2 to activate the VGs at all.
> 
> I've filed a Debian bug, which has additional information, here;
>     http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=422963
> 
> 
> 
> The interesting error messages under 2.6 include;
> 
>     "LV tmp: inconsistent LE count 32 != 64"
>     
>     "System ID sorrows1107837513 on /dev/sdd3 differs from 
> sorrows1107837515 for volume group"
> 
> Notice how the LE count is about half of what it should be (reports 32, 
> but is actually 64).  These LVs are striped across the two disks, thus 
> two 32 LE stripes in each PV that make up the VG upon which this LV exists.
> 
> Bad error checking, or actual problem?  I don't know.
> 
> 
> 
> This person seems to have had the same problem, though he had four stripes;
>     http://www.redhat.com/archives/linux-lvm/2006-October/msg00109.html
> 
> I originally reported this problem roughly eight months ago, with no 
> resolution or response;
>     http://www.redhat.com/archives/linux-lvm/2006-September/msg00010.html
> 
> 
> 
> Help?

You need a newer version of lvm2 (> 2.02.21). The problem has only been 
fixed recently.

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=232397

Dave

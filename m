Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAK2mwr24552
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 21:48:58 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.195])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAK2mrLs028312
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 21:48:53 -0500
Received: by wproxy.gmail.com with SMTP id 71so91277wra
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 18:48:48 -0800 (PST)
Message-ID: <add80778041119184857078553@mail.gmail.com>
Date: Fri, 19 Nov 2004 21:48:48 -0500
From: David Aquilina <dwaquilina@gmail.com>
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
In-Reply-To: <1100917096.4379.92.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1100857645.13422.99.camel@grma-lap>
	<1100888487.4379.9.camel@tesuji.nac.uci.edu>
	<20041119192447.GB10969@nile.gs.washington.edu>
	<1100909625.4379.51.camel@tesuji.nac.uci.edu>
	<20041120002207.GK3139@polop.usc.edu>
	<1100914586.4379.75.camel@tesuji.nac.uci.edu>
	<20041120020807.GP3139@polop.usc.edu>
	<1100917096.4379.92.camel@tesuji.nac.uci.edu>
Reply-To: David Aquilina <dwaquilina@gmail.com>,
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 19 Nov 2004 18:18:16 -0800, Dan Stromberg
<strombrg@dcs.nac.uci.edu> wrote:
> Since the Redhat purchase, my understanding is that this previous
> roadmap has been scrapped, and there are no longer any immediate plans
> to raise the GFS filesystem size limit from 2 terabytes to 16 terabytes
> - in which case, you can pretty much just use NFS, unless you're stuck
> with small disks or low density servers.  :)

As far as I understand it, right now RHEL3's 2.4 kernel is the cause
of the 2TB hard limit. Once everything moves to RHEL4/2.6, you should
be able to get significantly higher than the current limit, especially
on AMD64 hardware.

I could be completely wrong, though. 

-- 
David Aquilina, RHCE
dwaquilina@gmail.com

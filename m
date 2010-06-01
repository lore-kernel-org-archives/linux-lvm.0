Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o51DstkL019424
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2010 09:54:55 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o51DsjUW003901
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2010 09:54:45 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1OJRvK-00012C-2X
	for linux-lvm@redhat.com; Tue, 01 Jun 2010 06:54:34 -0700
Date: Tue, 01 Jun 2010 08:54:29 -0500
From: Ray Morris <support@bettercgi.com>
References: <A7A5455753145049A5860984ED9BFF5627598C6F19@GVW0547EXC.americas.hpqcorp.net>
	<AANLkTim3bctwpuF8_dEKt_Y66cWn7SK2Zmg78S2Z4YHh@mail.gmail.com>
In-Reply-To: <AANLkTim3bctwpuF8_dEKt_Y66cWn7SK2Zmg78S2Z4YHh@mail.gmail.com>
	(from romeo.theriault@maine.edu on Tue Jun  1 08:27:22 2010)
Message-Id: <1275400469.25384.0@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Is it possible to bypass LVM and mount contained
 partition directly?
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
Content-Type: text/plain; charset="utf-8"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> I'll only be able to have one restore at a time happening,
> since almost all our linux vm's have the same named VG's
> and LV's

    Fedora used to by default name the VG for every machine
volgroup001 or something like that.  They then changed to
naming it after the machine, I believe.  You are discovering
one of the reasons why having them all named the same is a
bad idea.  When a SAN is involved, one can of course envision
several other problems limits on future usage.  Your best course
of action may be to eliminate the root cause and rename the
source VGs.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 06/01/2010 08:27:22 AM, Romeo Theriault wrote:
> Hi,
> 
> > �Can you restore these backups to another system? �Such as one  
> designated to do this job?
> 
> Yes, I've thought about this a bit too. The problem that I see with
> this is that I'll only be able to have one restore at a time
> happening, since almost all our linux vm's have the same named VG's
> and LV's and they are on read-only media so I wouldn't be able to
> rename them....
> 
> I've going to have to keeping thinking about this one.
> 
> Thanks for the pointers.
> 
> Romeo
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 

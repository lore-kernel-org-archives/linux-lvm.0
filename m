Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0CL3q6f014017
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2015 16:03:52 -0500
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.163])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0CL3mCK016581
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2015 16:03:50 -0500
Received: from [10.0.0.237] (55d46b55.access.ecotel.net [85.212.107.85])
	by smtp.strato.de (RZmta 36.3 DYNA|AUTH)
	with ESMTPSA id f06bbbr0CL3lS35
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate) for <linux-lvm@redhat.com>;
	Mon, 12 Jan 2015 22:03:47 +0100 (CET)
Message-ID: <54B436B3.7050300@ferienwohnung-altenbeken.de>
Date: Mon, 12 Jan 2015 22:03:47 +0100
From: Max Power <maillists@ferienwohnung-altenbeken.de>
MIME-Version: 1.0
References: <54B24766.4030706@ferienwohnung-altenbeken.de>
	<54B316C3.9040101@tlinx.org>
In-Reply-To: <54B316C3.9040101@tlinx.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] writeback cache not promoting writes
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

Am 12.01.2015 um 01:35 schrieb Linda A. Walsh:
>    I don't know how it interacts in the case you have setup, but
> oflag=direct usually has 'dd' writing to the physical device -- not any
> system
> cache.  I don't know if lvm's cache changes that behavior, but you might
> try it w/o the direct flag?

I tried it without the flag but now its even worse. I got ~33MB/s (slow
drive normally performs 100MB/s and fast drive ~450MB/s).

I understand that 'dd' is not the normal use scenario of a disk. But why
does the caching (with the tunables I set) is making a difference here?
I would expect that with x_threshold and x_adjustment set to 0 there is
no difference between normal fs use and dd.

I read this written by Joe Thornber in this mailing list a few days ago:
> In writeback mode:
>
>    if block is on ssd
>       write to ssd, complete bio once written
>       increment write hit counter
>    else
>       write to origin and complete
>       increment write miss counter

This would explain why I do not see any write hits. I only got
increasing write misses by writing to the drive (even when writing again
to the same blocks). Is there an option to influence the algorithm?

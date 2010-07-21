Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6L00PoB010241
	for <linux-lvm@redhat.com>; Tue, 20 Jul 2010 20:00:26 -0400
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
	[141.2.22.233])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6L00Bn7002098
	for <linux-lvm@redhat.com>; Tue, 20 Jul 2010 20:00:15 -0400
Received: from smtpauth.cluster.uni-frankfurt.de ([10.2.22.4]
	helo=smtpauth3.rz.uni-frankfurt.de)
	by mailout.rz.uni-frankfurt.de with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.71) (envelope-from <sven@whgl.uni-frankfurt.de>)
	id 1ObMjK-0000DS-UH
	for linux-lvm@redhat.com; Wed, 21 Jul 2010 02:00:10 +0200
Received: from [141.2.119.133]
	by smtpauth3.rz.uni-frankfurt.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.71) (envelope-from <sven@whgl.uni-frankfurt.de>)
	id 1ObMjH-0003Pr-S1
	for linux-lvm@redhat.com; Wed, 21 Jul 2010 02:00:07 +0200
From: Sven Eschenberg <sven@whgl.uni-frankfurt.de>
In-Reply-To: <8d484f4cdfc15abe7047be252b5396d4.squirrel@ssl.verfeiert.org>
References: <8d484f4cdfc15abe7047be252b5396d4.squirrel@ssl.verfeiert.org>
Date: Wed, 21 Jul 2010 02:00:04 +0200
Message-ID: <1279670404.2452.55.camel@Koma-Station.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM/Devicemapper kernel level breakage?
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

Follow up:

This behavior occurs with kernel 2.6.34.1 - with 2.6.33.5 I do not see
this irrational behavior. Though the flush threads pop up in top
regularly, they 'only' eat up 1-2% of CPU for the system. Should this go
to LKML?

Regards

-Sven


On Sun, 2010-07-18 at 21:18 +0200, Sven Eschenberg wrote:
> Hi list, I am having difficulties with one of my boxes.
> 
> Mainly this:
> 
>   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
>  2262 root      20   0     0    0    0 R   25  0.0 836:51.10 flush-253:2
>  2363 root      20   0     0    0    0 R   25  0.0 838:28.16 flush-253:6
>  2364 root      20   0     0    0    0 R   25  0.0 916:14.92 flush-253:4
>  2365 root      20   0     0    0    0 R   25  0.0 855:02.50 flush-253:1
>  2362 root      20   0     0    0    0 R   23  0.0 916:14.92 flush-253:5
>  3090 root      20   0     0    0    0 R   23  0.0 853:27.24 flush-253:3
> 
> I was wondering what these flush processes are, I could determine they are
> kernel based threads (as far as I can see).
> Since they are called  flush, I'd asume they have to do with flushing
> buffers or whatsoever, so I came to the conclusion, that the numbers might
> be major:minor pairs.
> 
> Using lvs, I get:
> 
>   LV          KMaj KMin
>   Root        253  1
>   home        253  3
>   var         253  2
>   usr         253  5
>   usr.portage 253  4
>   www         253  6
> 
> And I certainly do not believe that there should be flush proceses hogging
> the CPU 24/7, and al those threads belong to logical volumes, or devie
> mapper devices (there are more, with a little les cpu time created by
> kpartx).
> 
> Is this a known bug? Any recommendation what to do?
> 
> Regards
> 
> -Sven
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

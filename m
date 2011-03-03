Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p230PJ36000731
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 19:25:19 -0500
Received: from a.mx.bartk.us
	(173-10-122-205-BusName-Washington.hfc.comcastbusiness.net
	[173.10.122.205])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p230P8Og008764
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 19:25:08 -0500
Received: from [131.107.0.94] (tide524.microsoft.com [131.107.0.94])
	by a.mx.bartk.us (Postfix) with ESMTP id D390ECE05B6
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2011 16:25:07 -0800 (PST)
Message-ID: <4D6EDFE0.2040905@bartk.us>
Date: Wed, 02 Mar 2011 16:25:04 -0800
From: Bart Kus <me@bartk.us>
MIME-Version: 1.0
References: <4D6EA3EF.1070401@bartk.us>
	<4D6EA4E6.9040201@abpni.co.uk>	<4D6EC275.6070009@bartk.us>
	<4D6ECC25.8010502@redhat.com>
	<20110302174412.06eecd67@bettercgi.com>
In-Reply-To: <20110302174412.06eecd67@bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Tracing IO requests?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 3/2/2011 3:44 PM, Ray Morris wrote:
>>> On 3/2/2011 12:13 PM, Jonathan Tripathy wrote:
>>> I know the IO is only being caused by a "cp -a" command, but the
>>> issue is why all the reads?  It should be 99% writes.
> cp has to read something before it can write it elsewhere.

Ray, my bad, I should have specified, the cp reads from a different 
volume/set of drives.

Thanks for the systemtap tip, Dave!

--Bart

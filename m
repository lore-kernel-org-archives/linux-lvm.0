Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m78GTuMu009565
	for <linux-lvm@redhat.com>; Fri, 8 Aug 2008 12:29:56 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m78GTda2020918
	for <linux-lvm@redhat.com>; Fri, 8 Aug 2008 12:29:39 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e34.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m78GTYep016023
	for <linux-lvm@redhat.com>; Fri, 8 Aug 2008 12:29:34 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id
	m78GTXfY178370
	for <linux-lvm@redhat.com>; Fri, 8 Aug 2008 10:29:33 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m78GTXuq008781
	for <linux-lvm@redhat.com>; Fri, 8 Aug 2008 10:29:33 -0600
Received: from malahal.beaverton.ibm.com (malahal.beaverton.ibm.com
	[9.47.17.130])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m78GTX4S008746
	for <linux-lvm@redhat.com>; Fri, 8 Aug 2008 10:29:33 -0600
Date: Fri, 8 Aug 2008 09:29:32 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] tps for block device vs lvm device
Message-ID: <20080808162932.GA12253@us.ibm.com>
References: <f9d530070808071804s36f55963y504cdf0ccd73f00b@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9d530070808071804s36f55963y504cdf0ccd73f00b@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I believe, that is due to bio vs request. LVM/DM block devices receive
and use bio requests where as sdX uses requests (which are coalesced
from these bio's using elevator algorithms). So the actual disk
transactions would be fewer.

--Malahal.

unlisted [unlisted@gmail.com] wrote:
>    Why would I see 50x the amount of transactions on the lvm volume vs the
>    actual underlying block device ?
> 
>    avg-cpu:  %user   %nice %system %iowait  %steal   %idle
>               0.00    0.00   11.41   57.07    0.00   31.51
>    Device:            tps    MB_read/s    MB_wrtn/s    MB_read    MB_wrtn
>    sda             211.33         0.00        56.12          0        113
>    sdb             268.47        63.05         0.00        128          0
>    dm-0          14365.52         0.00        56.11          0        113
>    dm-1              0.00         0.00         0.00          0          0
>    sdc               0.00         0.00         0.00          0          0
>    211 tps versus 14365 tps.  The box is idle and the following command was
>    running:
> 
>    dd if=/dev/sdb of=/home/xxxxxxx/bigrandomfile.txt bs=4k count=10000000
>    Sam

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

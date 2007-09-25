Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8PFDmOv030525
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 11:13:48 -0400
Received: from shuttlerun.csg.stercomm.com (scidalsmtp02.csg.stercomm.com
	[204.214.3.25])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8PFDlq9000483
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 11:13:48 -0400
Message-ID: <46F925A3.4060306@stercomm.com>
Date: Tue, 25 Sep 2007 10:13:39 -0500
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Overhead
References: <1C8CF1EA1A5B5940B81B0710B2A4C9381DF6018911@an-ex.ActiveNetwerx.int>	<46F7D242.3030707@stercomm.com>	<46F7D49A.2090206@wpkg.org>	<46F7E720.4060304@stercomm.com>
	<46F7E839.8040805@stercomm.com> <46F7F955.7070608@wpkg.org>
In-Reply-To: <46F7F955.7070608@wpkg.org>
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

Tomasz Chmielewski wrote:
> Chris Cox schrieb:
...
>> I check my local drives, they all use the default 1024....
>> Is setting the read ahead that big of a deal with just LVM?
>> I would think if it's an issue, it's an issue everywhere.
> 
> For me, the default was 256.
> 
> I use that big readahead after a bit of benchmarking; perhaps it's very
> specific to my setup.
> 
> 

Oh... I didn't say it wouldn't benefit, I just know in my case
it's not a HUGE win... but it is significant, significant enough
for me to want to experiment with the values and doing some
benchmarking.

256?  Whoa... that seems really low.


-- 
Chris Cox
Sr. Unix Sys Admin

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8NDmnr11288
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 09:48:49 -0400
Received: from fluellen.viermetz.net (dsl-082-083-204-152.arcor-ip.net
	[82.83.204.152])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8NDmgJV000378
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 09:48:42 -0400
Received: from [192.168.0.176] (gower [192.168.0.176]) (authenticated bits=0)
	by fluellen.viermetz.net (8.12.11/8.12.11) with ESMTP id i8NDmXNH007181
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 15:48:35 +0200
Message-ID: <4152D431.6080202@viermetz.net>
Date: Thu, 23 Sep 2004 15:48:33 +0200
From: Maximilian Viermetz <maximilian@viermetz.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM
References: <5EA812BF44E06D4B818A8EEEDDE12B7F4127F9@EX2BEL86MBX02>
In-Reply-To: <5EA812BF44E06D4B818A8EEEDDE12B7F4127F9@EX2BEL86MBX02>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Johan.SEGERS@cec.eu.int wrote:

> Hi,
>
> How can i know if my Linux uses LVM1 or LVM2. I run Red hat Linux 9 
> (kernel 2.4.9-e.3)..
>
> Best regards, Johan
>
>------------------------------------------------------------------------
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
Do a 'pvscan'. The output shows the version of lvm for each volume found.


Maximilian Viermetz

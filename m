Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qBDB7dUY027871
	for <linux-lvm@redhat.com>; Thu, 13 Dec 2012 06:07:40 -0500
Received: from itoolabs.net (be01.de01.itoolabs.net [188.40.74.239])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBDB7cb0027134
	for <linux-lvm@redhat.com>; Thu, 13 Dec 2012 06:07:38 -0500
Received: from [92.239.81.7] (account dop@itoolabs.co.uk HELO [192.168.16.3])
	by be01-de01.itoolabs.net (CommuniGate Pro SMTP 5.3.10)
	with ESMTPSA id 1240838 for linux-lvm@redhat.com;
	Thu, 13 Dec 2012 11:07:37 +0000
Message-ID: <50C9B6F8.2090105@yahoo.co.uk>
Date: Thu, 13 Dec 2012 11:07:36 +0000
From: Dmitry Panov <dmitry.panov@yahoo.co.uk>
MIME-Version: 1.0
References: <50C90FC1.4060803@yahoo.co.uk> <50C9A838.3080709@redhat.com>
In-Reply-To: <50C9A838.3080709@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] clvmd on cman waits forever holding the P_#global
 lock on node re-join
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
To: linux-lvm@redhat.com


On 13/12/12 10:04, Zdenek Kabelac wrote:
>
>
> Hmmm this rather looks like a logical problem either in
> the if() expression in (select_status == 0) branch,
> or somehow 'magical' gulm fix applied in 2005 for add_to_lvmqueue()
> should be running not just when message arrives.
>
> Both patches seems to be not fixing the bug, but rather trying to go 
> around broken logic in the main loop - it will need some thinking.
>

There are 2 bugs actually: one causes the timeout to occur and another 
causes it not to be handled. My patch clearly fixes the latter. As for 
the former, it needs some thinking indeed.


Best regards,

-- 
Dmitry Panov

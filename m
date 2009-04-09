Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n39AvoS2012160
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 06:57:50 -0400
Received: from oceanic.CalvaEDI.COM (oceanic.CalvaEDI.COM [81.252.197.184])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n39AvUIL008340
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 06:57:31 -0400
Received: from f.baltic (baltic.CalvaEDI.COM [192.168.6.66])
	(authenticated (0 bits))
	by oceanic.CalvaEDI.COM (8.11.1-20030923/8.11.1/6.31) with ESMTP id
	n39AvTr02451
	(using TLSv1/SSLv3 with cipher RC4-MD5 (128 bits) verified NO)
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 12:57:30 +0200 (CEST)
Message-ID: <49DDD499.50303@Calva.COM>
Date: Thu, 09 Apr 2009 12:57:29 +0200
From: John Hughes <john@Calva.COM>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid
	10"? >>> Use HARDWARE RAID CONTROLLERS
References: <49DCA275.8070203@Calva.COM> <49DDA10D.3070005@awerner.homeip.net>
In-Reply-To: <49DDA10D.3070005@awerner.homeip.net>
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

Axel Werner wrote:
> Why you need RAID 10 at all ?
Because my data is important to me, and I need it quickly.
> Usualy because the need of performance and additiona redundancy/fault 
> tollerance.
> So if u need performance a "Software RAID Solution" would always be a 
> bad choice.
Why?  Do you have any benchmarks that show that software raid is slower 
than hardware raid?

Anyway, still doesn't answer my question.

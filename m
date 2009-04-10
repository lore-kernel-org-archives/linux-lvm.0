Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3A8Qcp6026265
	for <linux-lvm@redhat.com>; Fri, 10 Apr 2009 04:26:38 -0400
Received: from oceanic.CalvaEDI.COM (oceanic.CalvaEDI.COM [81.252.197.184])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3A8QJpS011072
	for <linux-lvm@redhat.com>; Fri, 10 Apr 2009 04:26:20 -0400
Received: from f.baltic (baltic.CalvaEDI.COM [192.168.6.66])
	(authenticated (0 bits))
	by oceanic.CalvaEDI.COM (8.11.1-20030923/8.11.1/6.31) with ESMTP id
	n3A8QFr22591
	(using TLSv1/SSLv3 with cipher RC4-MD5 (128 bits) verified NO)
	for <linux-lvm@redhat.com>; Fri, 10 Apr 2009 10:26:16 +0200 (CEST)
Message-ID: <49DF02A7.50606@Calva.COM>
Date: Fri, 10 Apr 2009 10:26:15 +0200
From: John Hughes <john@Calva.COM>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid
	10"?
References: <49DCA275.8070203@Calva.COM>
In-Reply-To: <49DCA275.8070203@Calva.COM>
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

John Hughes wrote:
>                if (lp->stripes > 1) {
>                        log_error("mirrors and stripes are currently "
>                                  "incompatible");
>                        return 0;
>                }
>
> Should I just stick with mdadm for my mirroring and striping needs?
So, ignoring the hijacking of this thread by people proposing hardware 
solutions, the answer is "nobody who knows reads this list"?

Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n39AmITG007968
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 06:48:18 -0400
Received: from pluto.sivell.com (z-t3.aifi.com [65.112.245.198])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n39AlvdC003188
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 06:47:58 -0400
Received: from [192.168.235.17] ([192.168.235.17]) (authenticated bits=0)
	by pluto.sivell.com (8.13.1/8.13.1) with ESMTP id n39AnvqQ019958
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 05:49:58 -0500
Message-ID: <49DDD257.5050702@sivell.com>
Date: Thu, 09 Apr 2009 05:47:51 -0500
From: Vu Pham <vu@sivell.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Stripe array
References: <ffa0f8300904082347k5e977b92hffb20c85a83a9a8@mail.gmail.com>
In-Reply-To: <ffa0f8300904082347k5e977b92hffb20c85a83a9a8@mail.gmail.com>
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


Tejas Sumant wrote:
> Hi There,
> 
> How to interpret this array in LVM metadata? Especially what does 50
> mean in data sturcture below?
> 				stripes = [
> 					"pv0", 50
> 				]

IIRC, it means the corresponding LV has only one stripe and starts at 
the physical extend 50 of the physical volume pv0.

Vu

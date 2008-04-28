Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3SGQJ9F011790
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:26:19 -0400
Received: from smtp03.atlngahp.sys.nuvox.net (smtp-out3.atlngahp.sys.nuvox.net
	[70.43.63.20])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3SGQ5cc021414
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:26:06 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp03.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3SGPwd4023086
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:25:59 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id CA1202834E0
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:25:58 -0400 (EDT)
Message-ID: <4815FA96.1090302@Media-Brokers.com>
Date: Mon, 28 Apr 2008 12:25:58 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to move /usr from LVM back to non-LVM?
References: <4814E782.9080805@Media-Brokers.com> <4815553F.5030806@free.fr>
In-Reply-To: <4815553F.5030806@free.fr>
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

On 4/28/2008, Georges Giralt (georges.giralt@free.fr) wrote:
> But some people will question the reason you will move from LVM to 
> plain filesystem/partitioning.... 

Good point... and maybe my reason is not a 'good one'... ;)

My thinking is, since /usr is a critical system partition, it should be 
on the main system drive - which I always set up as a simple 2 drive mirror.

So, I'm now curious how/what other people generally use LVM for?

-- 

Best regards,

Charles

Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7FImRjD015582
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 14:48:27 -0400
Received: from smtp-01.arnet.com.ar (smtp-01.arnet.com.ar [200.45.191.24])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k7FImKtI018430
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 14:48:21 -0400
Message-ID: <44E21600.4070804@arnet.net.ar>
Date: Tue, 15 Aug 2006 15:44:16 -0300
From: German Staltari <gstaltari@arnet.net.ar>
MIME-Version: 1.0
Subject: Re: [linux-lvm] expanded volume
References: <44E1AB70.8080702@arnet.net.ar>	<20060815114516.GA16285@cobalt0.panici.net>	<44E1B9DB.3030403@arnet.net.ar>
	<20060815153034.GA4048@cobalt0.panici.net>
In-Reply-To: <20060815153034.GA4048@cobalt0.panici.net>
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

paddy wrote:
> Another possibility might be to move LEs from one disk to the
> other.  can pvmove be used to do this ? Was your filesystem
> formatted with a stripe-size option (and how much does it 
> matter) ?
>   
I'll give that a try. Thanks.
BTW, It's possible to move physical extents online (wihtout unmonting 
the filesystem)?
What it's faster? copy files at FS level? or move physical extents? 
(It's a TB FS and would be great to do it as faster as we could)
Thanks again
German

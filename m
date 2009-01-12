Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0C9XrAU008078
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2009 04:33:53 -0500
Received: from exodus.loho.co.uk (exodus.loho.co.uk [193.33.187.10])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0C9WdZZ020651
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2009 04:32:40 -0500
Received: from localhost (localhost [127.0.0.1])
	by exodus.loho.co.uk (Postfix) with ESMTP id 7952F6E802C
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2009 09:32:39 +0000 (GMT)
Received: from exodus.loho.co.uk ([127.0.0.1])
	by localhost (exodus.loho.co.uk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oyMoEb5TCnH2 for <linux-lvm@redhat.com>;
	Mon, 12 Jan 2009 09:32:37 +0000 (GMT)
Received: from [192.168.169.2] (unknown [192.168.169.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alex.brett@loho.co.uk)
	by exodus.loho.co.uk (Postfix) with ESMTP id 0FFA76E802B
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2009 09:32:37 +0000 (GMT)
Message-ID: <496B0E34.8080404@alexbrett.net>
Date: Mon, 12 Jan 2009 09:32:36 +0000
From: Alex Brett <alex@alexbrett.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Strange PV metadata issue
References: <496A8D96.9030209@alexbrett.net>
In-Reply-To: <496A8D96.9030209@alexbrett.net>
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

Alex Brett wrote:
> I assume what's happened (I'm no expert in lvm at all, so a lot of this
> is guessing) is that when I (stupidly) ran pvresize on the disk before
> rebooting, it somehow created this second metadata area, which the mkfs
> of my new LV overwrote in some way.
> 
> Looking at the LVs that exist and their stripes, I'm fairly sure that
> this metadata area is *inside* the new 500G LV that I created, since
> that shows up as:
> 
>                         segment1 {
>                                 start_extent = 0
>                                 extent_count = 128000   # 500 Gigabytes
> 
>                                 type = "striped"
>                                 stripe_count = 1        # linear
> 
>                                 stripes = [
>                                         "pv0", 128000
>                                 ]
>                         }
> which obviously seems wrong to me!
> 
> Can anybody suggest a way of dealing with this - can I manually edit the
> data on the partition to remove any reference to this second metadata
> area some how? Ideally I'd copy all the data off, and start from
> scratch, but unfortunately I don't have enough storage space to do that!
> 

For anybody interested - I managed to fix this by forcing the pvcreate
with -ff, specifying only 1 metadata copy (not sure if I needed this bit
or not) and then a vgcfgrestore did the trick - all seems happy now :)

Alex

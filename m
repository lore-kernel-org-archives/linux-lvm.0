Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u69H9eIg029192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 9 Jul 2016 13:09:41 -0400
Received: from vm04-mail01.alteeve.ca (mail.alteeve.ca [65.39.153.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5D02C00DDF0
	for <linux-lvm@redhat.com>; Sat,  9 Jul 2016 17:09:38 +0000 (UTC)
Received: from pulsar.alteeve.ca (unknown [72.64.152.130])
	by vm04-mail01.alteeve.ca (Postfix) with ESMTPSA id 5BDC0E04F3
	for <linux-lvm@redhat.com>; Sat,  9 Jul 2016 13:00:12 -0400 (EDT)
References: <20160708155231.GA27423@bdmcc-us.com>
From: Digimer <lists@alteeve.ca>
Message-ID: <fc811677-56eb-ca28-d8a3-605ee72fe287@alteeve.ca>
Date: Sat, 9 Jul 2016 13:00:12 -0400
MIME-Version: 1.0
In-Reply-To: <20160708155231.GA27423@bdmcc-us.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Copying a raw disk image to LVM2
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 08/07/16 11:52 AM, Brian McCullough wrote:
> 
> I have been hunting for some time over the past couple of days, and find
> several documentss that talk about converting from an LVM2 volume to a
> raw disk image for Xen, but nothing about the reverse.
> 
> I have a VHD disk file that I would like to put on to an LVM2 volume,
> like my other DomU guests.
> 
> I can see using dd, but am concerned about overwriting the LVM2 header.
> 
> 
> Does anybody have any suggestions?

I've done this with KVM before just fine. The LV metadata won't be
overwritten when you write to the actual LV. So this would work fine;

dd if=/path/to/image.raw of=/dev/vg0/lv_foo bs=4M; sync

Then just change your server's definition to point at the LV instead of
the raw file and voila.

-- 
Digimer
Papers and Projects: https://alteeve.ca/w/
What if the cure for cancer is trapped in the mind of a person without
access to education?

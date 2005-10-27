Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9RGDfV20398
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2005 12:13:41 -0400
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9RGDdwA009515
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2005 12:13:40 -0400
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id 4CECD2552C
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2005 10:13:11 -0600 (MDT)
Date: Thu, 27 Oct 2005 10:13:10 -0600
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] Resizing LVM Revisited
Message-ID: <71EF4685E87CEDB097D1851A@dhcp-2-206.wgops.com>
In-Reply-To: <43609147.7090205@snow.email.ne.jp>
References: <43609147.7090205@snow.email.ne.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

For 2.4 kernels (2.4.20 and later) we've always used ReiserFS and had 
extremely good results with online/hot expansion on top of LVMs.  We use 
ext3 for our static os/boot areas but all of our data areas, and since 
we're using debian, that's just /var, and maybe /home, reside on LVM + 
ReiserFS.

--On October 27, 2005 5:35:19 PM +0900 Mark Sargent 
<powderkeg@snow.email.ne.jp> wrote:

> Hi All,
>
> to resize a LV in CentOS4.0, I had to use the 1st install CD and Linux
> Rescue. I then had to umount /mnt/sysimage/dev, /mnt/sysimage/proc,
> /mnt/sysimage/boot, /mnt/sysimage/sys before I could umount
> /mnt/sysimage. After doing this, I lose the commands, vgscan, lvscan and
> resize2fs. Why is this, and how can I get around it.? Cheers.
>
> Mark Sargent.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler

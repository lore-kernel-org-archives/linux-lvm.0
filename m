Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j43E07O25085
	for <linux-lvm@redhat.com>; Tue, 3 May 2005 10:00:07 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.199])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j43E00gv014436
	for <linux-lvm@redhat.com>; Tue, 3 May 2005 10:00:00 -0400
Received: by wproxy.gmail.com with SMTP id 68so2040781wra
	for <linux-lvm@redhat.com>; Tue, 03 May 2005 06:59:55 -0700 (PDT)
Message-ID: <472d4b25050503065924417838@mail.gmail.com>
Date: Tue, 3 May 2005 08:59:55 -0500
From: David Mohr <squisher@gmail.com>
Subject: Re: [linux-lvm] will pvcreate destroy lvm data on an already exsiting
	PV
In-Reply-To: <4273DCF5.3030905@ruckusnetwork.com>
Mime-Version: 1.0
Content-Disposition: inline
References: <4273DCF5.3030905@ruckusnetwork.com>
Content-Transfer-Encoding: 8bit
Reply-To: david@mcbf.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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

I'm just a listener on this list and by no means an expert on this:
should my memory not fail me, then pvcreate on an existing PV should
be safe to run. I think the reason why noone answers you is because
you really should read through the archive and probably some howto's,
I'm pretty sure I've seen this question a couple of times on this
list. Noone likes to give answers that have already been given a
couple of times.

~David

On 4/30/05, Lance Reed <lreed@ruckusnetwork.com> wrote:
> I know you guys don't normally respond to direct email about LVM.
> 
> But I have a situation that the PV in a VG seems to have lost its
> metadata, and
> there is a discrepancy between What the OS thinks the partition for a
> device that uses
> LVM is and what LVM thinks it should be (/dev/sde vs /dev/sde1).  A
> vgrestore complains
> about pv_read not working.  So my question is, if I run a new pvcreate
> on the disk device,
> will it destroy the LVM data on the existing device.  Or will it just
> setup a placeholder for
> the metadata, and I can then just do a vgcgrestore and put that back in
> place without
> losing data.
> 
> Thanks for any suggestions and your time.
> 
> Sincerely,
> 
> Lance Reed
> lreed@ruckusnetwork.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

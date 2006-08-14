Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7EMbQ3B016830
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 18:37:26 -0400
Received: from cobalt0.panici.net (cobalt0.panici.net [207.234.248.139])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7EMb4FW022830
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 18:37:04 -0400
Received: (from padski@localhost)
	by cobalt0.panici.net (8.10.2/8.10.2) id k7EMau418801
	for linux-lvm@redhat.com; Mon, 14 Aug 2006 23:36:56 +0100
Date: Mon, 14 Aug 2006 23:36:56 +0100
From: paddy <paddy@panici.net>
Subject: Re: RE: [linux-lvm] LVM2 on hardware RAID
Message-ID: <20060814223654.GD11767@cobalt0.panici.net>
References: <73A8ABE78537AE4E9DB1D70863B8275F0330CD7F@exchange2k.lims.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73A8ABE78537AE4E9DB1D70863B8275F0330CD7F@exchange2k.lims.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Aug 11, 2006 at 03:37:29PM -0400, Musil, William wrote:
> Thank you Greg, that was exactly what I needed. I was looking at pvextend. My
> mistake.
> I can now create another lv in the resized vg. Thanks again.

William, I'm really glad you got a result.

I dont' have a pvresize or a pvextend, what version are you guys using ?

Regards,
Paddy
-- 
Perl 6 will give you the big knob. -- Larry Wall

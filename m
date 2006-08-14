Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7EKtZ1Y024695
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 16:55:35 -0400
Received: from cobalt0.panici.net (cobalt0.panici.net [207.234.248.139])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7EKtXn6025905
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 16:55:33 -0400
Received: (from padski@localhost)
	by cobalt0.panici.net (8.10.2/8.10.2) id k7EKtSL06955
	for linux-lvm@redhat.com; Mon, 14 Aug 2006 21:55:28 +0100
Date: Mon, 14 Aug 2006 21:55:25 +0100
From: paddy <paddy@panici.net>
Subject: Re: [linux-lvm] LVM2 on hardware RAID
Message-ID: <20060814205510.GA30880@cobalt0.panici.net>
References: <73A8ABE78537AE4E9DB1D70863B8275F0330CD7C@exchange2k.lims.com>
	<000e01c6bd7c$14ef4fa0$640a0a0a@laptopoptimus>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000e01c6bd7c$14ef4fa0$640a0a0a@laptopoptimus>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

On Fri, Aug 11, 2006 at 03:26:44PM -0400, Greg Hartzog wrote:
> I believe you will do the following:
> 
> "pvresive /dev/sdb"

You can imagine how silly I felt when I read this :-)

I originally was going to reply with a mail which just said "pvresize?",
but then I thought I'd just have a quick look at the manual page, so
I shelled into a handy etch box, only to discover that it doesn't
have a pvresize.  And then I vaguely remembered how there are indeed
bits of the symetry missing that would be quite nice to have, and
how pvresize was one of those(?).

Have you got a pvresize? has one recently been added? where does William
get it from?

Regards,
Paddy
-- 
Perl 6 will give you the big knob. -- Larry Wall

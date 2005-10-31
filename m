Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j9V2gLvl024939
	for <linux-lvm@redhat.com>; Mon, 31 Oct 2005 02:42:21 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EWPcr-0002Va-RI
	for linux-lvm@redhat.com; Mon, 31 Oct 2005 02:42:21 +0000
Date: Mon, 31 Oct 2005 02:42:21 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvresize patch pending
Message-ID: <20051031024221.GA26394@agk.surrey.redhat.com>
References: <1130518796.4362590c75cf0@webmail.volumehost.com>
	<20051028170130.GH11086@agk.surrey.redhat.com>
	<1130519874.43625d4253324@webmail.volumehost.com>
	<1130522152.436266287429e@webmail.volumehost.com>
	<20051028192752.GJ11086@agk.surrey.redhat.com>
	<436286B3.80604@cantab.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <436286B3.80604@cantab.net>
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

On Fri, Oct 28, 2005 at 09:14:43PM +0100, Zak Kipling wrote:
> Indeed. I've recently been working on an implementation myself 
> (primarily because I wanted to grow a live PV on my own system), which 
> I've attached in its current (somewhat rough, but seemingly working) 
> state as a patch against CVS HEAD.
 
I've merged this into CVS - we can finish testing it there alongside
the other development going on at the moment.

Alasdair
-- 
agk@redhat.com

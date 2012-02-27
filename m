Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1RKeWk1022832
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2012 15:40:32 -0500
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1RKeVaY014092
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2012 15:40:31 -0500
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPSA id 2894C21025
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2012 14:40:30 -0600 (CST)
Date: Mon, 27 Feb 2012 14:40:29 -0600
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120227144029.49ebea1a@bettercgi.com>
In-Reply-To: <CAOAgVpyHgVjaubZGH3kwfBqiYyU7vBNCBHmQjPMnrT_F6otZbQ@mail.gmail.com>
References: <20120221102932.19eb3218@bettercgi.com>
	<CAOAgVpyfEApbLRFr1-s6UvAsa8yO0MSOcYDgPWXBv2FRoD+Ntg@mail.gmail.com>
	<5dd15783-9200-4ed0-b746-32a812210f77@email.android.com>
	<CAOAgVpyHgVjaubZGH3kwfBqiYyU7vBNCBHmQjPMnrT_F6otZbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] mirror_region_size default: 4096 six times faster
 than 512?
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

> copying chunks of a few MBs seems to always beat copying
> > bytes or KB per chunk.

> What kind of RAID?  Anything that involves parity is going to require
> small writes to read and merge the new data into blocks and rewrite
> the parity.

At least mdadm RAID1  and RAID5.  Hardware raid5 was slow with 512,
but not yet tested with 4096 or higher. I'll test it in a few days 
after a migration completes.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Fri, 24 Feb 2012 09:57:30 -0600
Les Mikesell <lesmikesell@gmail.com> wrote:

> On Thu, Feb 23, 2012 at 10:46 AM, Ray Morris <support@bettercgi.com>
> wrote:
> > 512 byte sector consumer SATA drives from Seagate and Hitachi.
> > Drives attached to a 9560 RAID card exhibited more difference than
> > drives in a different system attached to the motherboard directly.
> > As I mentioned, I haven't done extensive or highly scientific
> > testing, but in general, across various hardware using various
> > software, copying chinks of a few MBs seems to always beat copying
> > bytes or KB per chunk.
> 
> 
> What kind of RAID?  Anything that involves parity is going to require
> small writes to read and merge the new data into blocks and rewrite
> the parity.
> 

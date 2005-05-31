Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j4VDprhf011086
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 14:51:53 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Dd79t-0001I0-Lz
	for linux-lvm@redhat.com; Tue, 31 May 2005 14:51:53 +0100
Date: Tue, 31 May 2005 14:51:53 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] deadlock on snapshot creation;
	any way out without a reboot?
Message-ID: <20050531135153.GW15809@agk.surrey.redhat.com>
References: <20050531110414.GP686@strugglers.net>
	<20050531130024.GV15809@agk.surrey.redhat.com>
	<20050531132812.GT686@strugglers.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050531132812.GT686@strugglers.net>
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

On Tue, May 31, 2005 at 01:28:12PM +0000, Andy Smith wrote:
> Name             Maj Min Stat Open Targ Event  UUID
> mainvg-admindata 254  42 LIsw    2    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4cCHdlPbllQNt50aJANhLrqbjUkK7jCsP

>   LV                    VG     #Seg Attr   LSize   Maj Min KMaj KMin Origin            Snap%  Move Copy%  LV UUID
>   admindata             mainvg    1 -wi-so   5.86G  -1  -1 254  42                                        cCHdlP-bllQ-Nt50-aJAN-hLrq-bjUk-K7jCsP

So admindata has no snapshots, but it is suspended with an 'inactive' table loaded
indicating  some operation got interrupted.

Try:
  lvchange --refresh mainvg/admindata

This should reload 'mainvg-admindata' to match the configuration in the lvm2 metadata.

Alasdair
-- 
agk@redhat.com

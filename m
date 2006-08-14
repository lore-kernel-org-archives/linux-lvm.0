Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7ENkUvt027951
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 19:46:30 -0400
Received: from cobalt0.panici.net (cobalt0.panici.net [207.234.248.139])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7ENkO4S005402
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 19:46:24 -0400
Received: (from padski@localhost)
	by cobalt0.panici.net (8.10.2/8.10.2) id k7ENkHA27783
	for linux-lvm@redhat.com; Tue, 15 Aug 2006 00:46:18 +0100
Date: Tue, 15 Aug 2006 00:46:15 +0100
From: paddy <paddy@panici.net>
Subject: Re: [linux-lvm] LVM2 on hardware RAID
Message-ID: <20060814234537.GF11767@cobalt0.panici.net>
References: <73A8ABE78537AE4E9DB1D70863B8275F0330CD7F@exchange2k.lims.com>
	<20060814223654.GD11767@cobalt0.panici.net>
	<44E0FFE7.6070202@cantab.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44E0FFE7.6070202@cantab.net>
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

On Mon, Aug 14, 2006 at 11:57:43PM +0100, Zak Kipling wrote:
> paddy wrote:
> 
> > I dont' have a pvresize or a pvextend, what version are you guys using ?
> 
> pvresize should be in 2.02.00 and later, according to WHATS_NEW.
> 
> I'm puzzled that you can't find it in etch (testing) though, since
> (according to packages.debian.org) it has 2.02.06 -- and the files list
> for the package includes /lib/lvm-200/pvresize. Sarge (stable), however,
> only has 2.01.04 which won't have pvresize.

ok, turns out I have 2.01.04-5 on that box.  I looked at packages.debian.org
and I agree that's what it says, and the developer info says it migrated in 
june ...

ok ... how's this for daft ...

# apt-get update
# dselect select

perhaps if I 'dselect update' ?

(better yet, I'd better get used to aptitude, which is a shame 'cos I like
dselect)

mystery solved.

Thanks!

(I'll go take a look at the code now, see if it's as simple as I thought :-)

Regards,
Paddy
-- 
Perl 6 will give you the big knob. -- Larry Wall

Received: from [10.36.7.58] (vpn1-7-58.ams2.redhat.com [10.36.7.58])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2REVoa7026133
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2012 10:31:50 -0400
Message-ID: <4F71CF55.4020706@redhat.com>
Date: Tue, 27 Mar 2012 16:31:49 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4F6ECF9B.40907@nuclearwinter.com>
	<20120326155540.19c85fe9@bettercgi.com>
In-Reply-To: <20120326155540.19c85fe9@bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM commands extremely slow during raid check/resync
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
To: linux-lvm@redhat.com

Dne 26.3.2012 22:55, Ray Morris napsal(a):
> Put -vvvv on the command and see what takes so long. In our case, 
> it was checking all of the devices to see if they were PVs.
> "All devices" includes LVs, so it was checking LVs to see if they
> were PVs, and activating an LV triggered a scan in case it was 
> a PV, so activating a volume group was especially slow (hours).
> The solution was to use "filter" in lvm.conf like this:
> 
> filter = [ "r|^/dev/dm.*|", "r|^/dev/vg-.*|","a|^/dev/sd*|", "a|^/dev/md*|", "r|.*|" ]
> 
> That checks only /dev/sd* and /dev/md*, to see if they are PVs, 
> skipping the checks of LVs to see if they are also PVs. Since the
> device list is cached, use vgscan -vvvv to check that it's checking 
> the right things and maybe delete that cache first. My rule IS 
> a bit redundant because I had trouble getting the simpler form 
> to do what I wanted. I ended up using a belt and suspenders 
> approach, specifying both "do not scan my LVs" and "scan only
> /dev/sd*".

Could you check upstream  CVS version of lvm2 with 2 extra patches:
(not yet upstream)

https://www.redhat.com/archives/lvm-devel/2012-March/msg00171.html
https://www.redhat.com/archives/lvm-devel/2012-March/msg00172.html

Whether your slow PV operations are solved ?

Zdenek

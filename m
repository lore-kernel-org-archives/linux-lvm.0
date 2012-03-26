Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2QNp9Um008871
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2012 19:51:09 -0400
Received: from titan.nuclearwinter.com (titan.nuclearwinter.com
	[209.40.204.131])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2QNp82x002527
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2012 19:51:08 -0400
Message-ID: <4F7100EC.6070406@nuclearwinter.com>
Date: Mon, 26 Mar 2012 18:51:08 -0500
From: Larkin Lowrey <llowrey@nuclearwinter.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Ray Morris <support@bettercgi.com>

That helped bring the lvcreate time down from 2min to 1min so that's an
improvement.  Thank you.

The source of the remaining slowdown is the writing of metadata to my 4
PVs. The writes are small and the arrays are all raid5 so each metadata
write is also requiring a read. I'm still at a loss for why this was not
a problem when running F15 but the filter is a workable solution for me
so I'll leave it alone.

--Larkin

On 3/26/2012 3:55 PM, Ray Morris wrote:
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

Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2QKth0H007212
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2012 16:55:43 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2QKtgX1005445
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2012 16:55:42 -0400
Date: Mon, 26 Mar 2012 15:55:40 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120326155540.19c85fe9@bettercgi.com>
In-Reply-To: <4F6ECF9B.40907@nuclearwinter.com>
References: <4F6ECF9B.40907@nuclearwinter.com>
Mime-Version: 1.0
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
Cc: llowrey@nuclearwinter.com

Put -vvvv on the command and see what takes so long. In our case, 
it was checking all of the devices to see if they were PVs.
"All devices" includes LVs, so it was checking LVs to see if they
were PVs, and activating an LV triggered a scan in case it was 
a PV, so activating a volume group was especially slow (hours).
The solution was to use "filter" in lvm.conf like this:

filter = [ "r|^/dev/dm.*|", "r|^/dev/vg-.*|","a|^/dev/sd*|", "a|^/dev/md*|", "r|.*|" ]

That checks only /dev/sd* and /dev/md*, to see if they are PVs, 
skipping the checks of LVs to see if they are also PVs. Since the
device list is cached, use vgscan -vvvv to check that it's checking 
the right things and maybe delete that cache first. My rule IS 
a bit redundant because I had trouble getting the simpler form 
to do what I wanted. I ended up using a belt and suspenders 
approach, specifying both "do not scan my LVs" and "scan only
/dev/sd*".
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Sun, 25 Mar 2012 02:56:11 -0500
Larkin Lowrey <llowrey@nuclearwinter.com> wrote:

> I've been suffering from an extreme slowdown of the various lvm
> commands during high I/O load ever since updating from Fedora 15 to
> 16.
> 
> I notice this particularly Sunday AMs when Fedora kicks of a
> raid-check. What is normally near instantaneous, commands like lvs
> and lvcreate --snapshot take minutes to complete (literally). This
> causes my backup jobs to timeout and fail.
> 
> While all this is going on, the various filesystems are reasonably
> responsive (considering the raid-check is running) and I can
> read/write to files without problems. It seems that this slow-down is
> unique to lvm.
> 
> I have three raid 5 arrays of 8, 6, and 6 drives. The root fs sits
> entirely within the 8 disk array as does the spare area used for
> snapshots.
> 
> Interestingly, perhaps, if I can coax a backup into running, the lvs
> command, for example, will complete in just 15-30 seconds instead of
> 120-180s. It would seem that the random I/O of the backup is able to
> break things up enough for the lvm commands to squeeze in.
> 
> I'm at a loss for what to do about this or what data to scan for
> clues. Any suggestions?
> 
> kernel 3.2.10-3.fc16.x86_64
> 
> lvm> version
>   LVM version:     2.02.86(2) (2011-07-08)
>   Library version: 1.02.65 (2011-07-08)
>   Driver version:  4.22.0
> 
> --Larkin
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

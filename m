Date: Fri, 21 Jan 2000 09:01:29 -0600
From: "Heinz J. Mauelshagen" <mge@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] lvm mirroring
Message-ID: <20000121090129.A7348@congo.borg.umn.edu>
Reply-To: mge@ez-darmstadt.telekom.de
References: <38886E0B.78D7FEE2@bct.ericsson.se>
Mime-Version: 1.0
In-Reply-To: <38886E0B.78D7FEE2@bct.ericsson.se>; from sebastian.tomac@bct.ericsson.se on Fri, Jan 21, 2000 at 03:32:43PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Tomac <sebastian.tomac@bct.ericsson.se>
Cc: linux-lvm@msede.com, mge@ez-darmstadt.telekom.de

On Fri, Jan 21, 2000 at 03:32:43PM +0100, Sebastian Tomac wrote:
> Correct me if I'm wrong, but if I read the LVM-0.8 code right there is
> no mirroring  implemented.  Both AIX and Solaris lvm has mirroring
> capabilities (sk. lv copies).

Yes, i know :-)

> 
> If there is interest to enable this feature in LVM, I  would be prepared
> to start working on it.
> 
> Let me know...

Great offer.
Thanks a lot!

What about metadata (VGDA) mirroring as well?
IMO this is necessary too, because data mirroring is not usefull if
we get rid of our metadata which will lead to unaccessable data anyway.

Could you provied your concept ideas?

Regards,
Heinz

Message-ID: <3875F3DE.9B79A0C2@msede.com>
Date: Fri, 07 Jan 2000 15:10:38 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: andrea@suse.de
MIME-Version: 1.0
Subject: [linux-lvm] Fwd: Re: file system size limits
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded to the list ...

-------- Original Message --------
Date: Fri, 7 Jan 2000 13:34:20 +0100 (CET)
Resent-Date: Fri, 07 Jan 2000 15:07:52 MEZ
From: Andrea Arcangeli <andrea@suse.de>
X-Sender: andrea@alpha.random
To: Manfred Spraul <manfreds@colorfullife.com>
cc: "Theodore Y. Ts'o" <tytso@MIT.EDU>, linux-LVM@msede.com,
        Andi Kleen <ak@muc.de>, linux-fsdevel@vger.rutgers.edu
Subject: Re: file system size limits

On Fri, 7 Jan 2000, Manfred Spraul wrote:

>eg it seems that lvm doesn't contain the checks for lvm's > 2 TB on
>32-bit platforms.

Actually lvm has real issues as well. When the real issues will gets
fixed
we'll add the avoid-admin-to-do-silly-things checks too :).

Andrea

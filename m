From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200001071520.QAA12318@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Fwd: Re: file system size limits
In-Reply-To: <3875F3DE.9B79A0C2@msede.com> from Michael Marxmeier at "Jan 7, 2000  3:10:38 pm"
Date: Fri, 7 Jan 2000 16:20:29 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: andrea@suse.de
Cc: tytso@MIT.EDU, linux-lvm@msede.com, ak@muc.de, linux-fsdevel@vger.rutgers.edu, manfreds@colorfullife.com

> Forwarded to the list ...
> 
> -------- Original Message --------
> Date: Fri, 7 Jan 2000 13:34:20 +0100 (CET)
> Resent-Date: Fri, 07 Jan 2000 15:07:52 MEZ
> From: Andrea Arcangeli <andrea@suse.de>
> X-Sender: andrea@alpha.random
> To: Manfred Spraul <manfreds@colorfullife.com>
> cc: "Theodore Y. Ts'o" <tytso@MIT.EDU>, linux-LVM@msede.com,
>         Andi Kleen <ak@muc.de>, linux-fsdevel@vger.rutgers.edu
> Subject: Re: file system size limits
> 
> On Fri, 7 Jan 2000, Manfred Spraul wrote:
> 
> >eg it seems that lvm doesn't contain the checks for lvm's > 2 TB on
> >32-bit platforms.
> 
> Actually lvm has real issues as well. When the real issues will gets
> fixed
> we'll add the avoid-admin-to-do-silly-things checks too :).
> 
> Andrea
> 

Absolutely.
I'm only checking the limits in the, because the 32bit restriction in the
block devive layer forces me to do that.

Heinz

-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

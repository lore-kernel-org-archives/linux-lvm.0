Message-Id: <199908281640.AA06167@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] LVM and devices
Date: Sat, 28 Aug 1999 18:36:36 METDST
In-Reply-To: <19990827234020.A11073@cyberhqz.com>; from "Ryan Murray" at Aug 27, 99 11:40 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rmurray@cyberhqz.com
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> On Fri, Aug 27, 1999 at 09:37:13PM +0000, Heinz Mauelshagen wrote:
> > Run vgscan and VGs should be o.k. again.
> 
> If your /dev is 16-aligned...Please make sure that device skipping
> "optimization" is removed before being submitted to Linus!

Yes.

As you say it below:
it is a matter of userspace and _not_ kernelland.

So, Linus doesn't have to care.

I've already thrown it away in upcoming 0.8.

> 
> (although that is a user-space thing that wouldn't actually go to
> Linus...)
> 

Regards,
Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

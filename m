Message-Id: <199904121654.AA05665@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] LVM on Sparc-linux 2.2.4
Date: Mon, 12 Apr 1999 18:54:15 METDST
In-Reply-To: <19990329140718.57465@doit.wisc.edu>; from "jleu@doit.wisc.edu" at Mar 29, 99 2:07 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jleu@doit.wisc.edu
Cc: mge@u9ete.ez-darmstadt.telekom.de, linux-lvm@msede.com

Sorry for the late answer.
I'm back the first day after vacation 8*)

> 
> Has anyone tries LVM on SPARC-linux kernel 2.2.4?
> 

Not me ;*)

I'll try to bring some patches for the recent kernels online
next days... (i'm still on 2.2.3)

> I applied that patch, but the LVM option didn't show up in 
> the menu config.  I tried adding the appropriate defines to .config
> but I'm not sure if that worked.
> 
> When I run vgscan it says:
> 
> vgscan -- invalid i/o protocol version
> 
> Anyone else see this?
> 

Please try patch <ftp://linux.msede.com/lvm/v0.6/lvm_0.6-patch-15031999a.gz>
to fix this.


Regards,
Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

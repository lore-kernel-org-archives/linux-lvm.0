From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002090200.DAA21639@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Library strangeness
In-Reply-To: <38A0C594.DC58EC3B@msede.com> from Michael Marxmeier at "Feb 9, 2000  2:40:36 am"
Date: Wed, 9 Feb 2000 03:00:07 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Michael Marxmeier <mike@msede.com>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> James Pattinson wrote:
> > I think this could be the offending line, from tools/Makefile:
> > 
> > XLINKER = -Xlinker -rpath $(TOP)/tools/lib -Xlinker -rpath /lib -Xlinker
> 
> I agree that the default option in the tools/Makefile should be
> linking with /lib/liblvm.so.
> 
> The additional rpath is helpful during development but as LVM 
> is now delving in a user environment  this should no longer be the
> default option.
> 
> > Perhaps -rpath $(TOP)/tools/lib needs to be /after/ the rest?
> 
> No. This defeats the purpose: Build a new library and have all
> tools use it (overriding the installed one) without having to
> install a development library.
> 
> The -rpath $(TOP)/tools/lib should not be part of the default
> build options.
> 

Agreed.
Template already changed.

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

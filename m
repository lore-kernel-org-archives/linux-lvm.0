From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200003151643.RAA27423@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] LVM - Grundlagen
Date: Wed, 15 Mar 2000 17:43:36 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com
Cc: mge@ez-darmstadt.telekom.de

> Hello LVM-Gurus,
> i'm new to lvm and to this list. I looked through the faq but couldent
> find the answer there.
> 
> I'd like to use lvm in a productive enviroment. (so i would need a 2.2.x
> - Kernel)
> I could not find the combination of lvm-version and kernel which works
> satisfying, so  i would need your help.
> 
> Following some questions: 
> Which is the preferd lvm-version to use?

For 2.2.x use the tarball and the corresponding patch at
<ftp://linux.msede.com/lvm/v0.8pre/> _including_ the changes mentioned in
the BUGS file.

> Which kernel should be used along with that?

Up to 2.2.14.

> 
> are there any patches recomended?

Only the LVM kernel patch in the above directory in case you
don't use SuSE 6.3 which already has it in the kernel.

> 
> Is there any draw-backs in this combination or anything to know about?
> 

Not so far ;-{)

> I tried arround with kernel 2.2.13. and lvm0.8pre. Using the
> lvm-commands produced coredumps in a great number.

As i mentioned above: add the changes described in the BUGS file.

> 
> Thanks for your suggestions
> 
> Markus 
> 
> 
> Markus Schreier
> ORDIX AG
> 

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

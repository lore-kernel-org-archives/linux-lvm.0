Message-Id: <199907011140.AA22229@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] vgscan -- invalid i/o protocol version
Date: Thu, 01 Jul 1999 13:35:57 METDST
In-Reply-To: <Pine.LNX.4.10.9906301639130.2611-100000@fuse.aethos.co.uk>; from "James Pattinson" at Jun 30, 99 4:42 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jamesp@aethos.co.uk
Cc: mge@u9ete.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> Anyone seen this error msg before?
> 
> I'm running RH6 with kernel 2.2.10 and the LVM patches applied. I
> originially tried to follow the HOWTO but on the first command i got:
> 
> pvcreate -- ERROR: "/etc/lvmtab" doesn't exist; please run vgscan

Have you patched lvm_0.6-1503199a.gz into the 0.6 LVM source tree?

> 
> so i ran vgscan and got the message in the subject line. It's possible I'm
> being really thick and I don't really know what I'm doing. Do I need the
> devfs patches too?
> 
> I'm new to lvm-on-linux but I love it on HP-UX.
> 

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

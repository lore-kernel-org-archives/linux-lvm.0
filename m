From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002111520.QAA14409@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Patch request 2.3.43
In-Reply-To: <Pine.LNX.4.10.10002110106250.16702-200000@greebo.jj.net> from James Pattinson at "Feb 11, 2000  1:11:39 am"
Date: Fri, 11 Feb 2000 16:20:54 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: James Pattinson <jamesp@subdimension.com>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> Hi -
> 
> Just tried applying patch-2.3.40-LVM-0.8i to 2.3.43 and it don't work:
> 
> [root@greebo][linux]# patch -p1 -s --dry-run < /root/patch-2.3.40-LVM-0.8i 
> 2 out of 3 hunks FAILED -- saving rejects to
> Documentation/Configure.help.rej
> 4 out of 10 hunks FAILED -- saving rejects to
> drivers/block/ll_rw_blk.c.rej
> [root@greebo][linux]#
> 
> Ok so I don't care /too/ much about Configure.help but I guess ll_rw_blk.c
> is kind of important! *g*
> 
> I had a look at the reject file (attached, if anyone cares) and it looks
> like some of it could be redundant stuff anyway. However given the amount
> of changes between 2.3.40 and 2.3.43 perhaps a new merge needs to be done!

Yes, give me a chance at the weekend ;-{)

Heinz

> 
> Cheers!
> 
> James
Content-Description: 

[Attachment, skipping...]


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

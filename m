Message-Id: <199904251902.AA03482@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] vgscan & vgchange -a y location in startup scripts
Date: Sun, 25 Apr 1999 21:02:10 METDST
In-Reply-To: <37234DCA.C4B73BC7@geotec.net>; from "Eric Smith" at Apr 25, 99 12:15 (noon)
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Smith <seric@geotec.net>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


<SNIP>

> 
> Thank you SO much.  I appreciate your prompt reply AND your hard work on this
> product!

Thank you!

> One more question:
> 
> To use lvreduce do I still need that Partition Magic file?  I don't believe that
> is going to work
> for me on the Alpha...

No, im' afraid you're right:
it doesn't work on the Alpha because there only is an Intel binary available.

But you don't need it, if you don't run the e2fsadm LVM command.

lvreduce and lvextend work without an installed resize2fs but they _don't_
extend or reduce a contained ext2 fs 8*(

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

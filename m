Message-Id: <199905111334.AA16137@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: [linux-lvm] Re: Raw partitions (volumes) in Linux-LVM?
Date: Tue, 11 May 1999 15:31:00 METDST
In-Reply-To: <8525676E.0046463F.00@USCOMM02.aholdusa.com>; from "David Venus" at May 11, 99 8:50 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dvenus@aholdusa.com
Cc: linux-lvm@msede.com, mge@u9ete.ez-darmstadt.telekom.de

> 
> Hi!
> 
> This is very very cool!
> 

8*)

> Does/will Linux-LVM support raw paritions (volumes)? I know that HP LVM
> did. We are interested in running Oracle Parallel Server (OPS) which
> requires raw volumes (partitions).

This is no special LVM feature but a feature Stephen Tweedie already implemeted.
A patch against plain 2.2.4 kernel is available.

Have a look at <ftp://ftp.uk.linux.org/pub/linux/sct/fs/raw-io/>

It allows you to bind a raw device special to _any_
existing block device including LVM devices.

> 
> Thanks for your time and help on this!
> 

You're welcome.

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

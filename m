From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <199911300000.BAA10588@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] kernel oops.
In-Reply-To: <Pine.A41.4.20.9911291214440.66338-100000@clio.dlib.indiana.edu> from Rusty Wickell at "Nov 29, 1999 12:19:59 pm"
Date: Tue, 30 Nov 1999 01:00:26 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Rusty Wickell <twickell@clio.dlib.indiana.edu>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi Rusty,

please provide stdout/stderr of:

 - pvcreate -d
 - vgcreate -d
 - lvcreate -d


Thanks,
Heinz

> Hello,
> 
> Well, I found that Redhat 6.1 has the updated 1.00 driver for ips
> ServeRaid card. So it should work fine with the lvm code. I am still
> getting the kernel oops when I do a lvcreate though. 
> 
> Is there anything I could be missing? pvcreate and vgcreate work fine,
> just not the lvcreate. I am using the lvcreate on two partitions /dev/sdb1
> and /dev/sdc1 on a hardware raid5 device. 
> 
> Feel free to ask for more info or ask questions.
> 


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

Message-ID: <31A612FE6020D2119F6400A0C9B67EBB116F14@fthw901e.as.fth.sbs.de>
From: Franken Klaus <Klaus.Franken@fth2.siemens.de>
Subject: RE: [linux-lvm] valid_majors
Date: Sun, 27 Feb 2000 22:24:14 +0100
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

> -----Original Message-----
> From: Heinz Mauelshagen [mailto:mauelsha@ez-darmstadt.telekom.de]

> > is there a way to give the list of valid majors at runtime 

> 
> The actual 0.8final code uses /proc/partitions fastening the process
> of scanning, if it exists and falls back to scan /dev if it doesn't.

This sounds good! I will try it next week.

> > Problem: 'vgscan' needs circa 1 hours on a 486 test machine.
> 
> Oops.
> 
> SAP-linuxkernel on 486 ;-{)

Thats my only test machine, really. ;-(



Klaus.Franken@fth2.siemens.de    +49 911 978 3707
Siemens Business Services IP 21F

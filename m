From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002101715.SAA00762@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Recovering a PV VGDA
In-Reply-To: <Pine.LNX.4.10.10002101440220.748-100000@fuse.jj.net> from James Pattinson at "Feb 10, 2000  3:13:16 pm"
Date: Thu, 10 Feb 2000 18:15:25 +0100 (MET)
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
> I had problems last night with one of my 4 disks in my VG. I was trying
> different things and somehow I managed to corrupt the VGDA on on the
> disks. This caused vgscan to fail with an error -154. I'm sorry but I
> forgot the actual text :)

I'll check that.

> 
> I booted into a resuce disk I had with all the LVM tools on it, and I was
> able to run lvmdiscscan etc to see what was going on. I found i was caught
> in a catch 22 situation as I couldn't run vgcfgrestore because it wanted
> me to run vgscan first. I eventually had to restore /etc/lvm* from DAT and
> then I could make vgcfgrestore restore my VGDA to all the disks (as I
> didn't really know which disk was failling!)
> 
> So, what is the best way of doing this kind of work? and also, how would I
> tell what disk is preventing vgscan from working? I tried 'strace'ing it
> but that wasn't very helpful. And of course most of the other vg/pv/lv
> commands were useless as they all wanted me to run vgscan... :)

vgcfgrestore doesn't really need an existing lvmtab 8-(

The tradeoff nevertheless would be to be forced to
run vgscan after vgcfgrestore to get an actual lvmtab.

I'll throw the check away in the next release.

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

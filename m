Message-Id: <199902162219.AA00129@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] User count, general question for all y'all
Date: Tue, 16 Feb 1999 23:17:22 MET
In-Reply-To: <Pine.GHP.4.05.9902161547150.25565-100000@ixion.honeywell.com>; from "Shawn Leas" at Feb 16, 99 3:51 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sleas@ixion.honeywell.com, linux-lvm@msede.com
Cc: mge@ts1.ez-darmstadt.telekom.de

> 
> On Tue, 16 Feb 1999, Heinz Mauelshagen wrote:
> 
> > BTW: i have not been able to test any performance boosts with reiserfs;
> >      reiserfsck is far to slow to be usefull
> 
> Reiser is slower unless you use notails,nopreserve and be careful about
> what blocksize you use. Small files, small blocks.
> 
> I find system time goes up, user time down, overall time spent scribbling
> goes slightly down on average. That really depends on your usage. It
> requires tuning to work well.
> 
> Also, when I had this deadlock, my one mounted reiser LV (what had almost
> no files open) lost MUCH data after a reiserfsck. Practically EVERYTHING
> in every dir. Needless to say, mke2fs /dev/vg00/opt...
> 
> > P.S.: does somebody know about any Linux JFSes available for testing?
> 
> I only know of the LFS projects out there...
> 


Thank you for the information,

i thought there could be other JFS activities being pretty far out there...

IMHO it is a question of 9999 small Linux installations vs. the big one
driving JFSes for Linux coming up ;*)

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

Message-Id: <199910122056.AA00304@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Can't see /dev/hdk1
Date: Tue, 12 Oct 1999 22:55:15 METDST
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

> 
> Michael -- many thanks for the bug fix -- all works really well and I'm
> migrating a number of our disk towers to LVM! Your time much appreciated!
> I guess this will make it into the next release?

Yes.

It's in 0.8.

Regards,
Heinz

> 
> - b
> 
> On Sun, 10 Oct 1999, Michael Marxmeier wrote:
> 
> > Hi Bruce.
> > 
> > > There is no physical hdj* device, as I have kept the disks to one per IDE
> > > channel.  (By the way, if it helps, all drives work fine as stand alone
> > > ext2fs devices, and under md raid).
> > 
> > And that triggers a bug in pv_read_all_pv(). To opmize scan time for 
> > the cluttered /dev directory, pv_read_all_pv() tries to skip all
> > partitions for devices which don't exist.
> > Hover it's done in a wrong way ...
> > 
> > As a quick fix, have a look at lib/pv_read_all_pv.c and
> > modify it as below. The current code tries to skip partitions
> > if the device does not exist. However it blindly skips over the
> > next 15 devices it has found in /dev.
> > 
> > The code should look like:
> > 
> >          if ( ( tst = open ( dev_name, O_RDONLY)) == -1) {
> >             continue;
> > #if 0
> >             if ( MAJOR ( dir_cache[n].st_rdev) != MD_MAJOR &&
> >                  MINOR ( dir_cache[n].st_rdev) % 16 == 0) {
> >                n += 15;
> >                continue;
> >             }
> > #endif
> >          } else close ( tst);
> > 
> > Does this fix your problem?
> > 
> > The correct solution would be to order the dir_cache in major/minor
> > order and skip based on major/minor.
> > 
> > 
> > Hope this helps
> > Michael
> > 
> > -- 
> > Michael Marxmeier           Marxmeier Software AG
> > E-Mail: mike@msede.com      Besenbruchstrasse 9
> > Phone : +49 202 2431440     42285 Wuppertal, Germany
> > Fax   : +49 202 2431420     http://www.msede.com/
> > 
> 
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | Dr. Bruce C. Hewitson                          Ph:  +27 21 650 2878 |
>  | Dept. Environmental & Geographical Sc.         Fax: +27 21 650 3791 |
>  | University of Cape Town, Private Bag, Rondebosch, South Africa 7701 |
>  |      hewitson@egs.uct.ac.za          http://www.egs.uct.ac.za       |
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
> 
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

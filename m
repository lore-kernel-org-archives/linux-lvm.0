From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200001052144.WAA11319@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Re: Preserving LVs (fwd)
Date: Wed, 5 Jan 2000 22:44:37 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

> Hi!
> 
> On Sat, 1 Jan 2000, Heinz Mauelshagen wrote:
> 
> > 
> > Hapy new year Holger.
> > 
> > > Hi!
> > > 
> > > How can I preserve existing LVs (such as the ones used for the
> > > "/usr/local" and "/home" fs) over new installations?
> > 
> > 
> > If you don't touch the disks/partitions where the physical volumes forming
> > the volume group containing your logical volumes reside, just do
> > a vgscan after upgrading/reinstalling Linux (including LVM).
> 
> 
> Well, in the beginning (immediately after an update or a new
> installation) commands like "vgscan" are not available to me, since
> they were delteted during the installation (probably they live under
> /bin, /sbin, /usr/bin, /usr/sbin), and the file system(s) containing
> these directories usually get lost during
> repartitioning/reformatting.

Right (until a distributor puts them on the installation/update
media what SuSE already did).

> As long as I don't have that command
> however, I can most likely not access any file systems that were
> created on a LV (such as /usr/local or /home).

Correct.

> Maybe I have to create
> an initrd image in order to ensure that the commands as well as the
> patched kernel is ALWAYS there and to preserve the /boot file system?

Yep.

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

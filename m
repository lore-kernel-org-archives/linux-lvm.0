From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems with vgimport after software raid initialisation failed.
Message-ID: <20031002155111.E26280@sistina.com>
References: <1064951960.3742.51.camel@carthage> <20031002111114.D26280@sistina.com> <1065092239.2732.48.camel@carthage>
Mime-Version: 1.0
In-Reply-To: <1065092239.2732.48.camel@carthage>; from system.error@gmx.net on Thu, Oct 02, 2003 at 12:57:18PM +0200
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Oct  2 09:03:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Oct 02, 2003 at 12:57:18PM +0200, SystemError wrote:
> Heinz,
> 
> I did as instructed and now I am able to access my 
> precious "datavg" again.
> Thanks a lot Heinz.
> You really saved my day. :-)

Great. Sounds like filesystem backup time now ;)

> 
> I also edited /etc/rc.d/rc.sysinit and commented out all vgscans
> (RedHat does 2 of them), and added a hard coded "vgchange -ay sysvg" in
> order to bring my other VG with the /usr, /var, etc... 
> filesystems online during boot time.
> 
> Immediately after another reboot I tried to activate "datavg" using
> "vgchange -ay datavg"...
> ...which failed.
> Vgchange complained:
> "
> The PVs /dev/md3 and /dev/md4 are not active.
> Please run vgscan.
> "
> (Can't remember the excact error message)
> 
> So I gulped,shrugged and decided that it was time for another 
> cup of coffee...
> When I returned to my desk I ran the vgchange again in order to fetch
> the error message for this email...
> ...et voila:
> "
> [root@athens root]# vgchange -ay datavg
> vgchange -- volume group "datavg" successfully activated
> "
> 
> So I was only able to activate datavg some minutes after my system was
> back up and running ?
> I really don't understand this...
> OK, I am more than just happy to have my data back online, but WHY ?
> Anyone any ideas on this one ?

Sounds like a race to me, where the mds aren't active when vgscan runs.

> 
> Another question:
> Is it save to extend lvs and filesystems right now in 
> this strange situation ?

No, the activation/metadata problems need to get sorted out first.

> 
> Bye
> Lutz Reinegger
> 
> PS: The requested tar archvie is on its way.
> 
> PPS: Again: THANK YOU !!!
> 
> Am Don, 2003-10-02 um 11.11 schrieb Heinz J . Mauelshagen:
> > 
> > Lutz,
> > 
> > looks like you hit some strange LVM on top of MD bug :(
> > 
> > In order to get your VG active again (which of course is your highest
> > priority) and before we analyze the vgscan problem, you want to go for
> > the follwoing workaround (presumably /etc/lvmconf/datavg.conf is the last
> > correct archive of the metadata):
> > 
> > # cp /etc/lvmconf/datavg.conf /etc/lvmtab.d/datavg
> > # echo -ne "datavg\0" >> /etc/lvmtab
> > # vgchange -ay datavg
> > 
> > Warning: the next vgscan run will remove the above metadata again, so avoid
> >          running it for now by commenting it out in your boot script.
> > 
> > So far about firefighting ;)
> > 
> > 
> > For further analysis, please do the following and send the resulting
> > bzip2'ed tar archive containing your metadat to me in private mail
> > <mge@sistina.com>:
> > 
> > # for d in md2 md3 md4 hdf hdh
> > # do
> > #	dd bs=1k count=4k if=/dev/$d of=$d.vgda
> > # done
> > # tar cf Lutz_Reinegger.vgda.tar *.vgda
> > # rm *.vgda
> > # bzip2 Lutz_Reinegger.vgda.tar
> > 
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> > 
> > 
> > 
> > On Tue, Sep 30, 2003 at 09:59:19PM +0200, SystemError wrote:
> > > Hello out there,
> > > 
> > > after I migrating my precious volume group "datavg" from unmirrored
> > > disks to linux software raid devices I ran into serios problems.
> > > (Although I fear the biggest problem here was my own incompetence...)
> > > 
> > > First I moved the data from the old unmirrored disks away, using pvmove.
> > > No Problems so far.
> > > 
> > > At a certain point I had emptied the 2 PVs "/dev/hdh" and "/dev/hdf".
> > > So I did a vgreduce on them, then created a new raid1 
> > > "/dev/md4" (containing both "hdf" and "hdh") and added it to my 
> > > volume group "datavg" using pvcreate(->"/dev/md4") and vgextend.
> > > No Problems so far.
> > > 
> > > Everything looked soooo perfect and so I decided to reboot the system...
> > > 
> > > At this point things started to go wrong, during the boot sequence
> > > "/dev/md4" was not automatically activated and suddenly the PV
> > > "/dev/hdf" showed up in "datavg", "/dev/md4" was gone.
> > > 
> > > Unfortunately I paniced and ran a vgexport on "datavg", fixed the broken
> > > initialisation of "/dev/md4", and rebooted again. 
> > > This was a probably a baaad idea. 
> > > Shame upon me.
> > > 
> > > Now my pvscan looks like this:
> > > "
> > > [root@athens root]# pvscan 
> > > pvscan -- reading all physical volumes (this may take a while...)
> > > pvscan -- ACTIVE   PV "/dev/md2" of VG "sysvg" [16 GB / 10 GB free]
> > > pvscan -- inactive PV "/dev/md3" is in EXPORTED VG "datavg" [132.25 GB /
> > > 0 free]
> > > pvscan -- inactive PV "/dev/md4"  is associated to unknown VG "datavg"
> > > (run vgscan)
> > > pvscan -- WARNING: physical volume "/dev/hdh" belongs to a meta device
> > > pvscan -- inactive PV "/dev/hdf"  is in EXPORTED VG "datavg" [57.12 GB /
> > > 50.88 GB free]
> > > pvscan -- total: 5 [262.97 GB] / in use: 5 [262.97 GB] / in no VG: 0 [0]
> > > "
> > > 
> > > Or with the -u option:
> > > "
> > > [root@athens root]# pvscan -u
> > > pvscan -- reading all physical volumes (this may take a while...)
> > > pvscan -- ACTIVE   PV "/dev/md2" with UUID
> > > "g6Au3J-2C4H-Ifjo-iESu-4yp8-aRQv-ozChyW" of VG "sysvg"        [16 GB /
> > > 10 GB free]
> > > pvscan -- inactive PV "/dev/md3" with UUID
> > > "R15mli-TFs2-214J-YTBh-Hatl-erbL-G7WS4b"  is in EXPORTED VG "datavg"
> > > [132.25 GB / 0 free]
> > > pvscan -- inactive PV "/dev/md4" with UUID
> > > "szAa6A-rNM7-FmeU-6DHl-rKmZ-SePL-IURwtg"  is in EXPORTED VG "datavg"
> > > [57.12 GB / 50.88 GB free]
> > > pvscan -- WARNING: physical volume "/dev/hdh" belongs to a meta device
> > > pvscan -- inactive PV "/dev/hdf" with UUID
> > > "szAa6A-rNM7-FmeU-6DHl-rKmZ-SePL-IURwtg"  is in EXPORTED VG "datavg"
> > > [57.12 GB / 50.88 GB free]
> > > pvscan -- total: 5 [262.97 GB] / in use: 5 [262.97 GB] / in no VG: 0 [0]
> > > 
> > > "
> > > 
> > > A vgimport using "md3"(no probs with this raid1) and "md4" fails: 
> > > "
> > > [root@athens root]# vgimport datavg /dev/md3 /dev/md4
> > > vgimport -- ERROR "pv_read(): multiple device" reading physical volume
> > > "/dev/md4"
> > > "
> > > 
> > > Using "md3" and "hdh" also fails:
> > > "
> > > [root@athens root]# vgimport datavg /dev/md3 /dev/hdh
> > > vgimport -- ERROR "pv_read(): multiple device" reading physical volume
> > > "/dev/hdh"
> > > "
> > > 
> > > It also fails when I try to use "hdf", only the error message is
> > > different:
> > > "
> > > [root@athens root]# vgimport datavg /dev/md3 /dev/hdf
> > > vgimport -- ERROR: wrong number of physical volumes to import volume
> > > group "datavg"
> > > "
> > > 
> > > So here I am, with a huge VG an tons of data in it but no way to access
> > > the VG. Has anybody out there an idea how I can still access
> > > the data of datavg ?
> > > 
> > > By the way: 
> > > I am using RedHatLinux 9.0 with the lvm-1.0.3-12 binary rpm package
> > > as provided by RedHat.
> > > 
> > > Bye
> > > In desperation
> > > Lutz Reinegger
> > > 
> > > PS:
> > > Any comments and suggestions are highly appreciated, even if those
> > > suggestions include the use of hex editors or sacrificing 
> > > caffeine to dark and ancient deities.
> > > ;-)
> > > 
> > > 
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> > *** Software bugs are stupid.
> >     Nevertheless it needs not so stupid people to solve them ***
> > 
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > 
> > Heinz Mauelshagen                                 Sistina Software Inc.
> > Senior Consultant/Developer                       Am Sonnenhang 11
> >                                                   56242 Marienrachdorf
> >                                                   Germany
> > Mauelshagen@Sistina.com                           +49 2626 141200
> >                                                        FAX 924446
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

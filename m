From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgcreate not working
Message-Id: <20020311162953.C13418@sistina.com>
References: <20020310150455.E7514@majestic.ukshells.co.uk>
    <1015773451.4127.1.camel@cr227180-a>
    <20020310153909.F7514@majestic.ukshells.co.uk>
MIME-Version: 1.0
In-Reply-To: <20020310153909.F7514@majestic.ukshells.co.uk>;
    from linux.lvm@codex.net on Sun, Mar 10, 2002 at 03:39:09PM +0000
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
Date: Mon Mar 11 09:32:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Mar 10, 2002 at 03:39:09PM +0000, Vincent AE Scott wrote:
> Laurentiu Simion(lsimion@rogers.com)@Sun, Mar 10, 2002 at 10:17:30AM -0500:
> > What's the output of pvscan?
> > 
> 
> 
> [root@box guest]# pvscan 
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/ide/host2/bus1/target0/lun0/disc" is in no
> VG  [28.63 GB]
> pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/disc" is in no
> VG  [28.63 GB]
> pvscan -- total: 2 [57.26 GB] / in use: 0 [0] / in no VG: 2 [57.26 GB]
> 
> 
> note: i've switched over from using partitions, to entire disks.
> 
> just tried using the long devfs names, as printed above and it works fine!
> argggh.  thats me being dumb.

No, not really.
Need to do something about it, so that LVM can cope with both dev pathes.

Regards,
Heinz    -- The LVM Guy --

> 
> 
> -vince
> /me goes back to hiding in the corner.
> 
> 
> > Laurentiu
> > 
> > On Sun, 2002-03-10 at 10:04, Vincent AE Scott wrote:
> > > 
> > > Hi there,
> > > 
> > > i have a problem with some newly partioned up disks, i've created two
> > > LVM partions on two different disks.  upon executing the following
> > > commands, vgcreate fails:
> > > 
> > > [root@box guest]# pvcreate /dev/hde2
> > > pvcreate -- physical volume "/dev/hde2" successfully created
> > > 
> > > [root@box guest]# pvcreate /dev/hdg2
> > > pvcreate -- physical volume "/dev/hdg2" successfully created
> > > 
> > > [root@box guest]# vgcreate vg /dev/hde2 /dev/hdg2
> > > vgcreate -- no valid physical volumes in command line
> > > 
> > > 
> > > here's a snipit from the tail end of vgcreate -d:
> > > 
> > > <1> pv_read_all_pv -- calling stat with "/dev/loop/7"
> > > <22> pv_read -- CALLED with /dev/loop/7
> > > <333> pv_check_name -- CALLED with "/dev/loop/7"
> > > <4444> lvm_check_chars -- CALLED with name: "/dev/loop/7"
> > > <4444> lvm_check_chars -- LEAVING with ret: 0
> > > <333> pv_check_name -- LEAVING with ret: 0
> > > <22> pv_read -- going to read /dev/loop/7
> > > <22> pv_read -- LEAVING with ret: -282
> > > <1> pv_read_all_pv -- pv_read returned: -282
> > > <1> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 2
> > > <1> pv_read_all_pv -- LEAVING with ret: 0
> > > <1> pv_check_name -- CALLED with "/dev/hde2"
> > > <22> lvm_check_chars -- CALLED with name: "/dev/hde2"
> > > <22> lvm_check_chars -- LEAVING with ret: 0
> > > <1> pv_check_name -- LEAVING with ret: 0
> > > <1> pv_check_name -- CALLED with "/dev/hdg2"
> > > <22> lvm_check_chars -- CALLED with name: "/dev/hdg2"
> > > <22> lvm_check_chars -- LEAVING with ret: 0
> > > <1> pv_check_name -- LEAVING with ret: 0
> > > vgcreate -- no valid physical volumes in command line
> > > 
> > > 
> > > 
> > > Now, the only thing i can think of, is this disk *used* to have an LVM
> > > on it, (vg+lv) but i have since removed it from the disk, in favour of
> > > this new attempt.  i cant see how it could possibly be a problem, but
> > > maybe there's something lurking in the FS.
> > > 
> > > 
> > > Does anyone have any dieas whats wrong?
> > > im running lvm 1.0.3 on 2.4.18
> > > 
> > > 
> > > 
> > > -- 
> > > PGP key:  http://codex.net/pgp/pgp.asc
> > > 
> > >  C:\> File not found. Should I fake it? (Y/N) 
> > > 
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> 
> -- 
> PGP key:  http://codex.net/pgp/pgp.asc
> 
>  2 + 2 = 5 for extremely large values of 2. 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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

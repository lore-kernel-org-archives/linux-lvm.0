From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] i2o devices and lvm Error on LE versus PE
Message-ID: <20030922115453.V2618@sistina.com>
References: <200309201114.40369.g.murano@vinsoft.it>
Mime-Version: 1.0
In-Reply-To: <200309201114.40369.g.murano@vinsoft.it>; from gingiabios@email.it on Sat, Sep 20, 2003 at 01:54:18PM +0200
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
Date: Mon Sep 22 05:06:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Sep 20, 2003 at 01:54:18PM +0200, Gianmichele Murano wrote:
> HI  ALL
> 
> as first thing, i say hallo to you.
> 
> now i tell you my problem:
> on a controler raid  (i2o devices) i have a debian distro.
> Recently i have enlarged the logical volumes  on this controler.
> All seemed ok,  i was able to remount the file systems and to copy and install 
> programs and data on resized volumes.
> 
> So, i was out of office and the development server was tuned off by person who 
> wasn't me (so i don't know what is the matter, if happened any thing ).

Are all Physical Volumes accessible (run pvscan and analyze) ?
If any are missing that is likely to explain your problem.

It is hard to help you here without knowing what happened to the system :(

Of course you can use a metadata backup and restore it but this is no
good advice either without knowing which changes have been made (i.e. multiple
lvcreate/lvremove/lvextend/lvreduce meanwhile) and which metadata backup
should be restored, preusmably _all_ PVs are accessible.

You want to read pvcreate and vgcfgrestore manual pages and use
the -ll option of vgcfgrestore to analyze your backup contents.

> 
> later, when in was in office i have turn on the server and the vgscan failed, 
> it said " ..omissis... only  found 499 of 500  LE for LV 
> /dev/volume1/lgv1(0)" .
> I don't undestand what was happened.
> It is possible that a bad tuned off make a problem as this?
> Any body know the answer?
> 
> To solve the trouble i thinked to do in this way:
> to reduce the LV lgv1 of some LE , in this way the info about the number of LE  
> will rewrite and (i hope) the problem vanish.The idea seems good, isn't?
> But i can't do this because the volume group is inactive.
> Anybody know a method to active a volume group also if vgscan fail?
> 
> Please, i MUST to recove the data on the lv, we don't have a backup policy 
> >:^> 
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

From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: Problems running with LVM on RedHat 7.2
Message-Id: <20020304112606.C10007@sistina.com>
References: <OF8D931057.C81A9527-ON86256B6F.0052D789@raleigh.ibm.com
    <OF8D931057.C81A9527-ON86256B6F.0052D789@raleigh.ibm.com >
    <20020301103227.N22608@lynx.adilger.int>
MIME-Version: 1.0
In-Reply-To: <20020301103227.N22608@lynx.adilger.int>; from
    adilger@clusterfs.com on Fri, Mar 01, 2002 at 10:32:27AM -0700
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
Date: Mon Mar  4 04:27:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Mar 01, 2002 at 10:32:27AM -0700, Andreas Dilger wrote:
> On Mar 01, 2002  09:30 -0600, James T West wrote:
> > The problem with running "vgscan" with every boot, is "vgscan" first
> > destroys /etc/lvmtab and all the files in /etc/lvmtab.d.   These are very
> > important files containing your LVM Volume Group description.  These files
> > were probably "good" files when your system was shutdown.   If "vgscan"
> > runs into any problem while running, it will fail to recreate these files,
> > and you will not be able to access your volume groups without first
> > restoring these files.
> > 
> > In my view "vgscan" should only be run manually, and should not be run
> > automatically on every boot.  Running "vgscan" on every boot is not
> > necessary, and can potentially cause serious problems.
> 
> I totally agree, and have stated this in the past.  It would be nice if
> the "pvscan" command updated the list of available PVs, but did not
> change the VG layout _at_all_ (where the VG layout only referred to
> PVs by UUID).

If vgscan doesn't find the LVM metadata on-disk there's
2 possible reasons:

a.) it is not there because of disk(-subsystem) problems.

b.) vgscan has a bug so let's fix it.


/etc/lvmtab* exists in LVM1 for the sole purpose of performance.

What Andreas recommends causes scanning of *all* PVs again to find changed
pathes and in case none is found to access a particular PV we end up with
case a. above. To avoid that case, I implement VG quorum in LVM1 right now
in order to activate the VG anyway.

BTW:
the actual /etc/lvmtab.d/* copies vgscan removes at shutdown
are still in /etc/lvmconf/*.
The following tiny script recreates them for you in case vgscan fails.

Call it like "script MyVG1 [MyVGn...]"

It won't help in case you have *inaccessable* PVs though ;-(

#!/bin/sh
rm -fr /etc/lvmtab*
mkdir /etc/lvmtab.d
for vg in $*
do
   echo -ne "${vg}\0" >> /etc/lvmtab
   cp /etc/lvmconf/${vg}.conf /etc/lvmtab.d/${vg}
done
chmod 755 /etc/lvmtab.d
chmod 644 /etc/lvmtab /etc/lvmtab.d/*


> I believe that LVM2 does this (at least I hope).

LVM2 doesn't create these cache files.

> 
> Cheers, Andreas
> 
> PS - James, can you please learn to trim your quoting a bit???
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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

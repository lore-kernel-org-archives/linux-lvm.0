From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgcreate looks at devices it shouldn't
Message-Id: <20020224113252.B4183@sistina.com>
References: <200202231207.NAA34732@numa1.igpm.rwth-aachen.de>
MIME-Version: 1.0
In-Reply-To: <200202231207.NAA34732@numa1.igpm.rwth-aachen.de>;
    from jarausch@igpm.rwth-aachen.de on Sat, Feb 23, 2002 at 01:07:35PM +0100
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
Date: Sun Feb 24 04:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Feb 23, 2002 at 01:07:35PM +0100, jarausch@igpm.rwth-aachen.de wrote:
> Hi,
> 
> on the second machine where I would like to create LVM volumes
> I have the following problem
> 
> The ZIP drive and the CDROM drive are mapped to
> hdd (hdc resp.)  BUT due to a kernel parameter
> hdc=ide-scsi hdd=ide-scsi
> these are no more accessible as  /dev/hdd /dev/hdc
> 
> Now pvcreate /dev/sdb1 works fine but
> vgcreate home /dev/sdb1
> produces error messages like
> ide-scsi: hdd unsupported command in request queue (0)
>   ....
> and after some such messages
> vgcreate -- ERROR "pv_read(): read" reading physical volumes.
> 
> AND the desired volume group on my  scsi drive /dev/sdb1
> is NOT created.
> 
> What can one do about this. How to tell the utilities
> to never look at /dev/hd?

The supported devices in LVM1 are hard coded :-(

Easy way would be to have a wrapper "myvgcreate" like:

#!/bin/sh
DEVDIR=/dev
SAVDIR=/dev/.SAV
DEVS="hdc hdd"
cmd=$(basename $0)

errcheck () {
   if [ $2 -ne 0 ]; then
      echo -en "$cmd -- $1\n\n" >&2
      exit $2
   fi
}

[ ! -d $SAVDIR ] && mkdir $SAVDIR
cd $SAVDIR >/dev/null 2>&1
errcheck "Can't chdir to $SAVDIR" $?
cd $DEVDIR >/dev/null 2>&1
errcheck "Can't chdir to $DEVDIR" $?
mv $DEVS $SAVDIR
errcheck "Can't move $DEVS form $DEVDIR to $SAVDIR" $?
vgcreate $*
cd $SAVDIR >/dev/null 2>&1
errcheck "Can't chdir to $SAVDIR" $?
mv $DEVS $DEVDIR
errcheck "Can't move $DEVS from $SAVDIR to $DEVDIR" $?
rmdir $SAVDIR >/dev/null 2>&1
errcheck "Can't remove $SAVDIR" $?
exit 0

> 
> I am using lvm-1.0.2
> 
> Does this problem vanish with 2.0 ?

Yes.
LVM 2 Beta 1 provides a configurable device filter which enables
you to exclude device nodes using regular exporessions.

THIS IS BETA SOFTWARE NOT MEANT TO BE USED ON PRODUCTION MACHINES!

Unless you try it on test or otherwise not critical systems,
stay with the above work around.

> 
> Many thanks for a hint,
> 
> Helmut Jarausch
> 
> Lehrstuhl fuer Numerische Mathematik
> Institute of Technology, RWTH Aachen
> D 52056 Aachen, Germany
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

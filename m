From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan fails to find volume groups
Message-Id: <20020417175033.C18512@sistina.com>
References: <20020417075302.GB26644@codegate.jafager.com>
MIME-Version: 1.0
In-Reply-To: <20020417075302.GB26644@codegate.jafager.com>; from
    jafager@jafager.com on Wed, Apr 17, 2002 at 03:53:02AM -0400
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
Date: Wed Apr 17 10:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Jason,

can you access /dev/sdb while running the below part of your startup script?
IOW: is the Adaptec driver present then and does it work properly?

Regards,
Heinz    -- The LVM Guy --


On Wed, Apr 17, 2002 at 03:53:02AM -0400, Jason A. Fager wrote:
> I have been attempting to get LVM set up on a freshly-installed
> Slackware 8.0 system (custom 2.4.18 monolithic kernel, LVM 1.0.3,
> no kernel patches).  It works fine in multi-user mode, it works
> fine in single-user mode, however I set up the single-user init
> script like this:
> 
> (/ is mounted read only at this point)
> mount -o remount,rw /
> vgscan
> vgchange -a y
> mount -o remount,ro /
> (stock Slackware fsck and mount bits)
> 
> The only volume group I have contains one physical volume
> (/dev/sdb, on an Adaptec 7xxx controller).  For some reason,
> vgscan doesn't pick up the volume group.  The exit code is 0,
> and looking at the debug output it hits /dev/sdb and spits out
> the same messages as when it hits all the other devices.
> 
> As an experiment I put a call to sulogin before the vgscan and
> tried running it by hand; same thing happened.  I tried running
> pvcreate (on the whole disk, and after creating an LVM partition
> /dev/sdb1) and it failed with error code 7.
> 
> As another experiment, I tried setting up a loopback filesystem
> on a file in the root directory.  That worked perfectly; vgscan
> picked it up, vgchange activated it, and the rest of the init
> script ran fsck and mounted it.  Other than setting up the
> loopback file the only thing I did was add a call to losetup
> before the vgscan.
> 
> Not sure if this is a problem with the kernel (i.e. SCSI driver)
> or a problem with LVM, or some boneheaded thing I'm doing wrong.
> Any advice you can give would be appreciated -- let me know if
> I can provide more information.
> 
> thanks,
> jafager
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

From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM1 on top of DRBD
Message-ID: <20030820124623.B8426@sistina.com>
References: <200308201141.20079.jbanzhaf@ngi.de>
Mime-Version: 1.0
In-Reply-To: <200308201141.20079.jbanzhaf@ngi.de>; from jbanzhaf@ngi.de on Wed, Aug 20, 2003 at 11:41:20AM +0200
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
Date: Wed Aug 20 05:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Joachim,

LVM1 isn't cluster aware.
DRBD devices are just some other "local" ones for it.
No replication is done by LVM1.

The whole replication process is up to DRBD, that's why you
need to start it using a DRBD command.

You can use hartbeat to recognize if a node dies and scripts to start LVM
on the living node to access logical volumes there.

Regards,
Heinz    -- The LVM Guy --


On Wed, Aug 20, 2003 at 11:41:20AM +0200, Joachim Banzhaf wrote:
> Hi list,
> 
> I'd like to use LVM1 on top of DRBD 0.6.6 and not the other way round, because 
> I then can resize my partitions online (add a new drbd device, make it a pv, 
> add it to a vg, be happy).
> 
> It just seems not to be that simple.
> 
> The HOWTO warns about LVM not being cluster aware and describes how to do it 
> anyway on shared storage. I (think I) have these requirements met by using 
> heartbeat to have vg's active at one node only and running vgscan on the 
> secondary after changes on the primary. 
> 
> I created the pv's using the /dev/nbx devices (x=1,2).
> I created the vg lvm-drbd with lv lv1-s2 using these pv's.
> 
> The corresponding haresources file is this:
> job-vm1 192.168.1.101 datadisk::lvm1 datadisk::lvm2 LVM::lvm-drbd \
>   Filesystem::/dev/lvm-drbd/lv1-s2::/ha/export::reiserfs
> 
> What I get is lvm using the lower level device (sdbx in my case).
> vgdisplay -vD shows the pv's using /dev/sdbx.
> Nothing gets replicated to the other node (not surprising then).
> I even patched lvm_check_dev.c and rebuilt the lvm tools to ignore /dev/sdbx 
> devices, removed all lvm infos from /etc and did a new vgscan and 
> vgcfgbackup. vgdisplay -vD now shows the /dev/nbx devices for the pv's.
> But still no replication without drbdsetup /dev/nbx replicate :-(.
> 
> I use suse 8.2 with suse 2.4.20-4GB kernel (you'ed a few weeks ago)
> for the lvm_check_dev.c-patch I installed the lvm source rpm, modified the 
> spec file not to use the mp patches (because a file was missing), added my 
> patchfile and did a rpm -bi /usr/src/packages/SPECS/lvm.spec.
> 
> Btw. the build process did not stop on compile errors in lvm_check_dev.c. Is 
> that intended? It is confusing...
> 
> What am I doing wrong?
> Is it possible doing LVM on top of DRBD at all?
> 
> I'd happily provide more details if it helps.
> 
> Ciao,
> 
> Joachim Banzhaf
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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

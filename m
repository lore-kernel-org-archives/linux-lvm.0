From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM & GFS?
Message-ID: <20021127144839.C1578@sistina.com>
References: <200211261131.gAQBVrFS005853@mailserver1.hrz.tu-darmstadt.de>
Mime-Version: 1.0
In-Reply-To: <200211261131.gAQBVrFS005853@mailserver1.hrz.tu-darmstadt.de>; from grobe@gmx.net on Tue, Nov 26, 2002 at 01:02:22PM +0100
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
Date: Wed Nov 27 11:24:28 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 26, 2002 at 01:02:22PM +0100, Lars O. Grobe wrote:
> Hi!
> 
> I am currently running a Linux fileserver with LVM 1.x, on kernel 2.4.19. The 
> storage system consists of two scsi-raid5 (ibm serveraid 4m) both as physical 
> volumes in a vg containing the volumes we share with netatalk and samba to 
> our clients.
> 
> We are going to buy a new fileserver system now. As we need high-availability 
> in future (the new server will hold all data of the faculty of architecture 
> here), we are going to implement a failover-scenario with to nodes accessing 
> a fibrechannel storage with redundant paths'. We didn't decide so for wether 
> to use ibm, compaq ore fujitsu-siemens hardware, but all three offer these 
> solutions.
> 
> As I know about gfs, I wonder how difficult it would be to add load balancing 
> to this configuration by using gfs (so far we are on reiserfs 3.6x). Would we 
> still need LVM (and is this a common combination)? I use LVM to give any 
> department it's own volume, so that filesystem settings are made on a per 
> department base, and I would like to keep this.

Yes, you can achieve load balancing using GFS on both nodes.
_Plus_ it gives you much better resilience WRT server failures presuming
your clients support failover (any of the 2 nodes can crash and the service
is still available). Such configurations are the ones we can leverage
with GFS :)

Yes, you can use LVM in combination with GFS _but_ because LVM is a single
host volume manager you need to use its 'static mode' in order to access
its volume groups throughout the cluster in order to run GFS on top of it.
You need to unmount all GFS file systems on all nodes and deactivate LVM
on all but one in order to change the LVM configuration though.

We are working on LVM2 which is the base for CLVM (Cluster LVM)
planned for next year. CLVMs major advantage is for sure that all LVM commands
will run cluster wide and that all changes to volume groups and/or logical
volumes are visible in the cluster immediately.
You are able to do a smooth upgrade from LVM1+GFS to
CLVM+GFS because it supports the LVM1 metadata. IOW: no need for
backup+reinstall+reconfigure+restore, just SW upgrade.

> 
> I am not sure wether this is OT here, but as I have been on this list for a 
> while now, I would like to ask which contact could help me further. I will 
> download the eval version of gfs5.1 now and install it on my laptop - one 
> node ;-)

For now, GFS comes with a simple volume manager called POOL which enables you
to group whole disks together. You can use that one _or_ LVM1 in 'static mode'.
Upgrade to CLVM is potentially easier the second way though we plan to support
POOL -> CLVM upgrades as well.

Feel free to contact sales@sistina.com for further information.

> 
> CU, Lars.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] disk naming
Message-ID: <1022070000.1041618595@[192.168.200.4]>
In-Reply-To: <1041610095.19844.45.camel@mosix>
References: <1041610095.19844.45.camel@mosix>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Fri Jan  3 12:21:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Matt Schillinger <mschilli@vss.fsi.com>

>
> this should be a simple question, but I can't find a direct discussion
> in the lvm documentation. I believe that i have found that LVM will find
> appropriate PV's regardless of their name (sda,sdb).. Is this true? Do i
> need devfs to ensure that i always have the same disk naming, or will
> LVM handle this for me?  I am currently using scsidev for naming
> purposes, but have found that vgcreate will not work with scsidev device
> names (/dev/scsi/sdh0-0c0i4l2p1)
> /dev/scsi/sd(host=0,scsiid=4,LUN=2,partition #=1)

sd[abcd] notation is based on the order which the kernel
finds devices on the bus. Adding a SCSI card or removing
disks will change the naming.

devfs allows using /dev/scsi/.../busX/.../targetY/.../partZ,
which will not change unless you shuffle the scsi cards :-)

I use it mainly because I prefer to know what I'm pointing
at -- memorizing the device letter conventions can be an
exercise in futility.

You can quickly convert from one naming convention to
the other if your root volume isn't on LVM: boot single
user, export the VG's and import them using the devfs
naming convention.


-

Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 773 252 1080

Message-ID: <3DEC9B03.B83C0078@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Error creating snapshot, "Cannot allocate memory"
References: <20021202223223.GC21924@ofb.net> <20021203114821.A25161@sistina.com>
Content-Transfer-Encoding: 7bit
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
Date: Tue Dec  3 05:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"Heinz J . Mauelshagen" wrote:
> 
> On Mon, Dec 02, 2002 at 02:32:23PM -0800, jheiss-linuxlvm@ofb.net wrote:
> > I have a volume group that is 1.4 TB, with a volume that is 400 GB.
> > I currently have three 50 GB snapshots of that volume.  When I try
> > to create a fourth, I get the following error:
> >
> > bash-2.05a# lvcreate -L 50G -s -n snap_home1_20021202 /dev/home/home1
> > lvcreate -- WARNING: the snapshot will be automatically disabled once it
> > gets full
> > lvcreate -- INFO: using default snapshot chunk size of 64 KB for
> > "/dev/home/snap_home1_20021202"
> > lvcreate -- ERROR "Cannot allocate memory" creating VGDA for
> > "/dev/home/snap_home1_20021202" in kernel
> 
> You don't have enough kernel virtual memory to hold the snapshot exception
> table in core :(
> Install more RAM.

I've seen this error as well. In a machine with 1GB memory and the only
processes
running were NFS and samba. Just how much memory does it need ?

 
> We have planned to reduce the amount of RAM needed to hold such tables
> in LVM2/device-mapper next year.

That would be nice.




JonB

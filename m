From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] software mirroring
Message-ID: <20020906201136.GB5094@localhost>
References: <4808.24.46.54.254.1031320260.squirrel@mail.scottsavarese.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4808.24.46.54.254.1031320260.squirrel@mail.scottsavarese.com>
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
Date: Fri Sep  6 15:12:12 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Friday, 06 September 2002, at 09:51:00 -0400,
Scott Savarese wrote:

> I am trying to set up mirroring on my system with LVM. Is there a command
> to do it in LVM, or do I need the raidtools as well?
> 
The best configuration would be a LVM setup on top of some kind (RAID1
for mirroring) of software or hardware RAID. This way you get the
benefits of both RAID (redundancy) and LVM (space management and
snapshots among others).

> The ultimate goal is a completely mirrored harddrive so that I if my boot
> drive fails (on that disk are /, swap, and /boot) I can swap the two
> drives and reboot.
> 
If one physical drive fails in a RAID1 configuration you shouldn't need
to reboot the box, and the failure would go mostly unnoticed to you.

> Or is it preferered to create LV's with LVM, and then run RAID ontop of
> the LVM disks? (and then mirror /boot seperately).
> 
Better the other way: RAID on top of physical disks (to get protection
against a disk failure) and above RAID (be it sotf or hard) LVM (the
inner layer gives you RAID1 capabilities, and LVM works as usual).

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Woody (Linux 2.4.19-pre6aa1)

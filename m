Return-Path: <thornber@btconnect.com>
Date: Mon, 30 Jul 2001 10:54:36 +0100
Subject: Re: [linux-lvm] more snapshot probs
Message-ID: <20010730105436.D562@btconnect.com>
References: <Pine.LNX.4.33.0107281511250.5058-100000@greebo.foobarhouse.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0107281511250.5058-100000@greebo.foobarhouse.com>; from jamesp@foobarhouse.com on Sat, Jul 28, 2001 at 03:14:23PM +0100
From: Joe Thornber <thornber@btconnect.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

All,

Some of you are using PV's that have badly aligned PE's.  The upshot
of this is that you will not be able take snapshots to or from one of
these PV's :(

The thing to watch for, which indicates this problem, is a message of
this form:

> /dev/vg00/lvol6 on /dev/vg00/snap: couldn't prepare kiovec blocks (start
> probably isn't block aligned)

Beta8 creates correctly aligned PV's.  At the moment to fix this you
will have to pvmove your data onto a correctly aligned PV - I think
this is the safest way.

We're very sorry about this problem.  It looks like some of you are
going to have to temporarily borrow another disk to do some shuffling.

- Joe

On Sat, Jul 28, 2001 at 03:14:23PM +0100, James Pattinson wrote:
> Hi
> 
> I've applied the recommended patches to 2.4.7 - beta8, VFS lock, and patch
> in previous emails.
> 
> Now, when I create a snapshot LV:
> 
> lvcreate -s -L500 -nsnap /dev/vg00/lvol6
> (where /dev/vg00/lvol6 is 3GB striped across 2 PVs)
> 
> I get these 2 messages in my logs a few seconds later:
> 
> Jul 28 15:10:05 greebo kernel: lvm -- _pv_get_number failed for rdev = 0
> Jul 28 15:10:05 greebo kernel: lvm -- giving up to snapshot
> /dev/vg00/lvol6 on /dev/vg00/snap: couldn't prepare kiovec blocks (start
> probably isn't block aligned)
> 
> THen when I try to mount:
> 
> [root@greebo /root]# mount /dev/vg00/snap /mnt/homesnap/
> /dev/vg00/snap: Input/output error
> mount: permission denied
> 
> And in the log:
> 
> Jul 28 15:13:28 greebo kernel: lvm - lvm_map: ll_rw_blk for inactive LV
> /dev/vg00/snap
> 
> Any ideas?
> 
> Cheers!
> 
> James
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] trouble initiating the lvm after reinstall
Message-ID: <20030531020037.GA15728@www.13thfloor.at>
References: <BAY1-F1131uWCsEFABf0004b5f1@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY1-F1131uWCsEFABf0004b5f1@hotmail.com>
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
Date: Fri May 30 20:59:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, May 31, 2003 at 12:30:20AM +0000, Carl Philip wrote:
> 4 PV(s) found for VG mylvm: expected 12
>  Volume group "mylvm" not found
> 
> that's the error i get when i try to run lvs or when the system boots up.
> all drives are connected just like before and i've reinstalled the system 
> lots of times and it always works
> 
> i've changed mobo now tho to a one with an onboard highpoint 374 
> controller, but those drives get the sdX numbers assigned.
> 
> i have 4 drives on the mobo which it obviously finds, but those 8 on the 
> promise ata 100 tx2 cards won't be 'found'. hde-hdl are there and it finds 
> them all in the bootup and i can access them with cfdisk...i even tried to 
> run ./MAKEDEV hde-hdl and mknod for hde-hdl...no difference :(
> 
> please please help me, i really need to get the lvm working cause i have 
> files there i need


hmm, correct me if I'm wrong, but you say that
the onboard HPT 374 attached drives show up as
sdX (as sda, sdb, sdc ... ?) and the eight drives
on your (presumably two) promise TX2 cards are
(all or partially?) not found, although they show
up in the bootup (as hde-hdl ?) and you can access
them (all or partially?) with cfdisk?

I'm confused, my list of unanswered questions
so far:

 - if the HPT 374 driver shows up as scsi devices
   (which is possible, I do not know anything
   about this driver), why do the promise drives
   start with hde and not hda?
 - what do you mean by "Won't be found", but
   finds them at bootup and can be accessed with
   cfdisk? are they there or not?
   check with hdparm -i /dev/hdX

what does pvscan check (verify with strace)?
I once had a problem with some HPT controller
where the driver insisted to have two different
devices, one for each disc, and another for
some hw-raid configuration, unfortunately the
lvm pvscan checked only the hw-raid discs not
the raw discs for physical volumes ...

Here is what I would recommend (in your case):

get a recent vanilla kernel with highpoint 374, 
promise ata 100 tx2  _and_ recent devfs support 
(maybe the ide patch is required, to support the
hpt controller), configure and build this kernel
according to your (minimal) requirements, then boot
with this kernel and have a look at the devfs mount
(you do not have to mount it at /dev, but it would
 be advantageous to do so ..) 

you should now be able to actually see which
drives are 'found' and available, if some drives
are missing, your driver configuration isn't 
what it should be, or one of your controllers 
isn't supported ...

hth,
Herbert

> 
> regards
> /Carl Philip
> 
> _________________________________________________________________
> The new MSN 8: advanced junk mail protection and 2 months FREE* 
> http://join.msn.com/?page=features/junkmail
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

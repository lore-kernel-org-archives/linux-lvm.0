From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] Drive failure
Message-ID: <20030515055917.GB19045@www.13thfloor.at>
References: <200305141041.37355.bjzolp@wisc.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200305141041.37355.bjzolp@wisc.edu>
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
Date: Thu May 15 03:01:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 14, 2003 at 10:41:37AM -0500, B. J. Zolp wrote:
> One of the drives in my volume group is developing bad sectors on it.  When I 
> mount the logical volume spanning that drive my entire machine locks up.  
> Should I be able to dd (without reading the bad sectors) the failing drive 
> (assuming it spins up and reads all the good sectors) to the replacement 
> drive, then run fsck on the unmounted volume and then mount the volume with 
> minimal data loss?

I guess, this should work ... but make sure, that
you do the copy operation on another system, otherwise
the LVM stuff could/will be irritated by two diffent
disks with the same signature (after copying over)

> The other option I can think of is remove that drive from the volume and then 
> remount it, but that would mean a loss of everything that is one the failing 
> drive, plus I am not sure how reiserfs works with large chunks of its file 
> system removed like that.

I wouldn't do that, neither with reiserfs nor with 
any other unix filesystem ... only as last escape
if you disk is completely unreadable ...

anyway, if possible make a copy of ALL disks involved
before you do any fscking so you can go back and
try any other approach ...

best,
Herbert


> thanks
> 
> bjz
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

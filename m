Subject: Re: [linux-lvm] Question about lvm
From: Paul Furness <paul.furness@vil.ite.mee.com>
In-Reply-To: <Law14-F71CvvMSaQz8x00013cc6@hotmail.com>
References: <Law14-F71CvvMSaQz8x00013cc6@hotmail.com>
Message-Id: <1059562098.6792.11.camel@Zebra.vil.ite.mee.com>
Mime-Version: 1.0
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
Date: Wed Jul 30 05:49:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi.

I'm no expert on lvm, but I am using it for my main file servers. They
are all running RedHat 7.3, and it was really easy to set up.

Are you sure you actually want to put the root f/s on an lvm partition?
I haven't done that, because I don't honestly see the point.

I installed the system (RH7.3 out of the box) and then added all the
updates and patches issues by Red Hat to it to bring it up to date. I
didn't add any lvm stuff at this point.

I then installed the 2.4.20 kernel sources (because at the time, Red Hat
only released up to 2.4.18, and it didn't have LVM included in it), and
compiled that with lvm switched on. Compiling the kernel is actually
really easy, nowadays. IT used to be confusing, but there's a nice GUI
version of the config program that lets you take as long as you want to
pick the options that you need. Also, if you are using Grub as your boot
loader (the default with RH7.3) then it's really easy to install your
newly compiled kernel and add it to the boot menu so that you can test
it easily.


After doing all that, I created physical volumes and groups which I am
using for all the data I wanted to store, however I have not changed the
root file system at all - this is still a normal, ext3 partition on the
first hard disk. All my lvm volumes are on other disks or partitions.

That way, if anything goes wrong with LVM, it won't stop the system
booting and therefore I will still be able to fix it. It also makes
upgrading the system / kernel much easier - I don't need to mess around
with initrd to make the system boot.


Hope all this helps you work out what exactly you want to do... :)

Paul.

On Tue, 2003-07-29 at 21:41, tv fw wrote:
> I want to install LVM together with Redhat 7.3
> 
> I tried invain to read the manual but didn't figure out how to careate the 
> logican and phisical
> drives if you don't have a system running (the disks have red hat installed 
> on them so
> all the changes to the partitutions are deleting data)
> 
> is the only way to install lvm is to install redhat and then change root 
> file system to lvm system
> It looked scary and complicated in the lvm-howto??
> 
> Is there a more user friendly man pages (the lvm-howto assumes that a person 
> knows
> all about linux commands formating and all)
> I am kind of new to that?????
> 
> _________________________________________________________________
> Add photos to your messages with MSN 8. Get 2 months FREE*.  
> http://join.msn.com/?page=features/featuredemail
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

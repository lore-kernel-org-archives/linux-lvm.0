Message-Id: <3C869076.7010607@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] System Suggestions
References: <20020306210600.JKKL21197.imf11bis.bellsouth.net@taz>
    <1015450169.3240.80.camel@Steven>
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
Date: Wed Mar  6 15:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


Steven Critchfield wrote:
> On Wed, 2002-03-06 at 14:59, Greg Freemyer wrote:
> 
> Although my first thought is to write RH and remind them how much we
> hate it when they build things in a non standard way and therefore cause
> other standard systems to break. I have several peices of hardware that
> are only supported with a RH kernel. I may be braver than some in the
> fact that I have removed the RH kernel and used in to build other
> distros with it. RH should provide a source version of the kernel in
> which you can attempt to put XFS into, then compile, and should still be
> able to load the promise driver into that new kernel. It will take some
> effort, but should be usable. Of course you could return it as
> essentially broken and buy the 3ware card that has better support.

RedHat does provide the source.  It takes a bit of time to get it just 
the way you want it.  If you have RPM installed on a RedHat machine 
download the SRPM do a

rpm -Uhv kernel.src.rpm
cd /usr/src/redhat/SPECS
rpm -bp kernel.spec

In
/usr/src/redhat/BUILD

there will be a directory with tree with the kernel source that has a 
name that makes it fairly obvious.

This is all based off a stock redhat configuration on a 6.2 machine.

If you find the rpm2cpio or rpm2tar tools and you can extract the source 
files there will be a list of patches.

	The order in which you must apply the patches in in the .spec file from 
the RPM.  It is pain in the ass but it is completely doable.  They ship 
there kernels the way they like them in the format they like.  More 
specifically, the section labelled %prep, has the commands it runs on 
the rpm -bp listed there run those commands with the listed files and 
you'll get the source.  If you really want to try and do the patch dance 
and merge dance, it shouldn't bother you too much if your given the 
order to apply the patches.

	It's my understanding that the patches for XFS are pretty invasive and 
that the latest XFS patches won't apply to the RedHat kernel because RH 
has a different VM from the mainline kernel after 2.4.9 and XFS has lots 
of VM dependencies in it.  That is me just summarizing what I have heard 
on other mailings lists, never used XFS myself.  I thought SGI kept a 
version of a RedHat derived distro ISO  that would work with XFS that 
was relatively recent like RH 7.0 based or 7.1 based.  I can't remember 
the link off hand.

	If you runs those commands in the order listed you will get the entire 
source tree the way they have it when the start.  The rest of the 
commands and steps they take to build the RedHat source are all in the 
.spec file, you just have to read up on the .spec file format.  I had to 
modify some RedHat source code to make Labels work on LVM devices long, 
long ago and learned about how to do it then.

	Thanks,
		Kirby



> 
> Steven
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 

Subject: Re: [linux-lvm] lvm/devfs bug?
From: rich turner <rich@storix.com>
In-Reply-To: <3E95CCDB.4080305@cox.net>
References: 
	<1049829705.2312.16.camel@rich>	<20030408204334.GD22951@percy.comedia.it>
	<1049836943.7411.19.camel@rich> 	<20030409072130.GD1366@tykepenguin.com>
	<1049932652.7946.4.camel@rich-laptop> <1049998095.1031.5.camel@rich-laptop>
	 <3E95CCDB.4080305@cox.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1050009009.1028.11.camel@rich-laptop>
Mime-Version: 1.0
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
Date: Thu Apr 10 16:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

i have tried to clear partition table with:

i have tried many different things:
# dd if=/dev/zero of=/dev/sda bs=1024 count=10
# blockdev --rereadpt /dev/sda

# sfdisk -R /dev/sda1

following these commands /proc/partitions does not show a partition on
sda but pvcreate complains that there is.

if this is a bug then how do i submit it?

On Thu, 2003-04-10 at 12:58, Kevin P. Fleming wrote:
> rich turner wrote:
> 
> > does anyone recognize this as a bug within lvm?
> > 
> > there clearly is not a partition on sda (according to /proc/partitions)
> > but pvcreate thinks there is one. if pvcreate examines only
> > /proc/partitions for disk partitions and there is not a partition on a
> > disk then why does pvcreate fail? i may not understand all of the
> > underlying behavior of pvcreate but it appears to be failing when it
> > shouldnt. is this a bug?
> > 
> 
> If I remember your original message properly, the error you got from pvcreate 
> was that the disk "contained a partition table". This is _not_ the same thing as 
> the disk containing one or more partitions; there can very well be an empty 
> partition table on the disk. This may not be the problem, but if it is, using
> 
> dd if=/dev/zero of=/dev/sda count=20
> 
> will wipe out any existing DOS-type partition table (or any other type of table 
> that resides at the beginning of the disk). If you've already tried this, then 
> I'd say there is definitely a bug happening.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

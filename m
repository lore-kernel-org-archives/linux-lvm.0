Subject: Re: [linux-lvm] lvm/devfs bug?
From: rich turner <rich@storix.com>
In-Reply-To: <1049932652.7946.4.camel@rich-laptop>
References: <1049829705.2312.16.camel@rich>
	<20030408204334.GD22951@percy.comedia.it> <1049836943.7411.19.camel@rich> 
	<20030409072130.GD1366@tykepenguin.com> 
	<1049932652.7946.4.camel@rich-laptop>
Content-Transfer-Encoding: 7bit
Message-Id: <1049998095.1031.5.camel@rich-laptop>
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
Date: Thu Apr 10 13:08:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

does anyone recognize this as a bug within lvm?

there clearly is not a partition on sda (according to /proc/partitions)
but pvcreate thinks there is one. if pvcreate examines only
/proc/partitions for disk partitions and there is not a partition on a
disk then why does pvcreate fail? i may not understand all of the
underlying behavior of pvcreate but it appears to be failing when it
shouldnt. is this a bug?

On Wed, 2003-04-09 at 16:57, rich turner wrote:
> i dont completely agree with that because even when i use a kernel that
> does not have devfs i still get the same symptoms. even though
> /proc/partitions does not have a partition for a disk pvcreate still
> complains that there is one. pvcreate must be looking someplace else or
> there is a bug within lvm.
> 
> now, if i create a pv within a partition there are no complaints, lvm
> will continue normally. it appears to only happen when i want to create
> a pv on the entire disk.
> 
> why does pvcreate think there is a partition when there clearly isnt
> one?
> 
> On Wed, 2003-04-09 at 00:21, Patrick Caulfield wrote:
> > On Tue, Apr 08, 2003 at 02:22:23PM -0700, Rich Turner wrote:
> > > even though devfs is compiled in the kernel it actually is not mounted
> > > at this time. i have tried it using devfs long names also with no
> > > success.
> > 
> > If devfs is in the kernel you MUST have it mounted for LVM. It's to do with the
> > interaction between /proc/partitions and LVM.
> > 
> > 
> > 
> > patrick
> > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Subject: Re: [linux-lvm] LVM ext3 support
From: David Johnston <david@littlebald.com>
In-Reply-To: <20031017184443.GA7317@antimony.eng>
References: <3F903230.9070608@siue.edu> <20031017184443.GA7317@antimony.eng>
Content-Transfer-Encoding: 7bit
Message-Id: <1066438845.7758.3.camel@grandmother.littlebald.com>
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
Date: Fri Oct 17 20:02:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Fri, 2003-10-17 at 14:44, AJ Lewis wrote:
> On Fri, Oct 17, 2003 at 01:17:20PM -0500, anthony mayes wrote:
> > I am running Redhat 9 with kernel 2.4.20-20.9.  I am getting the 
> > following errors when trying to mount an LVM snapshot:
> > 
> > EXT3-fs: INFO: recovery required on readonly filesystem.
> > EXT3-fs: write access unavailable, cannot proceed.
> > 
> > I saw a thread on redhat.com that said a kernel patch is needed.  My 
> > question is where can I get the patch for this kernel, how do I install 
> > it, and why isn't this built into the kernel in the first place?  Any 
> > other suggestions are welcome.
> 
> Looks like you don't have the VFS-lock patch installed. something like
> linux-2.4.20-VFS-lock.patch, but i don't know what it would be for
> Redhat's patched kernels.

I've run into this, too.  You have to umount the filesystem before you
make the snapshot, eg:
umount /home
lvcreate -L 1G -n homebak /dev/vg/home
mount /home

With XFS (which I haven't tested), you can run xfs-freeze to commit the
journal without umount, but with ext3 the only way to commit the journal
is to umount the filesystem...
-- 
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC

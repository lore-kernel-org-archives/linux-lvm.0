Return-Path: <raheesom@navpoint.com>
Subject: Re: [linux-lvm] Converting my Root file system to LVM [lastquestion]
From: Rupert Heesom <raheesom@navpoint.com>
In-Reply-To: <200105240641.f4O6fIrW031893@webber.adilger.int>
References: <200105240641.f4O6fIrW031893@webber.adilger.int>
Date: 24 May 2001 06:52:37 -0400
Message-Id: <990701563.2282.2.camel@localhost>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On 24 May 2001 00:41:18 -0600, Andreas Dilger wrote:
> Steve Wray writes:
> Actually, I posted a similar question to linux-kernel, but I think it was
> lost in the noise.  Basically, it _is_ possible to have a "finitrd" for
> just this situation (at least on 2.4).  You unmount all but root, set up
> a ramfs, and pivot_root into the ramfs.  You can then unmount root (not
> just a read-only remount), and properly shutdown LVM/RAID/etc.  Haven't
> tried it myself, but it should work.
> 
> Note that LVM doesn't actually write anything to disk with "vgchange -an",
> so there is no real need to do this.  

I guess that's the answer I was looking for.... no real need to do a 
"vgchange -an" at shutdown.  I was sure that it was not healthy for LVM.
But if it doesn't matter, then I'll just take out the shutdown command.

BTW, if the VG _isn't_ shut down, what happens to it, ie it was active,
then it's suddenly activated again on bootup.  Doesn't sound like clean
functionality to me.

BTW, the finitrd sounds like a cool thing.  I think I'll stick with
simplicity right now (assuming it's safe).


-- 
regs
rupert

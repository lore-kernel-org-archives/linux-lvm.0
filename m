Subject: Re: [linux-lvm] ext2online and 2.4.18
From: Ian Prowell <ip_lvm@prowell.org>
In-Reply-To: <20020619195508.GA22427@clusterfs.com>
References: <1024512969.1862.6.camel@hiro.prowell.org.bogus> 
	<20020619195508.GA22427@clusterfs.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1024521044.1861.6.camel@hiro.prowell.org.bogus>
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
Date: Wed Jun 19 16:11:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: linux-lvm@sistina.com

Andreas,
Thanks for the prompt reply.  To be more specific I am using RedHat's
2.4.18-4 kernel.  When I apply the patch I get the following output.

[root@metaverse src]# cat /root/online-ext2-2.4.17.diff | patch -p0
patching file linux/CREDITS
Hunk #1 succeeded at 701 (offset 17 lines).
patching file linux/Documentation/Configure.help
Hunk #1 succeeded at 14316 (offset 441 lines).
patching file linux/fs/Config.in
Hunk #1 succeeded at 81 (offset 4 lines).
patching file linux/fs/ext2/balloc.c
patching file linux/fs/ext2/super.c
Hunk #9 succeeded at 730 (offset -1 lines).
Hunk #10 FAILED at 883.
Hunk #11 succeeded at 893 (offset 1 line).
Hunk #12 succeeded at 917 (offset -1 lines).
Hunk #13 succeeded at 979 (offset 1 line).
Hunk #14 succeeded at 987 (offset -1 lines).
Hunk #15 succeeded at 1024 (offset 1 line).
1 out of 15 hunks FAILED -- saving rejects to file
linux/fs/ext2/super.c.rej
patching file linux/include/linux/ext2_fs.h

It looks like most of the patch is working, but I am not a kernel
developer and really have no idea what failed on hunk 10.  If it would
be useful I can send the rejects file.

Once again thanks for the help and if it is a RedHat specific thing do
not worry about it too much.

-Ian

On Wed, 2002-06-19 at 12:55, Andreas Dilger wrote:
> On Jun 19, 2002  11:56 -0700, Ian Prowell wrote:
> > Has anyone gotten ext2online to work with 2.4.18?  I found an ext2online
> > patch for 2.4.17 at the Sourceforge site for ext2online, but it does not
> > seem to work for 2.4.18.  I have not been able to find any discussion of
> > it on the net or in the linux-lvm mailing list. 
> 
> I wasn't aware that there are patch conflicts with 2.4.18, as that is
> what I'm running myself.  However, I had upgraded the kernel with
> ext2online kernel patches in-place instead of applying the patch to
> a new 2.4.18 tree.  I'll make a new 2.4.18 patch.
> 
> Cheers, Andreas
> 
> PS - I'm just finishing work on a 2.4.18 ext3 kernel patch, in time for
>      my presentation on this subject at OLS.  Expect it soon.
> --
> Andreas Dilger
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> http://sourceforge.net/projects/ext2resize/

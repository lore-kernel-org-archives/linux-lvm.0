From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] ext2online and 2.4.18
Message-ID: <20020619214731.GB22427@clusterfs.com>
References: <1024512969.1862.6.camel@hiro.prowell.org.bogus> <20020619195508.GA22427@clusterfs.com> <1024521044.1861.6.camel@hiro.prowell.org.bogus>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1024521044.1861.6.camel@hiro.prowell.org.bogus>
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
Date: Wed Jun 19 16:49:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Prowell <ip_lvm@prowell.org>
Cc: linux-lvm@sistina.com

On Jun 19, 2002  14:10 -0700, Ian Prowell wrote:
> Andreas,
> Thanks for the prompt reply.  To be more specific I am using RedHat's
> 2.4.18-4 kernel.  When I apply the patch I get the following output.
> 
> [root@metaverse src]# cat /root/online-ext2-2.4.17.diff | patch -p0
> patching file linux/fs/ext2/super.c
> Hunk #9 succeeded at 730 (offset -1 lines).
> Hunk #10 FAILED at 883.
> Hunk #11 succeeded at 893 (offset 1 line).
> Hunk #12 succeeded at 917 (offset -1 lines).
> Hunk #13 succeeded at 979 (offset 1 line).
> Hunk #14 succeeded at 987 (offset -1 lines).
> Hunk #15 succeeded at 1024 (offset 1 line).
> 1 out of 15 hunks FAILED -- saving rejects to file
> linux/fs/ext2/super.c.rej
> 
> It looks like most of the patch is working, but I am not a kernel
> developer and really have no idea what failed on hunk 10.  If it would
> be useful I can send the rejects file.

It won't really be useful for you to send the failed hunk, because I
have no idea why it is failing.  I would suggest firing up a text editor
with fs/ext2/super.c and fs/ext2/super.c.rej and just manually cut-paste
the failed parts in.

Unified diffs are rather simple to understand.

Lines like "@@ -123,6 +234,8 @@" are telling you that the original file
had this hunk at line 123 and the modified file had the replacement
hunk at line 234.

Lines like "-                blah" are removing that line from the
original file and replacing it with "+           blarg" in the new file.

Hopefully hunk #10 isn't too large...  Sadly, the larger the hunk, the
more likely it is to not apply cleanly...

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

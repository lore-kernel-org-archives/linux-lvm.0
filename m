From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] extending a logical volume
Message-Id: <20020121193923.K4014@lynx.turbolabs.com>
References: <20020121201314.40293.qmail@web20303.mail.yahoo.com>
    <25790000.1011646431@duke.wrkhors.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25790000.1011646431@duke.wrkhors.com>; from
    lembark@wrkhors.com on Mon, Jan 21, 2002 at 02:53:51PM -0600
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
Date: Mon Jan 21 20:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lembark@wrkhors.com
Cc: linux-lvm@sistina.com

On Jan 21, 2002  14:53 -0600, lembark@wrkhors.com wrote:
> I'm also not sure that ext3 supports online extension
> (thought the original post was about ext3), and ext2
> or msdos file systems certianly don't.

Actually, both _could_ support online resizing if I ever got
my butt in gear.  As it is, only ext2 supports it, but ext3
has untested code to do it for 2.2 kernels.

> You also don't know if anyone is using the volume for
> a networked file system, which may screw things up 
> if the caching is too aggressive.

No, never seen a problem with this.  Nobody shrinks filesystems
online, so at worst you might not fully utilize the newly allocated
space.  In the end, however, applications rarely check the total
free space in a filesystem, but rather just write until the write
command returns ENOSPC.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

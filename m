From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] fsck write test
Message-Id: <20020111122818.V26688@lynx.adilger.int>
References: <001f01c19ad4$392d5120$803cfad5@vector>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001f01c19ad4$392d5120$803cfad5@vector>; from uros@thz.net on
    Fri, Jan 11, 2002 at 08:14:35PM +0100
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
Date: Fri Jan 11 13:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Uros Watzak <uros@thz.net>
Cc: linux-lvm@sistina.com

On Jan 11, 2002  20:14 +0100, Uros Watzak wrote:
> Hello Wolfgang.
> 
> I have found your e-mail address in an older post on WWW
> in some Linux web board/forum.

This is actually a mailing list address...

> You mentioned there is a
> way to perform a write test on a partirion using fsck or
> mke2fs. Can you tell me how to do it ? I used fsck but it
> only does a read-only test. Is there any way I can do a
> write test on my drive ?

man badblocks(8), see -w and -n parameters.  You can optionally
use "mke2fs -c <dev>" to do the badblocks checking at the same
time as you create the filesystem.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] "invalid i/o-protocol version" with e2fsadm
    (1.0.3) and 2.4.18
Message-Id: <20020227102215.N12832@lynx.adilger.int>
References: <20020227131803.A188@sparcie.schaub.loc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020227131803.A188@sparcie.schaub.loc>; from
    markus.schaub@gmx.net on Wed, Feb 27, 2002 at 01:18:11PM +0100
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
Date: Wed Feb 27 11:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Schaub <markus.schaub@gmx.net>
Cc: linux-lvm@sistina.com

On Feb 27, 2002  13:18 +0100, Markus Schaub wrote:
> I always get an "i/o protocol version" error when trying to resize a
> lv witch e2fsadm (statically linked, from lvm-1.0.3 with kernel
> 2.4.18).

You probably have two copies of e2fsadm in your path.  Try something
like 'which e2fsadm' or 'whereis e2fsadm'.  The other possibility is
that your static liblvm.a is the wrong one.

> Some time ago I got the same error with e2fsadm 1.0.1-rc4 on
> 2.4.13-ac7. In this case e2fsadm resized the filesystem but could not
> resize the lv. Resizing the lv with lvreduce (same version) worked.

The I/O protocol version has not changed since LVM 0.8, so you must
have a bad program.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

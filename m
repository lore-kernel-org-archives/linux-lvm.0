Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105081625.f48GPBqb000831@webber.adilger.int>
Subject: Re: [linux-lvm] LVM questions & problems.
In-Reply-To: <20010508094549.B31443@sistina.com> "from Heinz J. Mauelshagen at
 May 8, 2001 09:45:49 am"
Date: Tue, 8 May 2001 10:25:11 -0600 (MDT)
MIME-Version: 1.0
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

Heinz writes:
> On Mon, May 07, 2001 at 11:57:03AM -0400, Rupert Heesom wrote:
> > It seems I will try to learn how to use teh e2fsadm util.  BTW one of
> > the utils seems to be commercial from Powerquest.  I have the v4 of
> > Partition Magic already.  I know it resizes ext2 filesystems, but as far
> > as I know needs to be run from within windows (it's been a long time
> > since I've used it last).  Are the utils such as e2fsadm sufficient /
> > good enough without the commercial PM util?
> 
> You need to get the resize2fs tool (by Ted Ts'o and Powerquest) in order
> to run e2fsadm.
> 
> resize2fs might already be contained in your distribution.

If you have e2fsprogs 1.19 then it contains resize2fs.  The deal Ted had
with Powerquest is that resize2fs would become GPL after 2 years or so.

The e2fsadm program can use ext2resize (http://ext2resize.sourceforge.net)
instead of resize2fs.  If you patch your kernel with the ext2online patch,
then you can even use e2fsadm to grow the LV and ext2 filesystem without
unmounting it.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

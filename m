From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Implementation questions
Message-Id: <20011221091546.E31106@colombina.comedia.it>
References: <200112181346.fBIDkX513319@lewis.abi.tconline.net>
    <Pine.LNX.4.33.0112180802190.1822-100000@lx1.daboard.com>
    <20011218093315.A10276@kluge.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011218093315.A10276@kluge.net>; from felicity@kluge.net on
    Tue, Dec 18, 2001 at 09:33:15AM -0500
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
Date: Fri Dec 21 02:13:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Dec 18, 2001 at 09:33:15AM -0500, Theo Van Dinter wrote:
> On Tue, Dec 18, 2001 at 08:03:58AM -0600, mitch@mdmiller.com wrote:
> > Doesn't Ghost support Linux / LILO configurations?  That would allow you
> > to configure up one PC, and duplicate it to 129 others, and it's VERY
> > quick.  You do, however, still have to make any individualized changes to
> > each one after the duplication.
> 
> I've tried using Ghost2k (newer versions may be better) to just backup/copy
> my Linux partitions (straight ext2 at the time), and it sucked horribly.  The
why don't you give Partition Image a try
http://www.partimage.org/

it supports
reiserfs, ext2/ext3, fat16/fat32
ntfs (experimental but i successfully cloned a win2k box)
jfs, xfs, hpfs (os2), hfs (mac), ufs (bsd/sun experimental)

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

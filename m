From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <200110172137.f9HLbRK05494@munet-d.enel.ucalgary.ca>
Subject: Re: [linux-lvm] shrink issue
Date: Wed, 17 Oct 2001 15:37:27 -0600 (MDT)
In-Reply-To: <E15txpF-0008F2-00@hermes.sistina.com> from "FEJF" at Oct 17, 2001 11:03:42 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

FEJF writes:
> Andreas Dilger, on Mittwoch, 17. Oktober 2001 22:53 wrote:
> > On Oct 17, 2001  21:24 +0200, FEJF wrote:
> > > is it possible to tell the lvmtools (when shrinking a lvm-volume with 
> > > resizereiserfs and lvreduce) which hd should be used for free space and 
> > > which should stay in the lvm ?
> > 
> > No.  When you reduce the size of an LV, the free space is made from the end
> > of the LV only.  If you want to make a particular PV free, then you need to
> > use "pvmove" to free any PEs that are allocated on it.
> 
> hmm... does "the end" means the last harddrive when counting hda, hdb...etc ?
> f.e. if i have a hdb, hdc,hdd in the lvm and want the hdc free - does it help 
> to change the hdc to hde an reduce the lvm then ?

No, the "end" means whatever PE happens to be the highest numbered one in the
LV you want to resize.  See "lvdisplay -v /dev/vgname/lvname" for the details.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

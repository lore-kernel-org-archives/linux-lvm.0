From: Marc MERLIN <marc_lvm@merlins.org>
Subject: Re: [linux-lvm] snapshots of busy ext2 file system corrupt
Message-Id: <20020226223230.GE5066@merlins.org>
References: <m28z9guz53.fsf@isnogud.escape.de>
    <20020226095919.F12832@lynx.adilger.int> <2412370000.1014745130@tiny>
    <m2bsecdouv.fsf@isnogud.escape.de> <2621690000.1014757084@tiny>
    <20020226142731.X12832@lynx.adilger.int>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020226142731.X12832@lynx.adilger.int>
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
Date: Tue Feb 26 16:32:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 26, 2002 at 02:27:31PM -0700, Andreas Dilger wrote:
> Well, in many cases, data=ordered is actually faster than data=writeback
> because you get all of your journal I/O finished before you start writing
> to the FS.  In some cases (e.g. mail spool, NFS) it is faster to have
> data=journal for the same reason (because sync I/O is very fast when it
> is written to the journal).

I had heard about data=journal on mail spools, but does anyone have a
pointer with more performance comparisons between all 3?

Thanks,
Marc
-- 
Microsoft is to operating systems & security ....
                                      .... what McDonalds is to gourmet cooking
  
Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key

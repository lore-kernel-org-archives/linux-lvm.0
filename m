From: Andreas Dilger <adilger@turbolabs.com>
Date: Wed, 5 Sep 2001 12:11:29 -0600
Subject: Re: [linux-lvm] LV size maximum
Message-ID: <20010905121129.I32553@turbolinux.com>
References: <20010905113307.A19406@lug-owl.de> <20010905122428.A19885@vestdata.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010905122428.A19885@vestdata.no>
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

On Sep 05, 2001  12:24 +0200, Ragnar Kj?rstad wrote:
> My guess is that you will be able to extend an old LV to more than 1 TB
> when the patches are in place, without having to do backup/restore, if
> you only choose a big enough extent size. (because the ondisk formats
> deal with extents, not sectors). Can anyone more familiar with the
> format please confirm this?

There is a current limit of 65536 LEs/LV so you need to work out LE/PE
size for the maximum LV size you want.  For 2TB (=40 bits) LV you need
16MB (= 40 - 16 = 24 bits) PE size.  Scale accordingly.  32MB PE size
is not a bad choice in any case, but as you get larger you also have
wastage of 3*PEsize/2 per LV with the new LVM tools.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

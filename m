From: Andreas Dilger <adilger@turbolabs.com>
Date: Wed, 17 Oct 2001 14:53:27 -0600
Subject: Re: [linux-lvm] shrink issue
Message-ID: <20011017145327.L7859@turbolinux.com>
References: <E15twHP-0005Ro-00@hermes.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E15twHP-0005Ro-00@hermes.sistina.com>
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

On Oct 17, 2001  21:24 +0200, FEJF wrote:
> is it possible to tell the lvmtools (when shrinking a lvm-volume with 
> resizereiserfs and lvreduce) which hd should be used for free space and which 
> should stay in the lvm ?

No.  When you reduce the size of an LV, the free space is made from the end
of the LV only.  If you want to make a particular PV free, then you need to
use "pvmove" to free any PEs that are allocated on it.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

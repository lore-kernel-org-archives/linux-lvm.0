From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] ext2online fails
Message-ID: <20011213120226.T940@lynx.no>
References: <20011129095307.F29249@lynx.no> <Pine.LNX.4.33.0112131616390.2286-100000@dunlop.dub.ie.alphyra.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0112131616390.2286-100000@dunlop.dub.ie.alphyra.com>; from paulj@alphyra.ie on Thu, Dec 13, 2001 at 04:19:58PM +0000
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
Date: Thu Dec 13 13:00:03 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: "Jonathan S. Polacheck" <JPolache@texasmutual.com>

On Dec 13, 2001  16:19 +0000, Paul Jakma wrote:
> On Thu, 29 Nov 2001, Andreas Dilger wrote:
> > "ext2resize /dev/vg1/vol_usr" which will detect the size of the LV and
> > resize the filesystem to fill it.
> 
> surely for an LVM user it'd be more advisable to use 'e2fsadm' so as 
> to ensure the resizing of the LV and ext2/3 fs are done with regard to 
> each other (and without user intervention.)? or does ext2resize now 
> also resize the LV as neccessary?

Well, if you read the context (not shown here), he already ran e2fsadm
and it resized the LV for him, but the ext2online kernel patches were
not in the kernel, so the filesystem was not resized.  Hence the request
to run ext2resize on the (already resized) LV directly.  I agree that it
is preferrable to run e2fsadm when doing this in normal cases.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

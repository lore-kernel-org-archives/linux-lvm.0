From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Whole Disk Usage with LVM ...
Message-ID: <20021120010037.U1167@zealot.blacknet.de>
References: <2D92FEBFD3BE1346A6C397223A8DD3FC092096@THOR.goeci.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2D92FEBFD3BE1346A6C397223A8DD3FC092096@THOR.goeci.com>; from murthy.kambhampaty@goeci.com on Tue, Nov 19, 2002 at 02:26:59PM -0500
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
Date: Tue Nov 19 18:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm <linux-lvm@sistina.com>

On Tue, Nov 19 '02 at 14:26, Murthy Kambhampaty wrote:
> >> I am using entire disks.  
> >Bad idea, why don't you want to at last put a partition table on it,
> >with one big partition, that uses the whole disk ... or is this what you
> >had in mind?
> Err, is there a reason why this is a bad idea? 
To add my 0.02 Euro:

IMHO it's an bad idea, because you save a few MB, but confues
everything. The kernel will work fine, but quite a lot of tools wont,
and you might forget to tell your follow admint what you did and after a
crash he will assume the disks are wiped.
-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \

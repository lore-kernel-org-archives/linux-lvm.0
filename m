From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] raid 1 destroyed!
Message-ID: <20020830001837.C6906@zealot.blacknet.de>
References: <Pine.A41.4.43.0208291448530.61616-100000@hera.itg.uiuc.edu> <3D6E7E80.6040609@mvista.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D6E7E80.6040609@mvista.com>; from sdake@mvista.com on Thu, Aug 29, 2002 at 01:05:20PM -0700
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
Date: Thu Aug 29 17:16:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 29 '02 at 13:05, Steven Dake wrote:
> > [ ... ] 'raidhotadd /dev/md0 /dev/sdb', [ ... ]
> One place you may have gone wrong is hotadding /dev/sdb.  You would want 
> to add a partition such as /dev/sdb1 not /dev/sdb
And you might want to try mdadm instead of raidtools. it's more up to
date, supporte and comes with --help and a mailing list.

(look at: http://www.cse.unsw.edu.au/~neilb/source/mdadm/)
-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \

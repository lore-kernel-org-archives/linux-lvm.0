Date: Fri, 5 Oct 2001 10:30:53 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] pvcreate fails on a software RAID metadisk
Message-ID: <20011005103053.A2938@colombina.comedia.it>
References: <3BBC8B5B.1A484028@legis.state.ak.us> <3BBCBF87.5520C8F9@legis.state.ak.us> <20011004144643.B31725@turbolinux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011004144643.B31725@turbolinux.com>; from adilger@turbolabs.com on Thu, Oct 04, 2001 at 02:46:43PM -0600
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

On Thu, Oct 04, 2001 at 02:46:43PM -0600, Andreas Dilger wrote:
> On Oct 04, 2001  11:59 -0800, Bill Ellis wrote:
> > <55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
> 
> This is a problem - MD devices are not partitioned.  Have a look at
> this function to see why it thinks so.

no this should be normal
i believe the problem lies somewhere else in the damned cache
i tested it on one of my systems, i have 4 disks and 4 md devices there
md/0 is not detected
md/1 to md/3 are
and lvmdiskscan says i have 5 disks and 3 md devices.

look in http://www.comedia.it/bluca/lvm/
you will find lvmdiskscan output for
md0 (not working)
md1 (working)
and a diff file between the two that may help debugging
basically pv_read is called for md/1 and not for md/0

(i was using current cvs)

i will look further into this problem since i have to build a new lvm over md
but if someone else looks in it the better.


L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

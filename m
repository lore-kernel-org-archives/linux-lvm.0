From: Andreas Dilger <adilger@turbolabs.com>
Date: Wed, 3 Oct 2001 21:33:53 -0600
Subject: Re: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
Message-ID: <20011003213353.Q8954@turbolinux.com>
References: <Pine.LNX.4.33.0110040141320.21655-100000@fogarty.jakma.org> <009001c14c84$9559f820$836788cf@industry>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <009001c14c84$9559f820$836788cf@industry>
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

On Oct 03, 2001  23:28 -0400, Jason A. Lixfeld wrote:
> I'm having the same problem:
> 
> # /sbin/lvcreate -L 111G -n test_lv test_vg
> Segmentation fault (core dumped)
> #
> 
> Running:
> LVM driver LVM version 1.0.1-rc4(03/10/2001)
> Kernel 2.4.10
> ext3-2.4-0.9.10-2410
> 
> What's the fix here?!

Uh, gdb /sbin/lvcreate (or maybe /lib/lvm-iop10/lvcreate), then
gdb> r -v -d -L 111G -n test_lv test_vg
[lots of stuff]
Segmentation fault (core dumped)
gdb> info stack

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

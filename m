From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] problem building LVM2 for 2.6 kernel
Message-ID: <20030719004618.J31325@uk.sistina.com>
References: <Pine.LNX.4.53.0307181659170.6115@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.53.0307181659170.6115@localhost.localdomain>; from rpjday@mindspring.com on Fri, Jul 18, 2003 at 05:02:29PM -0400
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
Date: Fri Jul 18 18:47:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jul 18, 2003 at 05:02:29PM -0400, Robert P. J. Day wrote:
> 2.6.0-test1-ac2 version and selected device mapper and v4 ioctl

I've not tried this kernel, but assuming it contains BLKGETSIZE64
you'll need to compile LVM2 against newer glibc kernel headers
(e.g. update the package for your linux distribution or symlink 
/usr/include/linux to include/linux in your -ac tree)

Alasdair
-- 
agk@uk.sistina.com

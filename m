From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] lvm2 compile errors
Message-ID: <20030718161852.E31325@uk.sistina.com>
References: <1058490566.3f1748c60cb94@webmail.phys.unsw.edu.au> <20030718055640.D31325@uk.sistina.com> <1058505481.3f178309b6592@webmail.phys.unsw.edu.au>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1058505481.3f178309b6592@webmail.phys.unsw.edu.au>; from melinda@phys.unsw.edu.au on Fri, Jul 18, 2003 at 03:18:01PM +1000
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
Date: Fri Jul 18 10:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jul 18, 2003 at 03:18:01PM +1000, Melinda Taylor wrote:
> device/dev-io.c:215: `BLKGETSIZE64' undeclared (first use in this function)

I think some of your header files (in /usr/include/linux) need updating
to correspond to your new kernel.

BLKGETSIZE64 should be defined in /usr/include/linux/fs.h

There may be an updated glibc kernel-headers RPM for this, or you could
make /usr/include/linux a symlink to include/linux inside your new
kernel tree.

Alasdair
-- 
agk@uk.sistina.com

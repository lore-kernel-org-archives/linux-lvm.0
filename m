From: Alexy Khrabrov <alexy.khrabrov@setup.org>
Message-ID: <20030307190510.GA4048@angle.setup.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Migrating LVM1->LVM2 and kernel 2.4->2.5
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
Date: Fri Mar  7 13:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I wonder whether there's any advantage for migrating
to LVM2 on 2.4 kernels, if everything works OK?

But, as I see in kernel 2.5, there's no LVM by name,
just a low-level device mapper.  Does it mean that
in order to even try out kernel 2.5 on an LVM1 system,
I have to migrate to LVM2 first?  Is there any way
to "migrate" while being able to roll back to LVM1?
Does it depend on whether the root partition is LVM?
One of mine is, LVM1 too.
-- 
Cheers,
Alexy Khrabrov :: www.setup.org :: Age Quod Agis

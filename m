Subject: Re: [linux-lvm] Migrating LVM1->LVM2 and kernel 2.4->2.5
Message-ID: <20030308103430.GA907@fib011235813.fsnet.co.uk>
References: <20030307190510.GA4048@angle.setup.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030307190510.GA4048@angle.setup.org>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Sat Mar  8 04:35:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Mar 07, 2003 at 02:05:10PM -0500, Alexy Khrabrov wrote:
> 
> I wonder whether there's any advantage for migrating
> to LVM2 on 2.4 kernels, if everything works OK?

You could use the new atomic metadata format, configure the system
more flexibly with the new config file and use the human readable
metadata backups in the event of problems, just to name a few
advantages.  Personally I think it's worth upgrading for the 'lvs',
'pvs' and 'vgs' commands alone, I always found the *display commands
overly verbose.

> But, as I see in kernel 2.5, there's no LVM by name,
> just a low-level device mapper.  Does it mean that
> in order to even try out kernel 2.5 on an LVM1 system,
> I have to migrate to LVM2 first? Is there any way
> to "migrate" while being able to roll back to LVM1?

LVM2 supports the LVM1 metadata, so there is no migration as such.  If
you have a kernel with dm built in and the LVM2 tools you can use
LVM2.  If you want to roll back to LVM1 just switch back to an LVM1
kernel and tools.

If you want to run an 2.5 kernel you will have to use LVM2.

> Does it depend on whether the root partition is LVM?
> One of mine is, LVM1 too.

We have never run a root from an LVM2 lv, but there's no reason why it
wont work.  But of course don't expect the initrd built with
lvmcreate_initrd to work.

- Joe

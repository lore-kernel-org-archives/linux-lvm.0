From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] modprobe block-major-43 error at boot time
Message-ID: <20030522021644.GA2042@www.13thfloor.at>
References: <1053563322.5733.3.camel@dirac.cids.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1053563322.5733.3.camel@dirac.cids.ca>
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
Date: Wed May 21 21:16:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 21, 2003 at 08:28:36PM -0400, Daniel Savard wrote:
> I am getting the following error at boot time:
> 
> modprobe: modprobe: Can't locate module block-major-43 
> kernel: kmod: failed to exec /sbin/modprobe -s -k block-major-43, err
> 
> This error happen just after vgscan and vgchange in my rc.sysinit file.
> 
> Anybody can help me understand what I am doing wrong?

maybe ... 

I threw my dice, and the possible cause of the day is:

 - /sbin/modprobe is missing ...

there are many other very likely causes, and even 
more very unlikely ones, but, as you probably know,
information is everything, so share a little bit ...

best,
Herbert

> 
> 
> -- 
> 
> =======================================
> Daniel Savard
> 
> Internet: dsavard(at)cids.ca
> =======================================
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

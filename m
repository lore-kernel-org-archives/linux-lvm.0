Subject: Re: [linux-lvm] No Subject
From: Rob Cash <trylinux@nc.rr.com>
In-Reply-To: <200401151804.i0FI4gZ32327@ecstasy.winternet.com>
References: <6413350.1074097638140.JavaMail.Administrator@atp>
	 <20040114234655.GA20045@aquila.katkansky.org>
	 <200401151804.i0FI4gZ32327@ecstasy.winternet.com>
Message-Id: <1074228332.11965.0.camel@playground.robcash.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Fri Jan 16 08:57:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thu, 2004-01-15 at 18:04, Ken Fuchs wrote:
> >On Wed, Jan 14, 2004 at 08:27:18AM -0800, trylinux wrote:
> 
[...]
> Brant Katkansky <lists@katkansky.org> wrote:
> 
> >You need to rebuild the kernel initrd if you change your root device,
> >as the linuxrc script in the initrd has the root device hard-coded.
> 
> lvmcreate_initrd(8) can be used to do this, but one might learn more by
> using the following manual approach.
> 
[...]

Thanks!

Cheers,
Rob

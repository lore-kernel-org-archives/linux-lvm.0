Subject: Re: [linux-lvm] xfs quota on lvm
From: Christophe Zwecker <doc@zwecker.de>
In-Reply-To: <20020117093305.A32819@wobbly.melbourne.sgi.com>
References: <1011111148.3294.8.camel@fry.sysctl-office.de>
    <20020116181545.E30220@wobbly.melbourne.sgi.com>
    <1011175583.3295.18.camel@fry.sysctl-office.de>
    <20020116213756.A31578@wobbly.melbourne.sgi.com>
    <1011182440.3294.30.camel@fry.sysctl-office.de>
    <20020117093305.A32819@wobbly.melbourne.sgi.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1011222273.31800.11.camel@dumbo.zwecker.de>
MIME-Version: 1.0
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
Date: Wed Jan 16 17:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wed, 2002-01-16 at 23:33, Nathan Scott wrote:

> > ...
> > quotactl(0x5805 /* Q_??? */|USRQUOTA, "/dev/bender/test", 0, {33060, 1, 0, 0, 0, 0, 134479872, 0}) = -1 EINVAL (Invalid argument)
> > ...
> > quotactl(Q_GETQUOTA|USRQUOTA, "/dev/bender/test", 0, {1075089596, 1075131920, 1075131924, 1073747802, 3221222856, 1075089406, 134571809, 3}) = -1 ESRCH (No such process)
> 
> 
> ... these failing syscalls look like the root cause of your problems.
> You could try putting some printk() calls in sys_quotactl() in the
> kernel to figure out exactly where the error comes from.  I would
> guess it is to do with the handling of the "special" parameter, ie.
> "/dev/bender/test" above, since this is the only part where the LVM
> device file comes into the picture.

damn - dunno , got a hint where to put what you are talking about ?
because I dont :-)
-- 
Christophe Zwecker                     mail: doc@zwecker.de
Hamburg, Germany                        fon: +49 179 3994867
http://www.zwecker.de

"Who is General Failure ?  And why is he reading my disk ??"

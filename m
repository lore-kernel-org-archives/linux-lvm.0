Subject: Re: [linux-lvm] How to best use LVM?
Message-ID: <20020814174547.GB898@fib011235813.fsnet.co.uk>
References: <20020814165938.152D1F90D@tater>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020814165938.152D1F90D@tater>
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
Date: Wed Aug 14 12:46:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Aug 14, 2002 at 12:59:38PM -0400, pll+lvm@lanminds.com wrote:
> Is lvm10 the 1.x series and lvm2 the 2.x?

Yes, lvm2 is a totally new kernel driver and userland tools.

> If the former, is 2.x stable enough to use

Yes.

> and is it better to
> compile lvm from source or use the pre-compiled debian packages?

The debian packages should be ok.

> I've tried both the lvm10 and lvm2 packages, but continually recieve 
> errors when I do things like run lvdisplay (it complains about not 
> being able to flush the device several times), and also something 
> about not being able to open the device-mapper.

device-mapper is the kernel driver used by LVM2, there should be a
debian package for this too.

- Joe

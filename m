Subject: Re: [linux-lvm] Re: mkfs - cannot set blocksize
Message-ID: <20020607080539.GA1320@fib011235813.fsnet.co.uk>
References: <OF73D30ECA.36498F9C-ONC1256BD0.004E5691@kancelar.seznam.cz> <200206061435.g56EZpl28164@mail.pronto.tv> <20020606232137.GB479@frodo>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020606232137.GB479@frodo>
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
Date: Fri Jun  7 03:07:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Marek.Les@firma.seznam.cz, Roy Sigurd Karlsbakk <roy@karlsbakk.net>, linux-xfs@oss.sgi.com

Nathan,

On Fri, Jun 07, 2002 at 09:21:37AM +1000, Nathan Scott wrote:
> We need to contact the LVM folks and ask them to implement the
> BLKBSZSET ioctl (and while I'm at it, I'll mention that ENOTTY
> should be returned instead of EINVAL for unrecognised ioctls,
> apparently).

I put this ioctl into device-mapper (LVM2 driver) recently, and will
suggest Heinz does the same for LVM1.  You're correct about ENOTTY,
thanks for pointing it out.

- Joe

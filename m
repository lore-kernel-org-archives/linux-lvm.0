Subject: Re: [linux-lvm] /proc/partition problem
Message-ID: <20020816123053.GA5184@fib011235813.fsnet.co.uk>
References: <20020815084944kaoru@rifu.bsd.tnes.nec.co.jp> <20020816120315.B12990@sistina.com> <20020816105820.GA992@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020816105820.GA992@percy.comedia.it>
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
Date: Fri Aug 16 07:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Aug 16, 2002 at 12:58:21PM +0200, Luca Berra wrote:
> btw
> it should also be needed for device-mapper

No, device-mapper maps *block devices* to produce logical *block
devices*.  I'm not perpetuating this genhd/partition crap.

- Joe

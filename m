Subject: Re: [linux-lvm] Re: [Announce] device-mapper beta3 (fast snapshots)
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
In-Reply-To: <20020717103112.GA595@fib011235813.fsnet.co.uk>
References: <3D2F6464.60908@us.ibm.com> <02071513565400.06209@boiler>
	<20020716084234.GA431@fib011235813.fsnet.co.uk>
	<200207161105.49328.habanero@us.ibm.com>
	<20020716163157.GA11334@fib011235813.fsnet.co.uk>
	<1026840444.21656.544.camel@tiny> 
	<20020717103112.GA595@fib011235813.fsnet.co.uk>
Content-Transfer-Encoding: 7bit
Message-Id: <1026906374.5709.136.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
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
Date: Wed Jul 17 05:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Cc: linux-lvm@sistina.com, Andrew Theurer <habanero@us.ibm.com>, Kevin Corry <corryk@us.ibm.com>, linux-kernel@vger.kernel.org

On Wed, 2002-07-17 at 11:31, Joe Thornber wrote:
> On Tue, Jul 16, 2002 at 01:27:24PM -0400, Chris Mason wrote:
> > Some IDE drives ignore commands to turn off the write back cache, or
> > turn it back on when load gets high.
> 
> I'm amazed hardware manufacturers would dare to do such a thing - I
> guess I'm naive.

Its not explicitly against the spec. Some of them also like to make
"cache flush" a no-op too. The next generation of ATA is supposed to add
explicit "direct to media" write command facilities

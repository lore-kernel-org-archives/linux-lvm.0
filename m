From: Frank Joerdens <frank@joerdens.de>
Subject: Re: [linux-lvm] compile error with lvm_1.1-rc2
Message-ID: <20020831221652.D17207@superfly.archi-me-des.de>
References: <20020831201710.B17207@superfly.archi-me-des.de> <20020831212421.C17207@superfly.archi-me-des.de> <3D712013.9070606@ednet.ns.ca>
Mime-Version: 1.0
In-Reply-To: <3D712013.9070606@ednet.ns.ca>; from boutilpj@ednet.ns.ca on Sat, Aug 31, 2002 at 04:59:15PM -0300
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
Date: Sat Aug 31 15:19:30 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Aug 31, 2002 at 04:59:15PM -0300, Patrick Boutilier wrote:
> What about /usr/include/linux/autoconf.h ?

Yes, you're dead right, that symlink was missing. I seem to remember that
usually it is somehow automagically created?! Weird.

Thanks, Frank

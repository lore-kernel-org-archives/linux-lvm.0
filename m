From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] strange behavior with 1.0.5 on Linux 2.4.19?
Message-ID: <20021028203549.GA24302@gw.silicide.dk>
References: <1033579350.6468.61.camel@gopher> <20021004105057.B8575@sistina.com> <1034107599.28928.105.camel@pslgregory> <20021009133650.E23965@sistina.com> <1035782975.3398.128.camel@gopher>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1035782975.3398.128.camel@gopher>
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
Date: Mon Oct 28 14:36:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Oct 27, 2002 at 09:29:35PM -0800, Gregory K. Ade wrote:

[cut]

> So, who do I give what information to so that we can trace down the base
> of this problem, and get a fix?  Ask me for whatever you need from the
> system, and I'll provide it if I can.

I dont know what your problem is, but i run lvm 1.0.5 on a default 2.4.19
without trouble. (any more).
I lvcreate once an hour, though it is a snapshot, and remove it again
the next hour. I've got a script running every minute that extends the
snapshots if they become too small. So, maybe the problem isnt in lvm, but
memory, and it just happens to hit LVM ?


JonB

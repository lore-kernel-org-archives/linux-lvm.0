From: NagyZ <nagyz@piarista-kkt.sulinet.hu>
Subject: Re: [linux-lvm] system crash caused by lvm's fault?
In-Reply-To: <20021021115620.C9466@sistina.com>
Message-ID: <Pine.LNX.4.44.0210211352420.17745-100000@server.piarista-kkt.sulinet.hu>
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
Date: Mon Oct 21 06:54:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 21 Oct 2002, Heinz J . Mauelshagen wrote:

> You need to make sure, that your (disk) power supply is sufficient, sorry.
i have already done it, i just want to be sure.

> 
> > 
> > and an other question:
> > i have a VG from 2 partition. (on 2 HDD)
> > if one fell off, then how can i access the data on the remaining disk?
> 
> LVM2 has a partial activation feature for this case which will activate
> such a partially available volume group.
> 
> Which filesystem or other data is still usable heavily depends on your
> allocation.
> 
when will lvm2 be stable?
how can i say to lvm that use linear (or some good :-) ) allocation, then 
i could use this partial method?

NagyZ 

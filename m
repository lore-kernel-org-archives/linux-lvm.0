From: Donald Thompson <dlt@lunanet.biz>
Subject: Re: [linux-lvm] Any way to remove a PV from LV for backup?
In-Reply-To: <000b01c2504a$f5db57f0$5701a8c0@bomoon>
Message-ID: <Pine.LNX.4.44.0208301443580.29266-100000@junior.lunanet.biz>
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
Date: Fri Aug 30 15:54:21 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 30 Aug 2002, bo wrote:

>  Hello,
>
>  The system has 4 PVs, which belongs to one VG and one LV.
>  I want to remove a disk and replace it with new when the system
>  consumes all of its space then start to use next PV.
>
>  Q1: Is it really possible by LVM concept?

Yes.

> Q2: If I have one extra PV I could use "pvmove", but I do not have.
>         Any way to resolve it?

Assuming you will enough free PE's in the remaining 3 PV's, you should be
able to use pvmove to do this without needing a spare disk to add to the
VG. Look at the first 'EXAMPLE' in the manpage for pvmove.

> Q3: Are there any way to replay each PV(backup PV) independently on
>        the seperate system?

I'm not sure what you mean by 'replay'. If you mean import the volume
group and any LV's that reside on that PV, it depends on how the LV's are
laid out on the PV. If the LV's are stripped across multiple PV's or if an
LV happens to span multiple PV's, then no you can't. I believe its
possible to recover LV's if the entire LV resides on a single PV that was
removed from the VG...but off the top of my head I don't know how. I know
its not as simple as doing a vgimport because it complains about the lack
of the other PV's when your missing PV's that made up the VG.

-Don

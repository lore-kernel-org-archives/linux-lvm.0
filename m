From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] FW: LVM
In-Reply-To: <Pine.LNX.4.44.0206251009190.13871-100000@dragon.inside.ntisys.com>
Message-ID: <Pine.LNX.4.44.0206251408300.962-100000@pzat.meep.org>
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
Date: Tue Jun 25 09:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: grant@fredfern.com.au

On Tue, 25 Jun 2002 bscott@ntisys.com wrote:

> On Tue, 25 Jun 2002, at 8:58am, Montgomery Mouw wrote:
> > I was just wondering if I mount 5 drives using LVM and say the forth drive
> > dies, do I lose the data only on that forth drive or do I lose the data on
> > the whole mount (all 5 drives data)?
>
>   In general, you will lose everything.
>
>   Technically: A drive is used to create a PV (Physical Volume).  One or
> more PVs is used to create an LV (Logical Volume).  If the drive containing
> a PV fails, that PV becomes unavailable.  If an LV needs a PV, and that PV
> is unavailable, the LV will become unavailable as well.
>

I thought changes were planned or done so that if a PV failed the vg could
be force mounted and only the lvs on the unavailable PV would not be
available....

James

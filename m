Subject: Re: [linux-lvm] Pvmove question
Message-ID: <OF1C4B21E3.328FDE29-ON85256AB5.004B8EA6@raleigh.ibm.com>
From: "Kevin M Corry" <corryk@us.ibm.com>
Date: Mon, 27 Aug 2001 08:46:33 -0500
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> On Fri, Aug 24, 2001 at 12:31:18AM +0200, Jean-Eric Cuendet wrote:
> >
> > Hi,
> > I have a pvmove question:
> > In the man page, it's said to be careful with pvmove if you use it
while
> > LVM is in use.
> > I don't really understand what is dangerous and what is safe...
>
> pvmove on a mounted (or otherwise in use) LV might cause curruption of
> your data.

In what cases could pvmove cause corruption on a mounted LV? Looking
at the man page and scanning through pvmove.c, it seems to indicate
that only a system crash during pvmove would corrupt the data. Is
this the only case, or are there others?

If there are other possibilities for corruption, wouldn't it be a
good idea to not allow pvmove's on PV's that contain mounted LVs?
You can figure out all of the LVs that are contained within a PV
using the PE map, and there are a variety of ways in user-space to
determine if a device is mounted (/proc/mounts probably being the
easiest).

> >
> > Could you give me details? Is it safe to do if no LV is mounted?
>
> y
>
> >  Or if
> > vgchange -an is run?
>
> y
>
> - Joe


-Kevin

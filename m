Date: Tue, 28 Aug 2001 09:51:04 +0100
Subject: Re: [linux-lvm] Pvmove question
Message-ID: <20010828095104.E283@btconnect.com>
References: <OF1C4B21E3.328FDE29-ON85256AB5.004B8EA6@raleigh.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF1C4B21E3.328FDE29-ON85256AB5.004B8EA6@raleigh.ibm.com>; from corryk@us.ibm.com on Mon, Aug 27, 2001 at 08:46:33AM -0500
From: Joe Thornber <thornber@btconnect.com>
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

On Mon, Aug 27, 2001 at 08:46:33AM -0500, Kevin M Corry wrote:
> > On Fri, Aug 24, 2001 at 12:31:18AM +0200, Jean-Eric Cuendet wrote:
> > >
> > > Hi,
> > > I have a pvmove question:
> > > In the man page, it's said to be careful with pvmove if you use it
> while
> > > LVM is in use.
> > > I don't really understand what is dangerous and what is safe...
> >
> > pvmove on a mounted (or otherwise in use) LV might cause curruption of
> > your data.
> 
> In what cases could pvmove cause corruption on a mounted LV? Looking
> at the man page and scanning through pvmove.c, it seems to indicate
> that only a system crash during pvmove would corrupt the data. Is
> this the only case, or are there others?

Search back through the list for a response from Andrea Arcangeli.  We
need to track buffer_heads that have been trhough the make_request
function so we can really can flush the LV when suspending io for the
dureation of the move.  If you're not using raw io then the only
problem is a possible deadlock when under high memory pressure.

> If there are other possibilities for corruption, wouldn't it be a
> good idea to not allow pvmove's on PV's that contain mounted LVs?

IMO yes.

- Joe

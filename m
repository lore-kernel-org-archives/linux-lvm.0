Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] Request for misalignment tests
Date: Tue, 3 Jul 2001 09:52:36 -0400
References: <20010626161947.A11918@sistina.com> <15168.33453.645650.476763@rigel.oswf.de> <20010703120138.C22955@sistina.com>
In-Reply-To: <20010703120138.C22955@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20010703135238.CBD9A42109@oscar.casa.dyndns.org>
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
To: linux-lvm@sistina.com, "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>

On July 3, 2001 06:01 am, Heinz J. Mauelshagen wrote:
> On Mon, Jul 02, 2001 at 04:18:21PM +0200, Werner John wrote:
> > Dear Heinz
> >
> > Heinz J. Mauelshagen writes:
> > > Jorg,
> > >
> > > please avoid recent CVS and if possible don't create PVs with
> > > LVM versions > 0.9.1 Beta 5.
> >
> > What if we have already done this some month ago?
>
> It can only have hapend after 0.9.1 Beta 6 came out in March.
> My provided one liner test shows you if it is the case then.
>
> > pvmove until everything is fixed?
>
> After it is fixed and your installation is update to the next LVM release
> yuu should be able to pvmove PEs to other (temporary) PVs which are created
> with new tools and correct alignment.
>
> > Will there be a tool to fix bad PVs in
> > use?
>
> Unlikely :-(


This is going to be a _major_ PITA here.  March to July is a long period.  I could live
with a tolleration mode.   Everything on my system is in LVM (excepting a small recovery
partition).  My largest PV is corrupted...

Hopefully something can be done to make this beta error a little less painfull - Please.

TIA,

Ed Tomlinson

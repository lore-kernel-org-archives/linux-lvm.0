Date: Mon, 26 Jun 2000 09:13:26 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] LVM /dev and /proc problems and change proposal
Message-ID: <20000626091326.B389@hmsysv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <3955A848.D5071D8E@inet.net.nz> <20000625103032.A3124@hmsysv.t-online.de> <3955D87A.590E9C2C@inet.net.nz> <20000625131619.A3679@hmsysv.t-online.de> <3956DF94.218CA65E@inet.net.nz>
Mime-Version: 1.0
In-Reply-To: <3956DF94.218CA65E@inet.net.nz>; from dale@inet.net.nz on Mon, Jun 26, 2000 at 04:44:04PM +1200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dale Kemp <dale@inet.net.nz>
Cc: linux-lvm@msede.com

On Mon, Jun 26, 2000 at 04:44:04PM +1200, Dale Kemp wrote:
> "Heinz J. Mauelshagen" wrote:
> 
> > On Sun, Jun 25, 2000 at 10:01:30PM +1200, Dale Kemp wrote:
> > > > But It dissallows the user to do it and there's still plenty of free namespace
> > > > to find a meaningfull name for the Volume Group.
> > >
> > > I'm refering to the future when a new device gets added that just might
> > > clash with a volume group name that a user has chosen. And we don't know
> > > what users are going to call their volume groups and we don't know what
> > > device names will be created in the future.
> >
> > vgrename(8) is able to address that.
> >
> > >
> > > > There's a preprocessor definition LVM_DIR_PREFIX in the code, which
> > > > supports this already.
> > >
> > > So I see. The simplest solution is to change this default prefix, and have the
> > > lvm stuff self-contained in its own subdirectory.
> >
> > Yes.
> > Please give it a try and tell me if it works.
> 
> Just changing LVM_DIR_PREFIX does not work. I updated code to automatically
> move the old files and directories around but it still doesn't work. The reason is it
> 
> does consistency checks and finds /dev/lvm/.. is not there but is /dev/... and it
> refuses. If the system stored relative names not absolute paths things might be ok,
> ie <VG>/<LV> and never /dev/.../<VG>/<LV>.

We need to change lvrename.c to address this.
As you say the absolute patch of the LV name is stored in the VGDA
but lvrename will complain because it checks for LVM_DIR_PREFIX in
the LV path too.

<SNIP>

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

From: Ralf Eisinger <rei@ihs.uni-stuttgart.de>
Subject: Re: [linux-lvm] RAID extension and lvm
In-Reply-To: <20020712163046.A18338@zealot.blacknet.de>
Message-ID: <Pine.LNX.4.44.0207141635090.22457-100000@poseidon.ihs.uni-stuttgart.de>
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
Date: Sun Jul 14 09:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 12 Jul 2002, Goetz Bock wrote:

>
> While I was instructed to answer RTFM more often, here you go ...
>
> On Fri, Jul 12 '02 at 16:16, Ralf Eisinger wrote:
> > - when I "start" a snaptshot, where is lvm using the disk space, which is
> >   needed to track down the changes user will made during that time?
> it allocates free PEs from the underlying VG
>
> > - Can lvm handle the changing of a disk size? (In our case, lvm will not
> >   recognize, that a disk is added, because the RAID-System offers the
> >   complete disk space as one big disk, so it seems (from the sight of
> >   lvm), that the disk size increases)
> you can extend a PV (man pvresize)
Sorry, but there is no pvresize command. I have searched through the HOWTO
too, but I find nothing.

best regard
Ralf Eisinger

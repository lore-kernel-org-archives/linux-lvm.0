Return-Path: <james@fsck.co.uk>
Date: Thu, 26 Apr 2001 09:49:02 +0100 (BST)
From: A James Lewis <james@fsck.co.uk>
Subject: Re: [linux-lvm] Cannot unmount my /usr partition.....
In-Reply-To: <3AE7DB22.23E9570D@gecpalau.com>
Message-ID: <Pine.LNX.4.33.0104260948570.24898-100000@vortex1.vrtx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

Yup....

On Thu, 26 Apr 2001, Glenn Shannon wrote:

> Actually ALL of my tools for LVM, Reiser and DevFS are in the /sbin dir.
>
> Thanks for the try tho!
>
> Anyone else?
>
> Glenn
> Dirk Heinrichs wrote:
>
> > Glenn Shannon wrote:
> > >
> > > Hi all!
> > >
> > > Great job on LVM...loving it so far..just have a quick question if I
> > > may..
> > >
> > > Boots fine (better than fine!) and devfs reiser and lvm seem to play
> > > well together while they are running...... but upon shutdown I cannot
> > > unmount my /usr partition for some reason it is busy.
> > >
> > > I have hacked the init scripts to let me reboot successfully (as it I=
S a
> > > production machine with automatic reboot times entered in the cron) b=
ut
> > > it cannot deactivate my LVM due to the /usr partition being busy.
> > Hmm, I had this problem sometimes with RH6.x, but w/o LVM. So it may no=
t
> > be related to LVM. On the other hand, where did you put the LVM
> > userspace tools? If they reside in /usr, this may cause your problem.
> > IMHO they belong into /, because they are needed at boot/shutdown time.
> >
> > Hope this helps...
> >
> >         Dirk
> > --
> > Dirk Heinrichs          | Tel:  +49 (0)241 413 260
> > Configuration Manager   | Fax:  +49 (0)241 413 2640
> > QIS Systemhaus GmbH     | Mail: dheinrichs@qis-systemhaus.de
> > J=FClicher Str. 338b      | Web:  http://www.qis-systemhaus.de
> > D-52070 Aachen          | ICQ#: 110037733
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>

A. James Lewis (james@fsck.co.uk)
If your OS needs a virus detector... RUN!!!
=2E..Out and get Linux!

Return-Path: <glenn@gecpalau.com>
Message-ID: <3AE7DB22.23E9570D@gecpalau.com>
Date: Thu, 26 Apr 2001 17:24:02 +0900
From: Glenn Shannon <glenn@gecpalau.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Cannot unmount my /usr partition.....
References: <3AE7D6AA.895E9C79@gecpalau.com> <3AE7DA2B.D79DF1C2@qis-systemhaus.de>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Actually ALL of my tools for LVM, Reiser and DevFS are in the /sbin dir.

Thanks for the try tho!

Anyone else?

Glenn
Dirk Heinrichs wrote:

> Glenn Shannon wrote:
> >
> > Hi all!
> >
> > Great job on LVM...loving it so far..just have a quick question if I
> > may..
> >
> > Boots fine (better than fine!) and devfs reiser and lvm seem to play
> > well together while they are running...... but upon shutdown I cannot
> > unmount my /usr partition for some reason it is busy.
> >
> > I have hacked the init scripts to let me reboot successfully (as it IS a
> > production machine with automatic reboot times entered in the cron) but
> > it cannot deactivate my LVM due to the /usr partition being busy.
> Hmm, I had this problem sometimes with RH6.x, but w/o LVM. So it may not
> be related to LVM. On the other hand, where did you put the LVM
> userspace tools? If they reside in /usr, this may cause your problem.
> IMHO they belong into /, because they are needed at boot/shutdown time.
>
> Hope this helps...
>
>         Dirk
> --
> Dirk Heinrichs          | Tel:  +49 (0)241 413 260
> Configuration Manager   | Fax:  +49 (0)241 413 2640
> QIS Systemhaus GmbH     | Mail: dheinrichs@qis-systemhaus.de
> J=EF=BF=BDlicher Str. 338b      | Web:  http://www.qis-systemhaus.de
> D-52070 Aachen          | ICQ#: 110037733
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

Return-Path: <russell@coker.com.au>
From: Russell Coker <bofh@coker.com.au>
Subject: Re: [linux-lvm] hard drive shock tolerance
Date: Mon, 15 Jan 2001 15:37:24 +1100
References: <Pine.LNX.4.21.0101121331460.13252-100000@lairdtest1.internap.com>
In-Reply-To: <Pine.LNX.4.21.0101121331460.13252-100000@lairdtest1.internap.com>
MIME-Version: 1.0
Message-Id: <01011515372404.01200@lyta>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Scott Laird <laird@internap.com>
Cc: zoo1@corecomm.net

On Saturday 13 January 2001 08:41, Scott Laird wrote:
> On Sat, 13 Jan 2001, Russell Coker wrote:
> > Given a choice I prefer hard drives with lower rotational speeds beca=
use
> > of the lesser heat production.  Read the spec sheets and you'll see t=
hat
> > as a general rule 10K rpm drives use twice as much power as 7200 rpm
> > drives, twice the power =3D=3D twice the heat!
>
> Hmm.  Seagate's current 9GB 7200 RPM drive, the ST39236LC draws 7W when
> idle.  Their current 9 GB 10k RPM drive, the ST39204LC draws 8.5W when
> idle.  IMHO, that's not really very significant anymore, especially whe=
n
> your CPU eats 20-70W.  Both of these numbers are way better then drives
> only a generation or two back -- last year's ST39175 (9 GB, 7200 RPM) d=
rew
> 9.75W when idle.

I've just done some more research on this, IBM Deskstar workstation drive=
s=20
40G:
7200RPM - 6.7W idle
5400RPM - 4.9W idle

IBM UltraStar server drives 36G:
Ultra 160SCSI 10K rpm - 7.4W idle
FCAL 10K rpm - 9.4W idle
Ultra 160SCSI 7200rpm - 8.9W idle


These results surprise me.  It seems that the only way of significantly=20
reducing power by using a lower speed is when using Deskstar IDE drives.

Also I am curious as to why a drive that uses FC-AL will take so much mor=
e=20
power because of it!
My previous message on this topic was based on information that is (now)=20
obviously out of date.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

Return-Path: <jbooth@ccbill.com>
Message-ID: <076301c0e3ef$9ed32320$5300000a@cavecreek.net>
From: "Justin Booth" <jbooth@ccbill.com>
References: <Pine.LNX.4.33.0105231950540.27513-100000@UberGeek.coremetrics.com>
Subject: Re: [linux-lvm] Problem deleteing PV's
Date: Wed, 23 May 2001 18:19:46 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

vgscan seems to only update /etc/lvmtab and /etc/lvmtagb.d
a pvchange -x n /dev/sdxx
results in a
pvchange -- unable to find volume group "/dev/xxxx" (VG not active?)
pvchange -- 0 physical volumes changed / 0 physical volumes already o.k.

on all PV's




----- Original Message -----
From: "Austin Gonyou" <austin@coremetrics.com>
To: <linux-lvm@sistina.com>
Sent: Wednesday, May 23, 2001 5:53 PM
Subject: Re: [linux-lvm] Problem deleteing PV's


> Have you tried a vgscan to see if there are VG's that you don't need? What
> about pvchange -x n /dev/sdxx?
>
> --
> Austin Gonyou
> Systems Architect, CCNA
> Coremetrics, Inc.
> Phone: 512-796-9023
> email: austin@coremetrics.com
>
> On Wed, 23 May 2001, Justin Booth wrote:
>
> > Hello,
> >
> >  I have a problem deleteing 4 PV's that I managed to create None of the
> > PV's are in a VG, and I can't figure out how to get rid of them
> >
> > when I do a pvscan It returns something like this:
> >
> > pvscan -- reading all physical volumes (this may take a while)
> > pvscan -- inactive PV "/dev/sdb" is in no VG [12.16] MB
> > pvscan -- inactive PV "/dev/sdb1" is in no VG [8.54] GB
> > pvscan -- inactive PV "/dev/sdc" is in no VG [12.16] MB
> > pvscan -- inactive PV "/dev/sdc1" is in no VG [8.54] GB
> > pvscan -- total: 4 [17.11 GB] / in use 0 [0] / in no VG:  4 [17.11 GB]
> >
> >
> > How do I get rid of these entries to start over again?
> > I've tried deleteing the partition table and recreating them but a
> > subsequent vgscan always brings them back into pvscan
> >
> >
> >  Thanks much,
> >       Justin Booth
> >
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>

Return-Path: <stevecranage@earthlink.net>
Message-ID: <3B0D1852.8E5008A1@earthlink.net>
Date: Thu, 24 May 2001 08:18:58 -0600
From: Steve Cranage <stevecranage@earthlink.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problem deleteing PV's
References: <200105231825.tgoooa.cef.37tiu8v@emu>
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

I think pvscan looks for the UUID written to the beginning of the disk. I've been deleting PV's by overwriting that label. I don't know exactly where the label is, but doing a dd if=/dev/zero of=/dev/sda bs=1k count=100 does the trick.

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

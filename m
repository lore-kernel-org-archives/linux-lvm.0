Return-Path: <root@srv.sistina.com>
Date: Wed, 20 Jun 2001 15:45:15 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problem if snapshot exists after crash or reboot
Message-ID: <20010620154515.A25048@sistina.com>
References: <4.3.1.1.20010619151359.00afa100@popin.ncl.ac.uk>
Mime-Version: 1.0
In-Reply-To: <4.3.1.1.20010619151359.00afa100@popin.ncl.ac.uk>; from C.R.Ritson@ncl.ac.uk on Tue, Jun 19, 2001 at 03:33:14PM +0100
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

On Tue, Jun 19, 2001 at 03:33:14PM +0100, Chris Ritson wrote:
> I am using linux 2.4.5-ac6 (SMP) which includes lvm 0.91_beta7 as a file 
> server.

2.4.5-ac6 doesn't include all necesarry code to run LVM 0.9.1 Beta 7 ok :-(
which is probably the reason for the problems you are facing.

You still need to create a patch as instructed in INSTALL and PATCHES/README



> I have done no further patching so far. I am hoping to use LVM 
> snapshots for two things:-
> 
> a) To ensure a backup from a quiet filesystem
> 
> b) To offer the users the possibility of looking into yesterday's snapshot 
> for the file that they have just corrupted or deleted. I think this would 
> avoid 95% of all my restore requests.
> 
> I understand that snapshots are not (yet) persistent, but that shouldn't be 
> a problem unless the system is rebooted.

Actually they are already persistent since the 0.9 release :-)

Warning: we are just fixing a snapshot allocation related bug which doesn't
         show up in every case. 0.9.1 Beta 7 might work in this regard in
         your configuration though.


> 
> The problem is that if a snapshot exists and the system is shutdown 
> (running "vgchange -a n" on the way), then the "vgchange -a y" fails with 
> error 9 on the way back up again.

Strange.
The LVM code doesn't produce this error dirrectly.

Could you run "vgchange -ay -d" and provide the output, please?

> I can avoid this if I lvremove the 
> snapshots on the way down, but this would not help if the power failed or 
> the system crashed.
> I need something that can fix this as the system comes 
> up.

As mentioned:
reason probably is, that you've got an unpatched kernel which
still needs LVM updates in order to work correctly.

> My current idea is to run vgscan to get a list of volume groups, and 
> then to run vgcfgrestore on the first listed volume group that has failed 
> to activate, repeating until all volume groups can be activated. This is 
> messy and may be dangerous. It also requires knowlege of which physical 
> device to use for each volume group. I don't think this is easily available 
> other than by using some sort of consistant naming scheme.

"vgcfgrestore -ll" lists all the PV pathes you were using.
In case you didn't change your hardware configuration you can go with that
information for the crash case.

With a correctly patched kernel there's no need to do the trick you
propose, because LVM should come up correctly with persistent snapshots.

Regards,
Heinz    -- The LVM Guy --

> 
> Comments and advice would be welcome.
> 
> Chris Ritson
> --
> EMAIL:	C.R.Ritson@newcastle.ac.uk	POST:	Chris Ritson,
> PHONE:	+44 191 222 8175			Department of Computing Science,
> FAX :	+44 191 222 8232				University of Newcastle upon Tyne,
> ROOM:	618 Claremont Bridge (the Mill)		United Kingdom NE1 7RU.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

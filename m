Return-Path: <root@srv.sistina.com>
Date: Wed, 16 May 2001 10:25:06 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How to read internal physical volume number.
Message-ID: <20010516102506.B11984@sistina.com>
References: <3B01D28F.6FBB5BDD@earthlink.net>
Mime-Version: 1.0
In-Reply-To: <3B01D28F.6FBB5BDD@earthlink.net>; from stevecranage@earthlink.net on Tue, May 15, 2001 at 07:06:23PM -0600
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

On Tue, May 15, 2001 at 07:06:23PM -0600, Steve Cranage wrote:
> I have a configuration with multiple paths to each pv, and need to sort
> them out so I know which device names are alternate paths to the same
> physical device. I had planned on using the internal serial number
> written to the pv's  when a pvcreate is done.

I assume you mean the PV number here which actually sits in the 4th filed
of the pvdisplay output.

For eg.
/dev/sdb1:vg00:8883882:1:1:2:1:4096:1084:0:1084:VYJ317-t4in-pYv9-eHnu-*                   ^^^^         ^

-or-

/dev/sdc1:vg00:8803557:2:1:2:1:4096:1074:633:441:12x4ti-BN3r-Oshu-MazC-*
          ^^^^         ^

Because the second field tells you, that both PVs belong to the same VG (named
"vg00" in this example) you can figure out that /dev/sdb1 points to the PV
with internal number 1 and /dev/sdc1 points to PV #2.

You can even use the last field of the " pvdisplay -c" output to
base your search on PV UUIDs.

BTW: the library function pv_read_all_pv_of_vg() which is used to read in
     the PV metadata for the VG sorts out multiple access pathes today.
     This will change in a future LVM version which will support multi pathing.

>
> The man pages for pvdisplay seem to indicate this is in the 4th field of
> the output with the -c option, but alas, the -c option appears to not be
> coded as it doesn't affect the output of the pvdisplay command.

It should be (see my above example output).
But you pointed me to a lack in the manual page. The 12th field (the PV UUID)
wasn't discribed. Fixed it. Thanks.

> How else
> can I get the internal serial number?

pvscan -u

plus some shell/perl magic .

> TIA
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

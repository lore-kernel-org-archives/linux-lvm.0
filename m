From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] [Fwd: Best way to create a 540GB LVM Volume?]
Message-ID: <20020625112937.A14860@sistina.com>
References: <1024945914.6875.16.camel@UberGeek>
Mime-Version: 1.0
In-Reply-To: <1024945914.6875.16.camel@UberGeek>; from austin@coremetrics.com on Mon, Jun 24, 2002 at 02:11:54PM -0500
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
Date: Tue Jun 25 04:37:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Austin,

the maximum of 450GB you mention below sounds strange.

did you use "vgcreate -s physicalextentsize ..." when you created
the volume group?

Unless you set a larger extent size than the default of 4MB with the -s option,
you can't create logical volumes larger than ~256GB.

"vgcreate -s 32m ..." for eg. would enable ~2TB maximum logical volume size
which is the maximum per single block device Linux up to 2.4 supports anyway.

In LVM2 (please check the beta code on our web site www.sistina.com) there'll
be no extent size related constraints any longer, because we support additional
ondisk formats in parallel. LVM2 is format compatible with the LVM1 format
as well.

Regards,
Heinz    -- The LVM Guy --


On Mon, Jun 24, 2002 at 02:11:54PM -0500, Austin Gonyou wrote:
> 
> -- 
> Austin Gonyou <austin@coremetrics.com>
> Coremetrics, Inc.

Content-Description: Forwarded message - Best way to create a 540GB LVM Volume?
> Subject: Best way to create a 540GB LVM Volume?
> From: Austin Gonyou <austin@coremetrics.com>
> To: Linux LVM Mailinglist <linux-lvm@sistina.com>
> Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-MXQT1CJ20ta7jJZf0S5C"
> Organization: Coremetrics, Inc.
> X-Mailer: Ximian Evolution 1.1.0.99 (Preview Release)
> Date: 24 Jun 2002 14:07:07 -0500
> Message-Id: <1024945627.6892.7.camel@UberGeek>
> Mime-Version: 1.0
> 
> I've got 14 FC1 disks in a PV660F. I want to take 7 of them and make a
> large volume. I can't seem to make a > 450 GB volume though, even though
> lvdisplay is showing xxMB PE free. 
> 
> I'm using default 4mb and also 8mb extentsize when creating the VG.
> Please advise.
> 
> 
> -- 
> Austin Gonyou <austin@coremetrics.com>
> Coremetrics, Inc.

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

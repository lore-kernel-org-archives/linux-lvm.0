Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2QGihj29187
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2004 11:44:43 -0500
Subject: Re: [linux-lvm] Somewhat offtopic: Strange umount problem ....
From: David Johnston <david@littlebald.com>
In-Reply-To: <200403260800.21301.krienke@uni-koblenz.de>
References: <200403251534.47502.krienke@uni-koblenz.de>
	<1080238182.5985.3.camel@grandmother.littlebald.com>
	<200403260800.21301.krienke@uni-koblenz.de>
Message-Id: <1080319473.16404.3.camel@grandmother.littlebald.com>
Mime-Version: 1.0
Date: 26 Mar 2004 11:44:33 -0500
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Rainer Krienke <krienke@uni-koblenz.de>
Cc: linux-lvm@sistina.com

On Fri, 2004-03-26 at 02:00, Rainer Krienke wrote:
> On Donnerstag, 25. M=EF=BF=BDrz 2004 19:09, David Johnston wrote:
> > On Thu, 2004-03-25 at 09:34, Rainer Krienke wrote:
> > > I have a problem with 3 server machines
> > > I am running 3 NFS and SMB servers which run perfectly stable but
> > > the filesystems which contain user directories cannot be umounted
> >
> > Rainer,
> > nfsd will do this.  Make sure all of your NFS servers are stopped before
> > you try to umount your filesystems.
> >
> > Does that help?
>=20
> Thanks for the hint, but nfsd has already been stopped
> Here is a list of all processes still running in single user=20

Rainer,=20
could it be your multipath daemon?  In single-user mode, I would expect
multipathd and the migration_CPUx daemons to shut down.

--=20
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC

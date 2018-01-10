Date: Wed, 10 Jan 2018 11:25:29 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20180110172529.GF24129@redhat.com>
References: <bc1ccc58-1771-183b-2d40-1d8b198fb8b5@suse.com>
	<20180109160622.GB24472@redhat.com>
	<0c7ad5f6-0399-e890-0205-281c0b9b9405@suse.com>
	<e644fe30-4a22-225e-9f70-1d8bc48b5d7e@redhat.com>
	<04ad2444-ad44-3442-42cb-36b1ed18e484@suse.com>
	<e1d77d74-2294-fefb-2815-0e0ef38213a6@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e1d77d74-2294-fefb-2815-0e0ef38213a6@redhat.com>
Subject: Re: [linux-lvm] The benefits of lvmlockd over clvmd?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: zkabelac@redhat.com, linux-lvm@redhat.com
Cc: Eric Ren <zren@suse.com>

On Wed, Jan 10, 2018 at 04:35:56PM +0100, Zdenek Kabelac wrote:
> > > Also ATM=EF=BF=BD 'lvmetad' can't be used even with lvmlockd - simply
> > > because we are not (yet) capable to handle 'udev' around the cluster
> > > (and it's not clear we ever will).
> >=20
> > This sentence surprises me much. According to manpage of lvmlockd, it

It surprises me too, since I developed lvmlockd and lvmetad features
precisely to make it work.

> > seems clear that lvmlockd can work with lvmetad now.
> > IIRC, it's not the first time you mentioned about "cluster udev". It
> > gives me a impression that the currect udev system is not
> > 100% reliable for shared disks in cluster, no matter if we use lvmetad
> > or not, right? If so, could you please give an example
> > scenario where lvmetad may not work well with lvmlockd?
>
> The world of udevd/systemd is complicated monster - which has no notation=
 for
> handling bad/duplicate/.... devices and so on.
>=20
> Current design of lvmetad is not sufficient to live in ocean of bugs in t=
his
> category - so as said - ATM it's highly recommend to keep lvmetad off in
> clusters.

There are indeed plenty of problems with lvmetad, which is why I've been
trying to get us to get rid of lvmetad, and improved disk scanning to be
so much more efficient:
https://sourceware.org/git/?p=3Dlvm2.git;a=3Dshortlog;h=3Drefs/heads/dev-dc=
t-new-scan-32

However, you have not pointed out any specific problems unique to lvmlockd
with lvmetad.

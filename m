From: Sebastian Kollmann <Sebastian.Kollmann@T-Online.de>
Subject: Re: [linux-lvm] LVM kernel patch request
Date: Thu, 4 Oct 2001 13:25:35 +0200
References: <01100412070703.01245@seven.home.sekosystems.com> <20011004131028.B26631@tolppa.kotisivupalvelu.fi>
In-Reply-To: <20011004131028.B26631@tolppa.kotisivupalvelu.fi>
MIME-Version: 1.0
Message-Id: <01100413253504.01245@seven.home.sekosystems.com>
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

Am Donnerstag,  4. Oktober 2001 12:10 schrieben Sie:
> On Thu, Oct 04, 2001 at 12:07:07PM +0200, Sebastian Kollmann wrote:
> > I need a LVM patch, witch is working with a 2.4.5-xfs-1.0.1 kernel on
> > RedHat 7.1.
> > I got the xfs patches from
> > http://oss.sgi.com/projects/xfs/patchlist.html.
>
> All the SGI kernels I've had have LVM in them.
> Or is it that you want a newer one?

Yes, I was trying lvm-1.0.1-rc4-2.4.5.patch. I don't know for shure the=20
version that is included in the original kernel, but I think it isn't worki=
ng=20
with the latest LVM tools (lvm-1.0.1-rc4), because I get core dumps with=20
lvcreate.

> First thing you might try reading the patch. If you're lucky, they
> change different bits and it's just a matter of line numbers and you can
> make the changes (and/or a new patch) easily.

Sorry, but I don't have much experiences with kernel patching. I would do i=
t=20
if =EF=BF=BD could. ;-(

Thanks, Sebastian.

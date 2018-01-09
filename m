Date: Tue, 9 Jan 2018 09:42:39 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20180109154239.GA24472@redhat.com>
References: <f1be22d0-6bf3-e282-9692-92452f67122d@suse.com>
	<20180102171034.GC26695@redhat.com>
	<be5b9aa6-d9fb-2e45-d250-9736d1ae49a5@suse.com>
	<20180103150713.GA16217@redhat.com>
	<c4b0357d-2910-1c5f-7ffc-5cfbdecd4b11@suse.com>
	<526766b0-c099-9c7c-9df7-4f48c23d2b24@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <526766b0-c099-9c7c-9df7-4f48c23d2b24@suse.com>
Subject: Re: [linux-lvm] lvmlockd: about the limitation on lvresizing the LV
 active on multiple nodes
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
To: Eric Ren <zren@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jan 09, 2018 at 10:42:27AM +0800, Eric Ren wrote:
> > I've tested your patch and it works very well.=EF=BF=BD Thanks very muc=
h.
>=20
> Could you please consider to push this patch upstream?

OK

> Also, Is this the same case for pvmove as lvresize? If so, can we also
> work out a similar patch for pvmove?

Running pvmove on an LV active on multiple hosts could be allowed with the
same kind of patch.  However, it would need to use cmirror which we are
trying to phase out; the recent cluster raid1 has a more promising future.
So I think cmirror should be left in the clvm era and not brought forward.

Dave

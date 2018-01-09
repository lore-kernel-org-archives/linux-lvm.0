Date: Tue, 9 Jan 2018 10:06:22 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20180109160622.GB24472@redhat.com>
References: <bc1ccc58-1771-183b-2d40-1d8b198fb8b5@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <bc1ccc58-1771-183b-2d40-1d8b198fb8b5@suse.com>
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
To: Eric Ren <zren@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jan 09, 2018 at 11:15:24AM +0800, Eric Ren wrote:
> Hi David,
>=20
> Regarding the question of the subject, I can think of three main benefits=
 of
> lvmlockd over clvmd:
>=20
> - lvmlockd supports two cluster locking plugins: dlm and sanlock. sanlock
> plugin can supports up to ~2000 nodes
> that benefits LVM usage in big virtulizaton/storage cluster,

True, although it's never been tried anywhere near that many.  The main
point hiding behind the big number is that hosts are pretty much unaware
of each other, so adding more doesn't have any affect, and when something
happens to one, others are unaffected because they are unaware.

> while dlm plugin fits HA clsuter.
>=20
> - lvmlockd has better design than clvmd. clvmd is command-line level based
> locking system, which means the
> =EF=BF=BDwhole LVM software will get hang if any LVM command gets dead-lo=
cking
> issue. However, lvmlockd is *resources* based
> cluster locking. The resources to protect is VG and LV so that the deadlo=
ck
> issue will be isolated inside the resource and
> operations on other VG/LV can still proceed.
>=20
> - lvmlockd can work with lvmetad.
>=20
> But, I may be wrong in some points. Could you please help correct me and
> complete the benefit list?

To me the biggest benefit is the design and internal implementation, which
I admit don't make for great marketing.  The design in general follows the
idea described above, in which hosts fundamentally operate unaware of
others and one host never has any effect on another.  That's diametrically
opposite to the original clvm "single system image" design in which
everything that happens is in theory meant to be happening everywhere.

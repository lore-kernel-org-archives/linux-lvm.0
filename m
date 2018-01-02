Date: Tue, 2 Jan 2018 10:15:39 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20180102161539.GB26695@redhat.com>
References: <4c07ee03-0ff8-9d41-ef93-c47e5325bb1c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4c07ee03-0ff8-9d41-ef93-c47e5325bb1c@suse.com>
Subject: Re: [linux-lvm] lvmlockd manpage: prevent concurrent activation of
 logical volumes?
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
Cc: roger zhou <zzhou@suse.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Dec 28, 2017 at 04:30:09PM +0800, Eric Ren wrote:
> Hi David,
>=20
> I's afraid the statement below in description section of lvmlockd manpage:
>=20
> "
> =EF=BF=BD prevent concurrent activation of logical volumes
> "
>=20
> is easy for normal user to mistake it as: wow, lvmlockd doesn't support
> active-active LV on multiple nodes?

Hi, I see what you mean.  What that point was trying to summarize is
"prevent conflicting activation of LVs".  I may just make that one
word change.
Thanks

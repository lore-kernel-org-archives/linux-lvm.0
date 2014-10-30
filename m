Date: Thu, 30 Oct 2014 18:45:36 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20141030224536.GC654@redhat.com>
References: <CACjhXxfZak7n=zBvfPX3FtpZeBM88eBm8RnweguOZjpwdoG0ew@mail.gmail.com>
	<590C03FA-0051-4DCF-B568-C0A47B16AA49@redhat.com>
	<CACjhXxdyw1Sx4iMKT7dMUFTRwd--zLpt8BK8iyedCj_bPiTCWg@mail.gmail.com>
	<99ACAC11-1051-4C96-A81F-E4B0845D3145@redhat.com>
	<CACjhXxcvqtBJ2h2efNRDu2FbhQ=v+S_X3NtBOzUb2rXo2L+9og@mail.gmail.com>
	<CF6395F0-64FC-4E39-BDD7-68A98AB6FEC2@redhat.com>
	<CACjhXxdVFNT=tkaeoRv=6dijeh6sov6jrXUm35XVnk4b48odzg@mail.gmail.com>
	<CACjhXxe+f4CFik7c_HLkZ_U5XyT+P3gWiknzrNWOW6tbyu20XA@mail.gmail.com>
	<45156BF3-4E7B-4F7B-82A5-187FC5970D4D@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <45156BF3-4E7B-4F7B-82A5-187FC5970D4D@redhat.com>
Subject: Re: [linux-lvm] Setting up LVM cache causes crash
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
Content-Type: text/plain; charset="windows-1252"
To: Brassow Jonathan <jbrassow@redhat.com>
Cc: device-mapper development <dm-devel@redhat.com>, data <data@cogolabs.com>, Elvin Cako <ecako@cogolabs.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Oct 30 2014 at 12:41pm -0400,
Brassow Jonathan <jbrassow@redhat.com> wrote:

> Elvin,
>=20
> One of the bugs I referenced earlier has been fixed upstream.  You may ne=
ed to grab the latest upstream LVM and kernel sources.  If you are waiting =
to see this fixed in a distribution, the earliest is likely to be rhel7.1 (=
followed by rhel6.7).
>=20
> If you continue to have issues like this, please contact the dm-devel mai=
ling list (CC=E2=80=99ed on this mail).

We actually would rather a RHEL bug get a proper redhat bugzilla, but
yes, this issue that Elvin reported against RHEL7 appears identical to
this BZ: https://bugzilla.redhat.com/1080894

I have no initial reason to believe this issue is RHEL-only (meaning it
likely exists upstream too). I've gone ahead and made the bug public now.

Message-ID: <52AB1088.6000003@redhat.com>
Date: Fri, 13 Dec 2013 14:50:00 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CA+Q0qhddVT+JH9__r7cnONZmr7EE9mFnV8ax-e=ObyNc8hAong@mail.gmail.com>	<20131211141911.GF4894@agk-dp.fab.redhat.com>
	<CA+Q0qhcU8Wbu8oGaCm13m9-LR3nz3am+5zAQ+B8PsCk7eBPG=w@mail.gmail.com>
In-Reply-To: <CA+Q0qhcU8Wbu8oGaCm13m9-LR3nz3am+5zAQ+B8PsCk7eBPG=w@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] How to place LVM2 metadata to other disks which
 don't belong to any volume group?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, George Brian <biangw@gmail.com>

On 12/13/2013 08:15 AM, George Brian wrote:
> Hi=EF=BC=8C
>=20
> thank for your reply.
>=20
> I read about "lvm.conf" and "man pvcreate" and practice like your
> instruction.
> but it's hard to meet my expection.
>=20
> I do as follows:
> 1, setting lvm.conf to dirs
> 2, pvcreate --pvmetadatacopies 0
> 3, vgcreate on pv=20
> Aborting vg_write: No metadata areas to write to!
>=20

Make sure you have the "metadata" section uncommented for the
"dirs" setting to take effect.

--=20
Peter

References: <MEAPR01MB502904BB1C62BCAEDA77544FC28D0@MEAPR01MB5029.ausprd01.prod.outlook.com>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <8fb5fa67-1b56-7baf-e8c9-b422c5c8b443@redhat.com>
Date: Thu, 3 Jan 2019 15:09:16 +0100
MIME-Version: 1.0
In-Reply-To: <MEAPR01MB502904BB1C62BCAEDA77544FC28D0@MEAPR01MB5029.ausprd01.prod.outlook.com>
Content-Language: en-MW
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] how to copy a snapshot,
 or restore snapshot without deleting it
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, "Davis, Matthew" <Matthew.Davis.2@team.telstra.com>

On 1/3/19 5:46 AM, Davis, Matthew wrote:
> Hi,
>=20
> I want to restore a snapshot without deleting the snapshot.

Hi, I think this should be possible using thin snapshots - snapshot the=20
snapshot you want to restore, and merge the snapshot - may be not=20
perfect, but it is at least possible. This is fast, as there is no need=20
to write huge amounts of data, it is just a switching tree's root away=20
(or very close to it.)

Perhaps more convenient alternative is to use boom boot manager=20
(boom-boot package available on rhel8+ and fedora27+). Not sure it is=20
available in ubuntu/debian.

NOTE:

*Thin pools*

When using thin pools make sure you have enough space and you do not run=20
out of space in data and metadata devices, or you risk serious trouble.

1. you must enable monitoring and threshold for extending thin pool.
2. using recent lvm2 2.02.* releases is recommended.

*Boom*

Boom also requires a minor change in initramfs to pass `-K` option to=20
lvchange to allow activation of volumes with skip activation flag.

-- Martian


>=20
> My use case is that I'm experimenting with a lot of different drivers, ke=
rnel modules, and file modifications all over my machine.
> I want to
> 1. take a snapshot of the working system
> 2. make changes
> 3. restore the snapshot (` sudo lvconvert --merge /dev/ubuntu-vg/$SNAPSHO=
T` then reboot)
> 4. make new changes
> 5. restore to the snapshot again
>=20
> The problem is that step 3 deletes the snapshot, so step 5 fails.
>=20
> My current workaround is:
> 1. take a snapshot of the working system
> 2. make changes
> 3. restore the snapshot (` sudo lvconvert --merge /dev/ubuntu-vg/$SNAPSHO=
T` then reboot)
> 4. Wait 1.5 hours, without making any changes to the machine
> 5. Take a new snapshot, with the same name as the original
> 6. make new changes
> 7. restore to the snapshot
>=20
> This is not great because:
> * I sometimes forget to do step 5
> * I can't take a snapshot of the volume while it is still merging. This t=
akes 1.5 hours. I want to be able to restore my snapshots multiple times pe=
r day
>=20
>=20
> Is there a flag I can add to `lvconvert` to make it not delete the snapsh=
ot?
> Alternatively, is there a way I can make a copy of the snapshot before I =
restore it?
>=20
> It looks like someone else asked this question 10 years ago.
> https://www.redhat.com/archives/linux-lvm/2008-November/msg00000.html
> Has this problem been solved since then?
>=20
> Thanks,
> Matt Davis
>=20
> Technical Specialist
> Telstra | Product Strategy & Innovation - Telstra Labs | Programmable Inf=
rastructure
> E =C2=A0Matthew.Davis.2@team.telstra.com
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20

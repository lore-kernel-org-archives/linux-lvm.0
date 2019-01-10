From: "Davis, Matthew" <Matthew.Davis.2@team.telstra.com>
Date: Thu, 10 Jan 2019 06:23:45 +0000
Message-ID: <MEAPR01MB5029BFA4227BCA2DD60501A5C2840@MEAPR01MB5029.ausprd01.prod.outlook.com>
References: <MEAPR01MB502904BB1C62BCAEDA77544FC28D0@MEAPR01MB5029.ausprd01.prod.outlook.com>
	<8fb5fa67-1b56-7baf-e8c9-b422c5c8b443@redhat.com>
In-Reply-To: <8fb5fa67-1b56-7baf-e8c9-b422c5c8b443@redhat.com>
Content-Language: en-US
MIME-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"
To: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and
	development <linux-lvm@redhat.com>

Hi Marian,

I'm trying to do it with thin snapshots now. It's all very confusing, and I=
 can't get it to work.
I've read a lot of the documentation about thin stuff, and it isn't clear w=
hat's happening.

I took a snapshot with

    sudo lvcreate -s --name mySnap1 centos/root

Then I copied that snapshot with

    sudo lvcreate -s --name mySnap2 centos/mySnap1

When I try to restore mySnap1 it says:

    $sudo lvconvert --merge centos/mySnap1
    centos/mySnap1 is not a mergeable logical volume

The same happens if I use `--mergethin`.
When I try to restore mySnap2 it just "merges" it into mySnap1. I'm trying =
to merge it into root. I've looked through the man pages and can't find any=
 destination argument.

    $ sudo lvconvert --merge centos/fresh2
    Volume centos/fresh2 replaced origin centos/fresh.

When I merged mySnap2 into mySnap1 and then merged that into root, and rebo=
oted, it didn't actually merge. The files are not as they were when I made =
mySnap1, and `lvs` shows mySnap1 still exists. And if I try to run the merg=
e command again it says=20

    $ sudo lvconvert --merge centos/mySnap1
    Command on LV centos/mySnap1 is invalid on LV with properties: lv_is_me=
rging_origin .
    Command not permitted on LV centos/mySnap1.

What is `lv_is_merging_origin` ? It doesn't appear when I run `lvs`, `lvdis=
play`, `pvdisplay`, `man lvmthin` or `man lvm`.
The snapshot should have taken about 20 bytes of differences, so I don't ex=
pect it would take very long to restore.
How can I check on the status of the merge? For thick volumes too, I couldn=
't find a way to check, other than just polling the command to create a new=
 snapshot.

What is a "thin snapshot"? I thought the whole point of LVM snapshots was t=
hat they only store the changes in the data.
e.g. If I snapshot a 100GB volume and then add a 1GB file, my snapshot is o=
nly 1GB big, not 100GB. So aren't snapshots already thin?

Also, when I take any snapshot on my thinly provisioned system, I get some =
warning about thresholds and auto-extending.
What is "auto-extending"? I thought the whole point of thin volumes/pools i=
s that the volume only takes up as much space as it needs. If more data is =
added, it takes up more space automatically.=20
I think I've already allocated all my physical disks to this thin pool, so =
what could "auto-extend" mean?

Thanks,
Matt

-----Original Message-----
From: Marian Csontos [mailto:mcsontos@redhat.com]=20
Sent: Friday, 4 January 2019 1:09 AM
To: LVM general discussion and development <linux-lvm@redhat.com>; Davis, M=
atthew <Matthew.Davis.2@team.telstra.com>
Subject: Re: [linux-lvm] how to copy a snapshot, or restore snapshot withou=
t deleting it

On 1/3/19 5:46 AM, Davis, Matthew wrote:
> Hi,
>=20
> I want to restore a snapshot without deleting the snapshot.

Hi, I think this should be possible using thin snapshots - snapshot the sna=
pshot you want to restore, and merge the snapshot - may be not perfect, but=
 it is at least possible. This is fast, as there is no need to write huge a=
mounts of data, it is just a switching tree's root away (or very close to i=
t.)

Perhaps more convenient alternative is to use boom boot manager (boom-boot =
package available on rhel8+ and fedora27+). Not sure it is available in ubu=
ntu/debian.

NOTE:

*Thin pools*

When using thin pools make sure you have enough space and you do not run ou=
t of space in data and metadata devices, or you risk serious trouble.

1. you must enable monitoring and threshold for extending thin pool.
2. using recent lvm2 2.02.* releases is recommended.

*Boom*

Boom also requires a minor change in initramfs to pass `-K` option to lvcha=
nge to allow activation of volumes with skip activation flag.

-- Martian


>=20
> My use case is that I'm experimenting with a lot of different drivers, ke=
rnel modules, and file modifications all over my machine.
> I want to
> 1. take a snapshot of the working system 2. make changes 3. restore=20
> the snapshot (` sudo lvconvert --merge /dev/ubuntu-vg/$SNAPSHOT` then=20
> reboot) 4. make new changes 5. restore to the snapshot again
>=20
> The problem is that step 3 deletes the snapshot, so step 5 fails.
>=20
> My current workaround is:
> 1. take a snapshot of the working system 2. make changes 3. restore=20
> the snapshot (` sudo lvconvert --merge /dev/ubuntu-vg/$SNAPSHOT` then=20
> reboot) 4. Wait 1.5 hours, without making any changes to the machine=20
> 5. Take a new snapshot, with the same name as the original 6. make new=20
> changes 7. restore to the snapshot
>=20
> This is not great because:
> * I sometimes forget to do step 5
> * I can't take a snapshot of the volume while it is still merging.=20
> This takes 1.5 hours. I want to be able to restore my snapshots=20
> multiple times per day
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
> Telstra | Product Strategy & Innovation - Telstra Labs | Programmable=20
> Infrastructure E =C2=A0Matthew.Davis.2@team.telstra.com
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20

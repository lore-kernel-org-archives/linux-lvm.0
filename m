References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
Date: Tue, 12 Sep 2017 13:46:51 +0200
MIME-Version: 1.0
In-Reply-To: <9115414464834226be029dacb9b82236@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 11.9.2017 v 15:46 Xen napsal(a):
> Zdenek Kabelac schreef op 11-09-2017 15:11:
>=20
>> Thin-provisioning is - about 'postponing'=EF=BF=BD available space to be
>> delivered in time
>=20
> That is just one use case.
>=20
> Many more people probably use it for other use case.
>=20
> Which is fixed storage space and thin provisioning of available storage.
>=20
>> You order some work which cost $100.
>> You have just $30, but you know, you will have $90 next week -
>> so the work can start....
>=20
> I know the typical use case that you advocate yes.
>=20
>> But it seems some users know it will cost $100, but they still think
>> the work could be done with $10 and it's will 'just' work the same....
>=20
> No that's not what people want.
>=20
> People want efficient usage of data without BTRFS, that's all.


What's wrong with BTRFS....

Either you want  fs & block layer tied together - that the btrfs/zfs approa=
ch

or you want

layered approach with separate 'fs' and block layer  (dm approach)

If you are advocating here to start mixing 'dm' with 'fs' layer, just
because you do not want to use 'btrfs' you'll probably not gain main tracti=
on=20
here...

>=20
>>> File system level failure can also not be critical because of using=20
>>> non-critical volume because LVM might fail even though filesystem does =
not=20
>>> fail or applications.
>>
>> So my Laptop machine has 32G RAM - so you can have 60% of dirty-pages
>> those may raise pretty major 'provisioning' storm....
>=20
> Yes but still system does not need to crash, right.

We  need to see EXACTLY which kind of crash do you mean.

If you are using some older kernel - then please upgrade first and
provide proper BZ case with reproducer.

BTW you can imagine an out-of-space thin-pool with thin volume and filesyst=
em=20
as a FS, where some writes ends with 'write-error'.


If you think there is OS system which keeps running uninterrupted, while=20
number of writes ends with 'error'  - show them :)  - maybe we should stop =

working on Linux and switch to that (supposedly much better) different OS..=
..


>> But we are talking about generic case here no on some individual sub-cas=
es
>> where some limitation might give you the chance to rescue better...
>=20
> But no one in his right mind currently runs /rootvolume out of thin pool =
and=20
> in pretty much all cases probably it is only used for data or for example=
 of=20
> hosting virtual hosts/containers/virtualized environments/guests.

You can have different pools and you can use rootfs  with thins to easily t=
est=20
i.e. system upgrades....

> So Data use for thin volume is pretty much intended/common/standard use c=
ase.
>=20
> Now maybe amount of people that will be able to have running system after=
 data=20
> volumes overprovision/fill up/crash is limited.

Most thin-pool users are AWARE how to properly use it ;)  lvm2 tries to=20
minimize (data-lost) impact for misused thin-pools - but we can't spend too=
=20
much effort there....

So what is important:
'commited' data (i.e. transaction database) are never lost
fsck after reboot should work.

If any of these 2 condition do not work - that's serious bug.

But if you advocate for continuing system use of out-of-space thin-pool - t=
hat=20
I'd probably recommend start sending patches...  as an lvm2 developer I'm n=
ot=20
seeing this as best time investment but anyway...


> However, from both a theoretical and practical standpoint being able to j=
ust=20
> shut down whatever services use those data volumes -- which is only possi=
ble=20

Are you aware there is just one single page cache shared for all devices
in your system ?


> if base system is still running -- makes for far easier recovery than any=
thing=20
> else, because how are you going to boot system reliably without using any=
 of=20
> those data volumes? You need rescue mode etc.

Again do you have use-case where you see a crash of data mounted volume
on overfilled thin-pool ?

On my system - I could easily umount such volume after all 'write' requests
are timeouted (eventually use thin-pool with --errorwhenfull y   for instan=
t=20
error reaction.

So please can you stop repeating overfilled thin-pool with thin LV data vol=
ume=20
kills/crashes machine - unless you open BZ and prove otherwise -  you will =

surely get 'fs' corruption  but nothing like crashing OS can be observed on=
 my=20
boxes....

We are here really interested in upstream issues - not about missing bug fi=
xes=20
  backports into every distribution  and its every released version....


> He might be able to recover his system if his system is still allowed to =
be=20
> logged into.

There is no problem with that as long as  /rootfs has consistently working =
fs!

Regards

Zdene

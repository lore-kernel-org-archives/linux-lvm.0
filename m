References: <MEAPR01MB502904BB1C62BCAEDA77544FC28D0@MEAPR01MB5029.ausprd01.prod.outlook.com>
	<8fb5fa67-1b56-7baf-e8c9-b422c5c8b443@redhat.com>
	<MEAPR01MB5029BFA4227BCA2DD60501A5C2840@MEAPR01MB5029.ausprd01.prod.outlook.com>
	<29ace3ab-dbc7-ec32-867e-c3c875c79851@redhat.com>
	<SYBPR01MB3931B86CFAE9FB42210B293CC2800@SYBPR01MB3931.ausprd01.prod.outlook.com>
	<691ff9d7-78c3-b36d-7153-b54c589bb12f@redhat.com>
	<SYBPR01MB3931031A54431A1F999F31B4C2810@SYBPR01MB3931.ausprd01.prod.outlook.com>
	<1d9280fc-6350-1ac8-f44f-453aef02a42e@redhat.com>
	<SYBPR01MB3931927F2E7B62070F84C040C2830@SYBPR01MB3931.ausprd01.prod.outlook.com>
	<690f7e10-f146-202f-56b2-2e245bcc001b@redhat.com>
	<SYBPR01MB393109FBE5C800688A72F90BC29C0@SYBPR01MB3931.ausprd01.prod.outlook.com>
	<17262222-82a9-e5cc-5c2c-13e11d424644@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <935364b3-a535-fddc-bf6c-120b46719e2f@redhat.com>
Date: Mon, 28 Jan 2019 12:49:31 +0100
MIME-Version: 1.0
In-Reply-To: <17262222-82a9-e5cc-5c2c-13e11d424644@redhat.com>
Content-Language: en-US
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, "Davis, Matthew" <Matthew.Davis.2@team.telstra.com>

Dne 21. 01. 19 v 11:32 Zdenek Kabelac napsal(a):
> Dne 18. 01. 19 v 1:53 Davis, Matthew napsal(a):
>> Hi Zdenek,
>>
>> I assumed that LVM thin snapshots would work like git branches.
>> Since git also uses diffs on the backend, and git is popular with=20
>> developers, the same kind of behaviour seems reasonable to me.
>>
>=20
> Hi
>=20
> There is very good reason why the git is not really a good tool for stori=
ng=20
> binary data...
>=20
> Your use-case is 'very specific' sub-case of many different usability=20
> scenarios you can do with lvm2 -=EF=BF=BD so while you might see some pot=
ential=20
> benefit if the lvm2 would work more closely to git logic,
> it would look terrible in many other situations.
>=20

Hi

Adding some more thoughts here - we can probably give user an option to=20
control this - particularly in this case  - how about something like:

lvconvert --mergesnapshot --keeporigin y|n

so if user would specify 'y' - lvm2 would relink/preserve merged snapshot a=
s=20
an origin for all other existing snapshots of the old origin - this would m=
ake=20
more obvious what is going to happen when you start creating and merging lo=
ts=20
of them into a single origin.

(yeah - maybe there could be better fitting option name - so it's more about
idea here for now)

Zdenek

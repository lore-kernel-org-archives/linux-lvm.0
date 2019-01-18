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
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <e76885af-3d39-51a7-a32f-377846cfe130@redhat.com>
Date: Fri, 18 Jan 2019 10:34:55 +0100
MIME-Version: 1.0
In-Reply-To: <SYBPR01MB393109FBE5C800688A72F90BC29C0@SYBPR01MB3931.ausprd01.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Davis, Matthew" <Matthew.Davis.2@team.telstra.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 18. 01. 19 v 1:53 Davis, Matthew napsal(a):
> Hi Zdenek,
> 
> I assumed that LVM thin snapshots would work like git branches.
> Since git also uses diffs on the backend, and git is popular with developers, the same kind of behaviour seems reasonable to me.
> 
> e.g.
> 
> ```
> git checkout master
> git branch branchA # equivalent to creating snapshotA
> echo "modify" > file.txt # modify origin
> git checkout branchA ; git branch branchB # copy snapshotA to snapshotB
> git checkout master ; git merge branchA # restore snapshotA
> git branch # snapshotB still exists
> echo "modify2" > file.txt # modify origin
> git checkout branchB # restoring snapshot to root
> ```
> 
> Oh well. It doesn't matter too much, since I've figured out how to get it to work. I just need to restore the oldest snapshot each time. Then LVM updates the origin accordingly.

Hi

As already said lvm2 is NOT DB engine, but let's look on it this way:

OriginLV ->  snap1

hour later

OriginLV ->  snap2

hour later

OriginLV ->  snap3

hour later

OriginLV ->  snap4

- then you decide to merge  snap2 into  OriginLV

So now there is *THE* question - whether snap2 can be now seen as origin for 
'snap1',  'snap3',  'snap4' ?

The user might have used and update all volumes meanwhile in some way.

After long discussion - we concluded it's hard question and we decided to drop 
  the connection for now.

There is some possibility to analyze what is the relation between all the 
orphans snaps - but it's quite a lot of work - and not directly related to 
volume management.

And I also want to point out you cannot really compare this with 'git' - as 
with git all your steps are mostly easily reversible as all branches are still 
there till prune point, while with this thin merging - one bad merge may 
present quite significant data lose. Also think about the difference in 
behavior between thin snaps and old thick snaps, where the merging worked 
differently and way way way more slower...

IMHO the correct name of such operation is replace/swap with thins.

Regards

Zdenek

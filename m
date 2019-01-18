From: "Davis, Matthew" <Matthew.Davis.2@team.telstra.com>
Date: Fri, 18 Jan 2019 00:53:25 +0000
Message-ID: <SYBPR01MB393109FBE5C800688A72F90BC29C0@SYBPR01MB3931.ausprd01.prod.outlook.com>
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
In-Reply-To: <690f7e10-f146-202f-56b2-2e245bcc001b@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and
	development <linux-lvm@redhat.com>

Hi Zdenek,

I assumed that LVM thin snapshots would work like git branches. 
Since git also uses diffs on the backend, and git is popular with developers, the same kind of behaviour seems reasonable to me.

e.g.

```
git checkout master
git branch branchA # equivalent to creating snapshotA
echo "modify" > file.txt # modify origin
git checkout branchA ; git branch branchB # copy snapshotA to snapshotB
git checkout master ; git merge branchA # restore snapshotA
git branch # snapshotB still exists
echo "modify2" > file.txt # modify origin
git checkout branchB # restoring snapshot to root
```

Oh well. It doesn't matter too much, since I've figured out how to get it to work. I just need to restore the oldest snapshot each time. Then LVM updates the origin accordingly.

Regards,
Matt

-----Original Message-----
From: Zdenek Kabelac [mailto:zkabelac@redhat.com] 
Sent: Thursday, 17 January 2019 8:22 PM
To: Davis, Matthew <Matthew.Davis.2@team.telstra.com>; LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: how to copy a snapshot, or restore snapshot without deleting it

Dne 17. 01. 19 v 2:12 Davis, Matthew napsal(a):
> Hi Zdenek,
> 
> What do you mean "it's origin is already gone"?

Hi

Your field 'Origin' in your 'lvs -a' was empty - so the actual origin used for taking 'fresh' LV snapshot is simply no longer existing.

lvm2 is (ATM) not a database tool trying to resolve/guess what can or cannot be still considered as the origin -  so i.e. if you take multiple snapshots of a single origin and then you merge one snapshot back to origin -  'the original origin' used for all other snapshots is 'gone' -  as lvm2 is not resolving here the history and relation of data content whether the meaning of origin still applies.

What can make sense in your case is to extend probably  'lvconvert' logic and provide  operation  i.e. --replace - which would be working mostly like merge
- but with thins you would be able to specify  which thinLV should replace some other thinLV so basically specifying replace LV1 with LV2 - which you can do by lvremove + lvrename ATM - but I can see usefulness for supporting this for i.e. root LV which is typically in-use all the time.

I'm not seeing possible to extended the internal logic in lvm2 that would be deciding which NEW origin should be replacing removed/merged origin in all related snapshots - I'm pretty sure every user would expect a different one...

Zdenek

References: <MEAPR01MB502904BB1C62BCAEDA77544FC28D0@MEAPR01MB5029.ausprd01.prod.outlook.com>
	<8fb5fa67-1b56-7baf-e8c9-b422c5c8b443@redhat.com>
	<MEAPR01MB5029BFA4227BCA2DD60501A5C2840@MEAPR01MB5029.ausprd01.prod.outlook.com>
	<29ace3ab-dbc7-ec32-867e-c3c875c79851@redhat.com>
	<SYBPR01MB3931B86CFAE9FB42210B293CC2800@SYBPR01MB3931.ausprd01.prod.outlook.com>
	<691ff9d7-78c3-b36d-7153-b54c589bb12f@redhat.com>
	<SYBPR01MB3931031A54431A1F999F31B4C2810@SYBPR01MB3931.ausprd01.prod.outlook.com>
	<1d9280fc-6350-1ac8-f44f-453aef02a42e@redhat.com>
	<SYBPR01MB3931927F2E7B62070F84C040C2830@SYBPR01MB3931.ausprd01.prod.outlook.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <690f7e10-f146-202f-56b2-2e245bcc001b@redhat.com>
Date: Thu, 17 Jan 2019 10:21:55 +0100
MIME-Version: 1.0
In-Reply-To: <SYBPR01MB3931927F2E7B62070F84C040C2830@SYBPR01MB3931.ausprd01.prod.outlook.com>
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

Dne 17. 01. 19 v 2:12 Davis, Matthew napsal(a):
> Hi Zdenek,
> 
> What do you mean "it's origin is already gone"?

Hi

Your field 'Origin' in your 'lvs -a' was empty - so the actual origin used for 
taking 'fresh' LV snapshot is simply no longer existing.

lvm2 is (ATM) not a database tool trying to resolve/guess what can or cannot 
be still considered as the origin -  so i.e. if you take multiple snapshots of 
a single origin and then you merge one snapshot back to origin -  'the 
original origin' used for all other snapshots is 'gone' -  as lvm2 is not 
resolving here the history and relation of data content whether the meaning of 
origin still applies.

What can make sense in your case is to extend probably  'lvconvert' logic and 
provide  operation  i.e. --replace - which would be working mostly like merge 
- but with thins you would be able to specify  which thinLV should replace 
some other thinLV so basically specifying replace LV1 with LV2 - which you can 
do by lvremove + lvrename ATM - but I can see usefulness for supporting this 
for i.e. root LV which is typically in-use all the time.

I'm not seeing possible to extended the internal logic in lvm2 that would be 
deciding which NEW origin should be replacing removed/merged origin in all 
related snapshots - I'm pretty sure every user would expect a different one...

Zdenek

From: "Davis, Matthew" <Matthew.Davis.2@team.telstra.com>
Date: Tue, 15 Jan 2019 23:03:21 +0000
Message-ID: <SYBPR01MB3931031A54431A1F999F31B4C2810@SYBPR01MB3931.ausprd01.prod.outlook.com>
References: <MEAPR01MB502904BB1C62BCAEDA77544FC28D0@MEAPR01MB5029.ausprd01.prod.outlook.com>
	<8fb5fa67-1b56-7baf-e8c9-b422c5c8b443@redhat.com>
	<MEAPR01MB5029BFA4227BCA2DD60501A5C2840@MEAPR01MB5029.ausprd01.prod.outlook.com>
	<29ace3ab-dbc7-ec32-867e-c3c875c79851@redhat.com>
	<SYBPR01MB3931B86CFAE9FB42210B293CC2800@SYBPR01MB3931.ausprd01.prod.outlook.com>
	<691ff9d7-78c3-b36d-7153-b54c589bb12f@redhat.com>
In-Reply-To: <691ff9d7-78c3-b36d-7153-b54c589bb12f@redhat.com>
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

Here's what I see with `sudo lvs -a`. (My snapshots are actually called `fresh` and `fresh2` not `mySnap`)

```
  LV              VG     Attr       LSize   Pool   Origin Data%  Meta%  Move Log Cpy%Sync Convert
  fresh           centos Vwi---tz-k  <1.46t pool00
  fresh2          centos Vwi---tz-k  <1.46t pool00 fresh
  [lvol0_pmspare] centos ewi------- 760.00m
  pool00          centos twi-aotz--  <1.46t               0.18   3.14
  [pool00_tdata]  centos Twi-ao----  <1.46t
  [pool00_tmeta]  centos ewi-ao---- 760.00m
  root            centos Vwi-aotz--  <1.46t pool00        0.16
  swap            centos -wi-ao----   4.00g
  v01             centos Vwi---tz-k  <1.46t pool00 root
```

Regards,
Matt

-----Original Message-----
From: Zdenek Kabelac [mailto:zkabelac@redhat.com] 
Sent: Tuesday, 15 January 2019 9:50 PM
To: LVM general discussion and development <linux-lvm@redhat.com>; Davis, Matthew <Matthew.Davis.2@team.telstra.com>; Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: how to copy a snapshot, or restore snapshot without deleting it

Dne 14. 01. 19 v 23:44 Davis, Matthew napsal(a):
> Hi Zdenek,
> 
> `sudo lvs --version` says :
> 
>    LVM version:     2.02.180(2)-RHEL7 (2018-07-20)
>    Library version: 1.02.149-RHEL7 (2018-07-20)
>    Driver version:  4.37.1
> 
> So that means it's version 2, right?
> 
> (I'm running the latest version of CentOS.)

Hmm - version looks fine

>>       $sudo lvconvert --merge centos/mySnap1
>>       centos/mySnap1 is not a mergeable logical volume
>>
> 
> Hi
> 
> Aren't you using some quite ancient version of lvm2 ?
> You need to use lvm2 which does support thin volume merging
> 


Can you paste 'lvs -a' prior this operation ?

If the lvm2 tells you that 'mySnap1' is not mergable LV - then it likely has no 'origin' to merge into.


Zdenek

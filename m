References: <MEAPR01MB502904BB1C62BCAEDA77544FC28D0@MEAPR01MB5029.ausprd01.prod.outlook.com>
	<8fb5fa67-1b56-7baf-e8c9-b422c5c8b443@redhat.com>
	<MEAPR01MB5029BFA4227BCA2DD60501A5C2840@MEAPR01MB5029.ausprd01.prod.outlook.com>
	<29ace3ab-dbc7-ec32-867e-c3c875c79851@redhat.com>
	<SYBPR01MB3931B86CFAE9FB42210B293CC2800@SYBPR01MB3931.ausprd01.prod.outlook.com>
	<691ff9d7-78c3-b36d-7153-b54c589bb12f@redhat.com>
	<SYBPR01MB3931031A54431A1F999F31B4C2810@SYBPR01MB3931.ausprd01.prod.outlook.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <1d9280fc-6350-1ac8-f44f-453aef02a42e@redhat.com>
Date: Wed, 16 Jan 2019 14:55:59 +0100
MIME-Version: 1.0
In-Reply-To: <SYBPR01MB3931031A54431A1F999F31B4C2810@SYBPR01MB3931.ausprd01.prod.outlook.com>
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

Dne 16. 01. 19 v 0:03 Davis, Matthew napsal(a):
> Hi Zdenek,
> 
> Here's what I see with `sudo lvs -a`. (My snapshots are actually called `fresh` and `fresh2` not `mySnap`)
> 
> ```
>    LV              VG     Attr       LSize   Pool   Origin Data%  Meta%  Move Log Cpy%Sync Convert
>    fresh           centos Vwi---tz-k  <1.46t pool00
>    fresh2          centos Vwi---tz-k  <1.46t pool00 fresh

So these both LVs are snapshots  (since they were created with  s(k)ipped 
activation - however 'fresh' LV cannot be merged anymore  as it's origin is 
already gone.

But  'lvconvert --merge  centos/fresh2'  should work - yet you need to 
manually drop 'k' flag (via lvchange).

So to have 'working' merge - you have to see something in the 'Origin' field.
If the Origin field is already 'empty' you can't be merging such LV even when 
it was originally created as 'snapshot'.

Also note that thin snapshot merging is nothing else then a bit more 'smart' 
rename.

Zdenek

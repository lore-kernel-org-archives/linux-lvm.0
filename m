References: <MEAPR01MB502904BB1C62BCAEDA77544FC28D0@MEAPR01MB5029.ausprd01.prod.outlook.com>
	<8fb5fa67-1b56-7baf-e8c9-b422c5c8b443@redhat.com>
	<MEAPR01MB5029BFA4227BCA2DD60501A5C2840@MEAPR01MB5029.ausprd01.prod.outlook.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <29ace3ab-dbc7-ec32-867e-c3c875c79851@redhat.com>
Date: Thu, 10 Jan 2019 10:45:24 +0100
MIME-Version: 1.0
In-Reply-To: <MEAPR01MB5029BFA4227BCA2DD60501A5C2840@MEAPR01MB5029.ausprd01.prod.outlook.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, "Davis, Matthew" <Matthew.Davis.2@team.telstra.com>

Dne 10. 01. 19 v 7:23 Davis, Matthew napsal(a):
> Hi Marian,
> 
> I'm trying to do it with thin snapshots now. It's all very confusing, and I can't get it to work.
> I've read a lot of the documentation about thin stuff, and it isn't clear what's happening.
> 
> I took a snapshot with
> 
>      sudo lvcreate -s --name mySnap1 centos/root
> 
> Then I copied that snapshot with
> 
>      sudo lvcreate -s --name mySnap2 centos/mySnap1
> 
> When I try to restore mySnap1 it says:
> 
>      $sudo lvconvert --merge centos/mySnap1
>      centos/mySnap1 is not a mergeable logical volume
> 

Hi

Aren't you using some quite ancient version of lvm2 ?
You need to use lvm2 which does support thin volume merging

Regards

Zdenek

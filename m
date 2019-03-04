References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
	<eb3fb7e3-9946-f266-815e-4b49c997e3a4@linux.ibm.com>
	<30346b34-c1e1-f7ba-be4e-a37d8ce8cf03@gmail.com>
	<CAMRbyyuVek7CnYhD3S6JcYLTfxP73CScpErCX3D2eapbfJgd4g@mail.gmail.com>
From: Cesare Leonardi <celeonar@gmail.com>
Message-ID: <840f278d-fc42-a2ea-03b2-cea5f32b4837@gmail.com>
Date: Mon, 4 Mar 2019 23:45:16 +0100
MIME-Version: 1.0
In-Reply-To: <CAMRbyyuVek7CnYhD3S6JcYLTfxP73CScpErCX3D2eapbfJgd4g@mail.gmail.com>
Content-Language: it-IT
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PV
 with a larger physical block size
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Cc: Ingo Franzki <ifranzki@linux.ibm.com>

On 02/03/19 21:25, Nir Soffer wrote:
> # mkfs.xfs /dev/test/lv1
> meta-data=/dev/test/lv1          isize=512    agcount=4, agsize=25600 blks
>           =                       sectsz=512   attr=2, projid32bit=1
>           =                       crc=1        finobt=1, sparse=0, 
> rmapbt=0, reflink=0
> data     =                       bsize=4096   blocks=102400, imaxpct=25
>           =                       sunit=0      swidth=0 blks
> naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
> log      =internal log           bsize=4096   blocks=855, version=2
>           =                       sectsz=512   sunit=0 blks, lazy-count=1
> realtime =none                   extsz=4096   blocks=0, rtextents=0

Has the problem here the same root as for ext4? I guess sectsz should be 
 >=4096 to avoid troubles, isn't it?

Just to draw some conlusion, could we say that currently, if we are 
going to move data around with LVM, it's better to check that the 
filesystem is using a block size >= than "blockdev --getbsz 
DESTINATIONDEVICE"? At least with ext4 and xfs.

Something that couldn't be true with really small devices (< 500 MB).

Is there already an open bug regarding the problem discussed in this thread?

Cesare.

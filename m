Message-ID: <3BC95A4E.40606@st-peter.stw.uni-erlangen.de>
Date: Sun, 14 Oct 2001 11:26:38 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problem with LVM over RAID-1
References: <m2u1x238a1.fsf@isnogud.escape.de>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>
>
>LVM version 0.9.1_beta2  by Heinz Mauelshagen  (18/01/2001)
>    lvm -- Driver successfully initialized
>    oker:~# pvcreate --version
>    pvcreate: Logical Volume Manager 1.0.1-rc3
>    Heinz Mauelshagen, Sistina Software  01/10/2001 (IOP 10)
>
>    pvcreate -- device "/dev/md0" has a partition table
>
my guess is, try with lvm-1.0.1rc4 but patch the kernel too
i had the same problems and this solved them
if this doesn't help you can try instaling a Mandrake partitioning tool
diskdrake, with the older version you could change the partition id of 
md to 8e (lvm)
but sadly the current version doesn't support it

good luck

>    
>

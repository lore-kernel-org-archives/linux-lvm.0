Return-Path: <boutilpj@ednet.ns.ca>
Message-ID: <3B543BDD.5040008@ednet.ns.ca>
Date: Tue, 17 Jul 2001 10:21:33 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Weird UUIDs
References: <3B542E3B.9050202@ednet.ns.ca> <20010717145454.A17967@sistina.com>
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

Heinz,

I created and them removed a small LV and now the UUIDs look more 
familiar. :-) Thanks.


pvdata /dev/sda7

--- Physical volume ---
PV Name               /dev/sda7
VG Name               data_vg
PV Size               133.36 GB / NOT usable 321 KB [LVM: 255 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                6
PE Size (KByte)       4096
Total PE              34140
Free PE               7015
Allocated PE          27125
PV UUID               C4Txkv-FIqY-RKJ4-OEoo-cTWc-LqZb-wFDBH0

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                6
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               133.36 GB
PE Size               4 MB
Total PE              34140
Alloc PE / Size       27125 / 105.96 GB
Free  PE / Size       7015 / 27.4 GB
VG UUID               XXUlZt-SdDC-3who-JMDC-13P1-adqU-MKgQrv


.......


Heinz J. Mauelshagen wrote:

>On Tue, Jul 17, 2001 at 09:23:23AM -0300, Patrick Boutilier wrote:
>
>>I tried running pvdata -U on one of my LVM servers and it segfaulted 
>>(LVM driver version 0.9.1_beta6). Check out the UUIDs.
>>
>
>Output just tells you, that no UUIDs have been created dynamically so far.
>If you create/remove a dummy LV, they should be there...
>
>>Everything is 
>>working OK but I wonder if this is a serious problem or not?
>>
>
>No, it is not. Just try the lvcreate/lvremove pair on a small (-l 1) dummy LV.
>
>Regards,
>Heinz    -- The LVM Guy --
>

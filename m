Message-ID: <4137A15E.30208@m-cam.com>
Date: Thu, 02 Sep 2004 18:40:30 -0400
From: Arshavir Grigorian <ag@m-cam.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: partition strategy
References: <412CE781.9000409@m-cam.com> <41363AA0.5030107@m-cam.com>
	<20040902174230.GG6264@agk.surrey.redhat.com>
In-Reply-To: <20040902174230.GG6264@agk.surrey.redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, agk@redhat.com

Alasdair G Kergon wrote:

>On Wed, Sep 01, 2004 at 05:09:52PM -0400, Arshavir Grigorian wrote:
>  
>
>>>Is it better to create 3 partitions 2 x230G + 1G 
>>>OR
>>>Is it better to create 2 paritions 230G and 231G, put both in a vg, 
>>>      
>>>
>
>The VG contains the same space in both cases so do the simplest
>ie the first option.  In both cases you'll need to run lvcreate for
>460G followed by lvextend for 1G.
>
>Alasdair
>  
>

Thanks for the response.
For some reason even the first option does not work.
I created 3 partitions, added the 2 same sized ones to a vg, created a 
striped lv, then extended the vg to include the third small partition. 
After this I tried extending the lv to the new partition, but got the 
error below. Could you, please tell me what I am doing wrong? TIA.

Arshavir

casals:~# vgdisplay
  --- Volume group ---
  VG Name               vg00
  System ID            
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               463.60 GB
  PE Size               4.00 MB
  Total PE              118682
  Alloc PE / Size       0 / 0  
  Free  PE / Size       118682 / 463.60 GB
  VG UUID               PyRda0-g9mC-LxrH-txvE-CKb6-jP6T-Ou103y

casals:~# lvcreate -i 2 -I 8 -l 118682 vg00

casals:~# vgextend vg00 /dev/hdc3
  Volume group "vg00" successfully extended

casals:~# vgdisplay
  --- Volume group ---
  VG Name               vg00
  System ID            
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               464.12 GB
  PE Size               4.00 MB
  Total PE              118816
  Alloc PE / Size       118682 / 463.60 GB
  Free  PE / Size       134 / 536.00 MB
  VG UUID               PyRda0-g9mC-LxrH-txvE-CKb6-jP6T-Ou103y
  
casals:~# lvextend -l +134 /dev/vg00/lvol0 /dev/hdc3
  Using stripesize of last segment 8KB
  Extending logical volume lvol0 to 464.12 GB
  Insufficient allocatable extents suitable for parallel use for logical 
volume lvol0: 118816 required

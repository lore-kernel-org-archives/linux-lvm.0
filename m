Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB1HVor26383
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2004 12:31:50 -0500
Received: from stl.rural.usda.gov (stl.rural.usda.gov [199.159.138.244])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iB1HVXig008177
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2004 12:31:34 -0500
Received: from [192.168.1.4] (monkey.rural.usda.gov [199.159.140.179])
	by stl.rural.usda.gov (8.12.11/8.12.10) with ESMTP id iB1HNwg6012113
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2004 11:23:58 -0600
Message-ID: <41ADFFE4.5050607@charter.net>
Date: Wed, 01 Dec 2004 11:31:16 -0600
From: James Puellmann <superfueld@charter.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and Kickstart
References: <DAE695E47B9BCC45996768956410A6A90E9187@dlee2k03.ent.ti.com>
In-Reply-To: <DAE695E47B9BCC45996768956410A6A90E9187@dlee2k03.ent.ti.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Here's a snippet of my own kickstart which sets up a few logvols of 
its own. Don't know what's wrong with yours exactly, but this works 
fine for me - maybe you can mod it to your own purposes.

zerombr yes
clearpart --all

partition /boot --fstype ext3 --size=100
partition pv.01 --size=100 --grow
volgroup vg01 pv.01
logvol / --fstype ext3 --name=lvol1 --vgname=vg01 --size=2000
logvol /var --fstype ext3 --name=lvol2 --vgname=vg01 --size=2000
logvol /usr --fstype ext3 --name=lvol3 --vgname=vg01 --size=1000
logvol /tmp --fstype ext3 --name=lvol4 --vgname=vg01 --size=1000
logvol swap --fstype swap --name=lvol5 --vgname=vg01 --recommended
logvol /opt --fstype ext3 --name=lvol6 --vgname=vg01 --size 1000

Jim Owenby wrote:
> Is there any examples of using LVM on RedHat 3.x in a kickstart 
> script? I am trying to creat one large LVM partion accross 3 drives to 
> about 400G and I am not having any luck at it.
> 
> I have tired the following in the ks.cfg file:
> # partition information
> clearpart --all
>  part /boot --fstype ext3 --size=100 --ondisk=sda
>  part swap --size=8192 --ondisk=sda
>  part / --fstype ext3 --size=8192 --ondisk=sda
>  part pv.15 --size=100 --grow --ondisk=sdc
>  part pv.13 --size=100 --grow --ondisk=sdb
>  part pv.11 --size=100 --grow --ondisk=sda
>  volgroup Volume00 pv.11 pv.13 pv.15
>  logvol /tmp --fstype ext3 --name=LogVol00 --vgname=Volume00 
>  --pesize=16384 --size=354500
> 
> Jim Owenby
> Texas Instruments Inc
> P.O. Box 660199 M/S 8714
> Dallas, Tx. 75265
> Design Systems,Compute Team
> Unix/Linux Administrator
> Ph: 214.480.4082
> Cell: 214.882.3831
> Email: jowenby@ti.com
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

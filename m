Message-ID: <4C3487E1.1000607@redhat.com>
Date: Wed, 07 Jul 2010 15:57:53 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <AANLkTilPQsBnVh_bSQE9CsTcswDX89_H8_Ea-5SWcBaW@mail.gmail.com>
In-Reply-To: <AANLkTilPQsBnVh_bSQE9CsTcswDX89_H8_Ea-5SWcBaW@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Only 4MB of space on a 1GB file mounted in loopback
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Benjamin Henrion <bh@udev.org>

On 07/07/2010 03:32 PM, Benjamin Henrion wrote:
> Hi,
> 
> I have setup some LVM volume to test on a loopback file of 1GB, but I
> end up with a file of 4MB, do you have any idea what went wrong?:

> root@buzek /home/zoobab [27]# lvcreate -i1 -l 1 -n testvol testgroup

lvcreate -l 1 -> create LV of 1 extent size == 4MB

you want -l 100%FREE ? or -L 1G ?

and -i makes no sense, you cannot create stripe on one PV, -i1 is default

Milan

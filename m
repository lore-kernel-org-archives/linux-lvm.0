Return-Path: <list@showme.wox.org>
Message-ID: <00a301c0ad10$f9b5d820$0f01a8c0@myplace.net>
From: "Bas" <list@showme.wox.org>
References: <005801c0ac4b$a781cc00$0f01a8c0@myplace.net> <200103132137.f2DLb6o05452@webber.adilger.int> <20010314163701.F14172@sistina.com> <004701c0ad06$0ba5d400$0f01a8c0@myplace.net> <20010314204739.B15040@sistina.com>
Subject: Re: [linux-lvm] Changing device numbers.
Date: Wed, 14 Mar 2001 21:29:58 -0800
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> s/LE/LV/ -> yes.
>
> 1st LV in 1st VG -> 58,0
> 2nd LV in 1st VG -> 58,1
> 1st LV in 2nd VG -> 58,2
>
> and so on.
>

Ok, that's what I found out with that changing root device number. But what
makes 58,0 device 58,0 ? What I mean is: my old LV root was the first LV I
made. I didn't have 2 disks, now I do, and I wanted everything striped. I
removed the 1st LV, created a new (striped) one, and copied all the data
from old root to new root. I removed old root, and renamed templv to root,
thus giving it a device number. Then rebooted, to use the new root, and
created a LV.
That caused a shift in device numbers, and I wonder why. It makes me think
that the first LE on a disk that is used to create an LV, makes than device
58,0. Right ?

References: <kcim.5836f2f8.25f.657975b133937972@ucs.cubewerk.intern>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <99984db6-4d0c-5b59-9243-dcd60e37cb53@redhat.com>
Date: Fri, 25 Nov 2016 09:48:38 +0100
MIME-Version: 1.0
In-Reply-To: <kcim.5836f2f8.25f.657975b133937972@ucs.cubewerk.intern>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] auto_activation_volume_list in lvm.conf not honored
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Peter Rajnoha <prajnoha@redhat.com>

Dne 24.11.2016 v 15:02 Stefan Bauer napsal(a):
> Hi Peter,
>
> now all make sense. On this ubuntu machine upstartd with udev is taking care of vgchange.
>
> After some digging, /lib/udev/rules.d/85-lvm2.rules shows, that vgchange is only executed with -a y
>
> We will test this on weekend but I'm certain now, that this was the problem.
>
> We wanted to keep things simple and do not use clvmd. We have master/slave setup without concurrent write/read.

Hi

Wondering what are you trying to do when you say  'not use clvmd'.

If you are working with 'shared' storage and manipulating  same VG from 
multiple nodes (i.e. activation) - it's not so easy to go without really good 
locking manager.

If you don't like clvmd - maybe you could take a look at lvmlockd & sanlock.

But you should be aware there are NOT many people who are able to ensure 
correct locking of lvm2 commands -  it's really not just 'master/slave'.
There are big number of error cases which do not proper locking around
the whole cluster.


Regards

Zdenek

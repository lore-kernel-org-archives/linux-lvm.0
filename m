From: Denie Andriessen <D.Andriessen@pink.nl>
Subject: Re: [linux-lvm] Is it possible to change the PE size on a live volume?
Message-id: <005c01c2792c$cd0f9e70$f707a182@gimmie.tudelft.nl>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <20021021194052.B8228@superfly.archi-me-des.de>
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
Date: Mon Oct 21 13:06:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I had that same problem/miscalculation once..

What I wanted to do was, to create a new volumegroup, that only holds the
last (new) disk(s) that you want to add.
Then, move as much as possible of the data to the new disk, scrink the old
volume as much as possible (e2fsadm first, then vgreduce old voulme, PVmove,
vgextend on the new volume, e2fsadm on the new volume, repeat untill done..
last go, vgremove old volumegroup, and presto..It takes quite a while to
complete, depending on the size of your volume..... (and I was in the
situation that the disk I added was larger then the largest partition I had
in the initial situation..

Good tip: Try and test it with the empty space on the new disk first !

Unfortunatelt it failed.. (had old LVM tools, with a minor bug in it)

----- Original Message -----
From: "Frank Joerdens" <frank@joerdens.de>
To: <linux-lvm@sistina.com>
Cc: <hank@fas-art.com>
Sent: Monday, October 21, 2002 7:40 PM
Subject: [linux-lvm] Is it possible to change the PE size on a live volume?


> Greetings. My volume is 225 GB in size and getting too small.
> Unfortunately, I used the default PE size when creating the volume
> group. Is there any way I can overcome the 256 GB limit without
> recreating the entire thing (where would I put all the data that's on
> there right now?)?
>
> Cheers, Frank
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

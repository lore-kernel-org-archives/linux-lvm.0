From: Ralf Eisinger <rei@ihs.uni-stuttgart.de>
Subject: Re: [linux-lvm] RAID extension and lvm
In-Reply-To: <15050000.1026663876@duke>
Message-ID: <Pine.LNX.4.44.0207141936490.29308-100000@poseidon.ihs.uni-stuttgart.de>
MIME-Version: 1.0
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
Date: Sun Jul 14 12:41:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, 14 Jul 2002 lembark@wrkhors.com wrote:

>
> > Sorry, but there is no pvresize command.
>
> You wouldn't want it anyway.
>
> There isn't any way to "resize" an fault-tolerant RAID
> system (1/3/5) and you can get more flexable,
This is not correct. You can extend most of the common hardware raid
systems with raid5. Most of it during operation without shutting down.

> reliable
> results with LVM than RAID0 anyway.
>
> The way to add space into a VG is by incorporating new
> PV's with vgextend. If you want to grow a fault-tolerant
> system then build new RAID5 groups and add them as new
> PV's.
But if I want to extend my system, I need at least three disks. If I
extend an existing raid5, I need only one disk.

best regards

Ralf Eisinger
-------------------
IHS - University of Stuttgart, Germany
Pfaffenwaldring 10
70150 Stuttgart
Phone: (0049)-711-685-3201

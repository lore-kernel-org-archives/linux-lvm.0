From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: [OT]: Re: [linux-lvm] RH7.2 + kernel 2.4.17(or 16) + LVM 1.0.2
In-Reply-To: <3C71A746.7000707@birddog.com>
Message-Id: <Pine.LNX.4.44.0202182322300.3200-100000@dragon.inside.ntisys.com>
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
Date: Mon Feb 18 22:26:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 18 Feb 2002, Kirby C. Bohling wrote:
>> You should make sure you do NOT use GCC that comes with RH 7.2 as it is
>> broken.
>
> That is a curious remark, on several occasions Alan Cox has said that he
> compiles and runs his kernels using a current RedHat compiler.

  The "GCC 2.96" that Red Hat ships is still (1) not a "real" GCC release
and (2) rather new.  GCC 3.x is a "real" release but is even newer.  Both
may have behaviors with LVM does not like.  The LVM code may have bugs which
the more "traditional" GCC 2.91 allows but newer GCCs do not.

  All in all, while Red Hat's "GCC 2.96" may work, it is a good idea to try
a more conservative compiler release when problems occur.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |

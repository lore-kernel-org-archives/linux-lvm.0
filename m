From: bscott@ntisys.com
Subject: Re: [linux-lvm] LVM Question
In-Reply-To: <077f01c336a7$2df27a90$6501a8c0@portege>
Message-ID: <Pine.LNX.4.44.0306191734080.2473-100000@dragon.inside.ntisys.com>
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
Date: Thu Jun 19 16:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, 19 Jun 2003, at 5:10pm, jaylee@golden.net wrote:
> I'm planning to use LVM on my new linux system, I'm just wondering can I
> use internal and external drives together as one?

  You sure can.

> If the external drive fails, what will happen?

  All LVs (Logical Volumes) with extents on the failed drive will be
unavailable.

  For most cases, that means that all data on both disks will be lost.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do  |
| not represent the views or policy of any other person or organization. |
| All information is provided without warranty of any kind.              |

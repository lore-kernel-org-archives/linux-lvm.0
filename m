From: sander@sanderscorner.com
Message-ID: <12313315195.20020804003345@wanadoo.nl>
Subject: Re: [linux-lvm] vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group
In-Reply-To: <21751.1028376330@www23.gmx.net>
References: <Pine.LNX.4.44.0208031112290.2922-100000@pzat.meep.org>
 <21751.1028376330@www23.gmx.net>
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
Date: Sat Aug  3 17:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

(Response to message from d.levitin@gmx.de, d.levitin@gmx.de on Saturday, August 03, 2002 2:05:30 PM)

Hello,

Couldn't that have possibly disastrous results, since files or
directories may have their PE's mapped partly on an available disk and
partly on one that's missing?

-- 

Regards,
sander

Saturday, August 03, 2002, 2:05:30 PM, you wrote:


> The 2 disks are for us temporarily unavailable (problem with a controller)
> and I can't wait untill I can use them (so no pvmove :-(  ). Can I tell LVM it
> have only with the other 8 disks to go on ?

> Dmitri

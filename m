From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Spinning down/up drives.
Message-ID: <20020602014851.A15117@zealot.blacknet.de>
References: <12639997890.20020602023603@tnonline.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12639997890.20020602023603@tnonline.net>; from andewid@tnonline.net on Sun, Jun 02, 2002 at 02:36:03AM +0200
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
Date: Sat Jun  1 19:48:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jun 02 '02 at 02:36, Anders Widman wrote:
>    Can   LVM   handle drives that are set to spin down after some idle
>    time?
I can not tell who is handling it grecefullt, but I've 6x80GB Maxtor
drives, two on one primise controller. I'm running a RAID5 with this
drives (linux softraid, aka MD, kernel 2.4.18) with LVM 1.0.x ontop.
The LVs are either running ext3 or ReiserFs.
The discs are configurated to spindown after 25min of idle time and
beside some "IDEx resetting drive" error messages the system is stable
since about 6 months (the time I assembled it).
It's only my home server, but you don't want to have production/work
machines spinup their drives first.

Cu,
    Goetz.

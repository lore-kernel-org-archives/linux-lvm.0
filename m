From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: [linux-lvm] VG is not found !
In-Reply-To: <3BF40960.8A037CF5@LTUtech.com>
Message-ID: <Pine.LNX.4.33.0111152011520.24310-100000@dragon.inside.ntisys.com>
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
Date: Thu Nov 15 19:10:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: list LVM <linux-lvm@sistina.com>

On Thu, 15 Nov 2001, Igor Dumaire wrote:
> I had created 2 VG and worked sometime with its. I have stopped the
> server and at the reboot the first VG have disappeared ! The second it's
> OK !!

  Start with these commands:

	lvmdiskscan
	vgscan
	vgdisplay
	vgchange -ay

  Do not just blindly try the commands if you are not familiar with them;
read the manual pages first.  Try the '--verbose' switch with each for more
info.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |

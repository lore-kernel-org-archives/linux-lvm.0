From: bscott@ntisys.com
Subject: Re: [linux-lvm] Growing the size of the lv
In-Reply-To: <20020801014624.5F3855F22C@dell103.hee.net>
Message-ID: <Pine.LNX.4.44.0207312159430.2592-100000@dragon.inside.ntisys.com>
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
Date: Wed Jul 31 20:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, 31 Jul 2002, at 6:46pm, Hee So wrote:
> After some twittling around, the LV Size was that of all 3 PVs.

  Than you have extended the size of the LV.

> when I run df -kh, I still get the size of the original diskspace

  You need to extend the size of the filesystem, which is stored on the LV.

  This is in the HOWTO on the website:
  http://www.sistina.com/lvm_howtos/lvm_howto/

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |

Subject: Re: [linux-lvm] To compile
References: <003901c1bad9$dd43eb50$216410ac@tao.co.uk>
From: Terje Kvernes <terjekv@math.uio.no>
In-Reply-To: <003901c1bad9$dd43eb50$216410ac@tao.co.uk>
Message-Id: <wxxzo1yecqu.fsf@nommo.uio.no>
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
Date: Sun Feb 24 16:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

"William Blunn" <bill@tao-group.com> writes:

> Er, you might find that it is a good idea to put your LVM shared
> library in /lib.
> 
> Otherwise you might have difficulting starting up the system if /usr
> or /usr/local is on an LVM volume.

  right.  this also goes for vgscan and vgchange.  now, site-specific
  software around where I work gets tossed to /site.  which of course
  is either a partition or a volume.  either way, doing:

[root@host /sbin]# ln -s /site/sbin/vgchange && ln -s /site/sbin/vgscan

  isn't as bright as one first thinks.  

  of course, when testing for volumegroups only / has been mounted, in
  case any other mountpoints are logical volumes.  *sigh*

-- 
Terje - who builds most utils statically these days.  less fuzz.  :p

From: Yuliy Minchev <yuliy@mobiltel.bg>
In-Reply-To: <20030117192650.GB3610@localhost>
Message-ID: <Pine.LNX.4.44.0301172310100.24491-100000@keoma.mobiltel.bg>
MIME-Version: 1.0
Subject: [linux-lvm] Kernel PANIC after partition change on RedHat 8.0
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
Date: Fri Jan 17 15:19:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

I have installed Red Hat Linux 8.0. I've made volume group (rootvg)
from /dev/md1 (which is raid1). I've put my /boot on /dev/md0.

As you already have noticed - I have two disks.
After installation I'm making new partiotion /dev/sdb5 i.e.
And if I change its to type to 8e after reboot kernel panics.
If I change type of this partition to something different - the system 
boots fine.

I cannot understand where can be the problem.
I have to say that I made the same configuration on this machine and 
everything was ok. But now I cannot see any difference.

Any ideas?

TIA

yuliy

-- 
  Yuliy Minchev, 
  UNIX Administrator

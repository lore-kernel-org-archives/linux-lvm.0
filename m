From: "Jason A. Lixfeld" <jlixfeld@fastvibe.com>
Date: Thu, 4 Oct 2001 12:02:33 -0400
Message-ID: <009c01c14ced$facccb10$836788cf@industry>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Removing inactive PV from display
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

The final part of my dilemma thus far is each time I run pvscan, I get a
massive number of read_intr errors on two drives.  I have removed them
from their respective LVs and VGs, but they still display in vgscan (so
they are active, in a sense).  I want to remove them from the vgscan
display but there doesn't seem to be a pvremove command anywhere.
What's the command to get rid of these things from displaying in pvscan
(exact opposite command to pvcreate /dev/hd*).

TiA

-JL

From: "Andy Francke" <afrancke@cisco.com>
Message-ID: <NDBBJIIIAKLGEPBFEKBGOENMFPAA.afrancke@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20030205185056.A18933@sistina.com>
Subject: [linux-lvm] LVM2 and XFS/your patched-in FS of choice
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
Date: Wed Feb  5 13:21:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Perhaps this has been answered already, but I can't seem to find it. Has
anybody successfully used LVM2 *and* XFS with kernel 2.4.20? The patches are
mutually exclusive, it would seem (both touch fs.h, but as a newbie I didn't
want to try to merge the changes manually and end up with a bogus device
data structure).

Andy

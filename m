Message-ID: <20031222003854.GA30300@delusion.wronline.net>
From: "Stefan Paletta" <stefanp@cabal1.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] limit of 9 active LVs w/ LVM2?
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
Date: Mon Dec 22 08:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Dear LVM folks,

I'm using latest LVM2 / dm with various 2.6 kernels with devfs, and it
seems to be impossible to have more than nine LVs active in a VG at
any one time. Very weird behaviour. Activation of what would be the
tenth results in another LV getting deactivated, although it remains
open and usable if it was open before.
I can hardly imagine that this is intended behaviour, but I can also
not find any previous reports of such a bug.

-Stefan
-- 
 junior guru                               SP666-RIPE         SMP@IRC

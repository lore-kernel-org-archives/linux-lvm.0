Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Fri, 15 Dec 2000 11:24:55 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Message-ID: <20001215112455.A1314@66bassett.freeserve.co.uk>
Mime-Version: 1.0
Subject: [linux-lvm] LVM 0.9 patch for 2.2.18
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I've made a new kernel patch to get LVM 0.9 working with 2.2.18 and am
looking for a couple of people to give it a try before I check it into
CVS.

The patch is similar to the 2.2.17 patch except it should allow you to
use a software raid device as a PV.  This also has the pleasant side
effect of removing a lot of the conditional compiles from
drivers/block/ll_rw_block.c

The patch is too big to post on the list (it still contains the
lvm.[hc] files) so mail me if you want to try it.

Your help would be appreciated.

- Joe Thornber

From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM2 compilation problem
Message-ID: <20031130171859.F16901@uk.sistina.com>
References: <200311301742.37307.arekm@pld-linux.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200311301742.37307.arekm@pld-linux.org>; from arekm@pld-linux.org on Sun, Nov 30, 2003 at 05:42:37PM +0100
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
Date: Sun Nov 30 11:20:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Nov 30, 2003 at 05:42:37PM +0100, Arkadiusz Miskiewicz wrote:
> activate/dev_manager.c:296: error: `DM_DEVICE_MKNODES' undeclared (first use 

This is defined in the latest libdevmapper.h in the latest device-mapper
distribution - 'make install' installs it into /usr/include.

LVM2 README says:
  The device-mapper needs to be installed before compiling these LVM2 tools.

The word 'latest' is missing from that sentence!

Alasdair
-- 
agk@uk.sistina.com

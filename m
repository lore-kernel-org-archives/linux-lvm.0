From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] determining lv from mount point
Message-ID: <20030923215047.S2155@uk.sistina.com>
References: <2D4B6CD74137D4119A1100104BC6BCBF0BC585C9@dubntex006.qwest.net> <20030923203707.4AD088F03@tinman.seitzassoc.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030923203707.4AD088F03@tinman.seitzassoc.com>; from galens@seitzassoc.com on Tue, Sep 23, 2003 at 01:37:02PM -0700
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
Date: Tue Sep 23 15:51:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Sep 23, 2003 at 01:37:02PM -0700, Galen Seitz wrote:
> /dev/Volume00/LV_usr   4031680   2151280   1675600  57% /usr
> is doing an ls -l on the device name and checking for the lvm major.

check if it's a symlink to /dev/mapper?

check the major number has 'device-mapper' next to it in the second
half of /proc/devices?

check if LVM recognises it as an LV?
(eg with LVM2 check output of 'lvs --noheadings /dev/Volume00/LV_usr')

Alasdair
-- 
agk@uk.sistina.com

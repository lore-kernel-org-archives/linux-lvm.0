From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Endless loop running vgscan
Message-ID: <20031221233848.M21022@uk.sistina.com>
References: <3FE4DE2E.2030705@hasw.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3FE4DE2E.2030705@hasw.net>; from se.witt@gmx.net on Sun, Dec 21, 2003 at 12:41:34AM +0100
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
Date: Sun Dec 21 17:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Dec 21, 2003 at 12:41:34AM +0100, Sebastian Witt wrote:
> Ignoring duplicate PV  on /dev/hdg1
> Found /dev/hdf1 in VG raid_vg
> Ignoring duplicate PV  on /dev/hdf1
> Found /dev/hdh1 in VG raid_vg

Set up a filter in lvm.conf so that LVM2 only sees the RAID devices
and ignores the constituent devices that make up the RAID devices.

The LVM2 logic isn't clever enough yet always to work out the correct
device to use.  This will get fixed.

Alasdair
-- 
agk@uk.sistina.com

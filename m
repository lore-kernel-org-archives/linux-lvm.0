From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM2 pvmove
Message-ID: <20031219144807.D21022@uk.sistina.com>
References: <20031218015654.GA1981@amphibian.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031218015654.GA1981@amphibian.dyndns.org>; from toad@amphibian.dyndns.org on Thu, Dec 18, 2003 at 01:56:54AM +0000
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
Date: Fri Dec 19 08:49:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 18, 2003 at 01:56:54AM +0000, Toad wrote:
> root@amphibian:~# pvmove /dev/ide/host0/bus1/target1/lun0/disc
> device-mapper: error adding target to table
>   device-mapper ioctl cmd 9 failed: Invalid argument
>   Couldn't load device 'vg--big-pvmove0'.
>   ABORTING: Temporary mirror activation failed.

The most common cause of this is not having the device-mapper 
mirror target installed.  Are you using a 2.6 kernel that doesn't
include this?

Alasdair
-- 
agk@uk.sistina.com

From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Linux 2.4.20 devmapper + userland utilities issue
Message-ID: <20030106184520.D9208@uk.sistina.com>
References: <20030105090400.1d4e61be.david@eelf.ddts.net> <20030105205306.A6754@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030105205306.A6754@uk.sistina.com>; from agk@uk.sistina.com on Sun, Jan 05, 2003 at 08:53:06PM +0000
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
Date: Mon Jan  6 12:45:08 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jan 05, 2003 at 08:53:06PM +0000, Alasdair Kergon wrote:
> please email the full debug log(*) from the lvcreate
> directly to me and I'll investigate on Monday.

For the record, the problem was LVM2 with new-format metadata seeing
the same PV on both /dev/md1 and /dev/hda6.  The fix was to add a
filter line to the config file to tell LVM2 only to look at md1.  LVM2
with old-format metadata handles the situation OK without the filter
line (displays a warning message) and I've changed LVM2 with
new-format metadata to do the same - will go into CVS shortly.
 
Alasdair
-- 
agk@uk.sistina.com

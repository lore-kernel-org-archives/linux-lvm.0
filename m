From: Friedrich Lobenstock <fl@fl.priv.at>
Subject: Re: [linux-lvm] lvm in SuSE 7.3
In-Reply-To: <20011220190739.GA8881@auctionwatch.com>
Message-Id: <Pine.LNX.4.33.0112202109470.17095-100000@www.scotty.co.at>
MIME-Version: 1.0
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
Date: Thu Dec 20 14:13:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, 20 Dec 2001 11:07, Petro wrote:

> On Thu, Dec 20, 2001 at 10:12:21AM +0100, r.kahrl@web.de wrote:
> >
> > If i restart my system, LVM reports no volume group was found and
> > starts vgchange. How can i remove this problem?
>
>     It's not really a "problem", but if the SUSE kernel loads everything
>     modularly, then you could check your modules.conf file and see if
>     it's loading LVM. If so get rid of that line.

No that has nothing to do with modules. Look at this line from
/etc/init.d/boot (this is from SuSE 7.1 but should apply 1:1 to 7.3)
#
# Find and activate volume groups (HM 1/1/1999)
#
if test -d /etc/lvmtab.d/ -a -x /sbin/vgscan -a -x /sbin/vgchange ; then
    echo "Run file system check on root for LVM activation"
    while read des fs type rest; do
        case "$fs" in

So if he get's rid of the /etc/lvmtab.d/, created by the lvm tools then
the system will not try to activate LVM on boot.

-- 
MfG / Regards
Friedrich Lobenstock

From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] ERROR: no physical volumes usable to extend volume group "movies"
Message-ID: <20030721131333.M31325@uk.sistina.com>
References: <20030720215701.11710.28072.Mailman@hermes.sistina.com> <OFD875D225.3B7500B3-ONC1256D69.007B32C5-C1256D69.007B875B@falkonline.nu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFD875D225.3B7500B3-ONC1256D69.007B32C5-C1256D69.007B875B@falkonline.nu>; from patrik@falkonline.nu on Mon, Jul 21, 2003 at 12:27:15AM +0200
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
Date: Mon Jul 21 07:14:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jul 21, 2003 at 12:27:15AM +0200, patrik@falkonline.nu wrote:
> I solved the problem... I used "vgextend movies
> /dev/ide/host0/bus0/target1/lun0/part7" instead and it worked. Strange?

The intelligence used to cope with duplicate devices/IDs needs more work.

Please set up filters in the config file instead, so LVM2 knows only
about the devices used as PVs (i.e. exclude component RAID devices,
listing just the md devices you want to use, and if there's multipath,
include only one path).
 
Alasdair
-- 
agk@uk.sistina.com

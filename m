From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] LVM and RAID
Message-ID: <20031104120154.GB11472@shell.blacknet.de>
References: <21E8E34076807C41A646FDC666B15BDF08769D@minna.combox.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21E8E34076807C41A646FDC666B15BDF08769D@minna.combox.de>
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
Date: Tue Nov  4 07:56:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Tue, Nov 04 '03 at 12:49, Tobias Gablunsky wrote:
> I didn't find clear information about how to use LVM on an (Software)
> RAID-Mirror (or RAID-5). All I found, were problems: LVM uses Partition Type
> 0x8E but Linux Soft-RAID uses 0xFD - this dosn't look very compatible...
Well, it just works. You make an autodetection softRAID (e.g. partition
type 0xFD) and make that a PV.

No need to have partition type 0x8e. LVM does not care about the
partition type, and you don't even have a partition type on softRAID.
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /                     (c) 2003 as GNU FDL 1.1
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]

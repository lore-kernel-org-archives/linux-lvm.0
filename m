From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM backup server
Message-ID: <20031203172353.GI1833@tykepenguin.com>
References: <5EDC40261519564AB9A8760651C77A1D58583A@btiburmail01.bustech.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5EDC40261519564AB9A8760651C77A1D58583A@btiburmail01.bustech.com>
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
Date: Wed Dec  3 11:24:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Dec 03, 2003 at 09:34:33AM -0500, George Campbell wrote:
> I appreciate your reply. But, I'm confused. How can I do a mount /dev/lvg1/lvol1 /mnt/dvol1 command, when the logical volume group and logical volume have not been created on this server? Does the vgscan/vgchange ay build these entries in /dev?

Yes. vgscan/vgchange reads the metadata off disk and creates the necessary volume
groups and device files.
 
-- 

patrick

From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Disk crash , LVM and ext2... (bis)
Message-ID: <20020925071843.GI1291@tykepenguin.com>
References: <3D90EBDA.5070605@free.fr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D90EBDA.5070605@free.fr>
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
Date: Wed Sep 25 02:22:31 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 25, 2002 at 12:48:58AM +0200, Emmanuel Varagnat wrote:
> (yesterday I wrote to lvm-devel@sistina.com, but it seems that it wasn't 
> the good place for my problem as nobody answer me :o| )
> 
> My problem, is that I set a VG over 3 IDE disk, and that the first one 
> crashed. I started writing a tool to recover my data but this tool need 
> to only read the data that belong to the Ext2 filesystem.
> Originally, there were 4 LV in the VG. Would I be able to access the 
> remaining data of LVs ? And how could I do that ?
> 
> I added the output of vgscan, pvdisplay and pvdata.

LVM1 can't retrieve data from a VG with a crashed PV (That's what your backups
are for).

LVM2 can if you active the VG with the -P (--partial) flag. LVM2 can read LVM2
metadata.

patrick

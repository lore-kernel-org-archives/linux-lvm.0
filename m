From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] kernel: zam-7001: io error in reiserfs_find_entry
Message-Id: <20020111110146.GE1274@tykepenguin.com>
References: <22543.1010745017@joergli.cocolab.de>
    <20020111103718.GA1274@tykepenguin.com>
    <20020111114737.A22576@codingtechnologies.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020111114737.A22576@codingtechnologies.de>
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
Date: Fri Jan 11 05:02:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 11, 2002 at 11:47:37AM +0100, Thomas Ziegler wrote:
> 
> Some Questions to LVM and snapshots:
> 
> - Do other filesystems cope in a better way with a full snapshot than reiserfs? 

Well ext2 just spits out errors without oopsing. I'm not sure about XFS or JFS.
 
> - What's the preferred fs in conjunction with lvm?

Whatever fs you prefer. That's why there's a choice !
 
> - Is there a way to get the snapshot not destroyed if it is getting full?

No. Once the snapshot is full then it can't be valid because there may be
blocks written to the original device that the snapshot can't backup. The only
way aoud this is to make your snapshots large enough to hold all the data that
is going to change on the original device during the backup.

patrick

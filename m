From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Updated VFS-lock patch for quota32 enabled 2.4
    kernels (was: Updated patch VFS-lock for 2.4.18+ XFS enabled kernels)
    Sender: linux-lvm-admin@sistina.com
Message-Id: <20020403103849.GA1072@tykepenguin.com>
References: <E16shtn-0000gF-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16shtn-0000gF-00@hermes.sistina.com>
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
Date: Wed Apr  3 04:38:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 03, 2002 at 08:19:31PM +1000, Adrian Head wrote:
> Chris Mason,
> 
> Please disregard the email and patch posted yesterday:
> http://marc.theaimsgroup.com/?l=linux-lvm&m=101775613225257&w=2
> 
> After discussions with the nice folks at SGI's XFS project - they have 
> suggested a change of patch name and explanation.
> 
> I'm still hoping that this linux-2.4.18+-quota32-VFS-lock.patch can be added 
> to the PATCHES directory in the LVM CVS for those people that use both LVM 
> and a 2.4 Kernel with Jan Kara's new Quota patches applied (like a 2.4.18+ 
> XFS enabled kernel).

Sounds like a reasonable compromise. I've added it to CVS as

linux-2.4.18+quota32-VFS-lock.patch

patrick

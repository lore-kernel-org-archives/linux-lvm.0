From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] raid1+lvm
Message-ID: <20020923151459.GG1358@tykepenguin.com>
References: <20020923102557.B74653-100000@true.fiberpimp.net> <3D8F2DD0.3050008@mindmatics.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D8F2DD0.3050008@mindmatics.de>
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
Date: Mon Sep 23 10:18:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Sep 23, 2002 at 05:05:52PM +0200, Andreas Baier wrote:
> Hi,
> 
> 
> here is a point where I would like to ask - is it really possible to 
> have swap on a logical volume?
> I always thought, it is only possible to have swap on a raid, perhaps 
> on a soft-raid, too, but on a lvm - please help me seeing this clear.
> 

I have two boxes that swap onto LVM2 volumes and have seen no problems. LVM1
should be OK too.

-- 

patrick

From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] disk naming
Message-ID: <20030104100014.GA11424@tykepenguin.com>
References: <1041610095.19844.45.camel@mosix> <20030103174618.Z9539@zealot.blacknet.de> <1041613503.20036.49.camel@mosix> <1023440000.1041619125@[192.168.200.4]> <20030103192045.GI18613@tykepenguin.com> <1121550000.1041664663@[192.168.200.4]>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1121550000.1041664663@[192.168.200.4]>
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
Date: Sat Jan  4 03:59:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Jan 04, 2003 at 01:17:43AM -0600, Steven Lembark wrote:
> 
> >NOPE, NOPE, NOPE.
> >
> >LVM writes a UUID to each disk and uses that as the PV identifier. it
> >does NOT matter what it is called to the kernel. (as long as the device
> >actually visible  to the code).*
> >
> >I regularly plug and unplug disks around LVM systems and it works just
> >fine.
> 
> And you move the SCSI cards around so that their bus
> addresses are changed w/o having any effect on LVM?
 
No, but that makes no difference either. Linux allocates the first disk as sda
and the second as sdb regardless of whether they are on the same controller or
not.

LVM uses the UUID to identify PVs, NOT major/minor numbers or names (didn't I
just say that?)


-- 

patrick

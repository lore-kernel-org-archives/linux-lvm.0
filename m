From: Trond Michelsen <mike@crusaders.no>
Subject: Re: [linux-lvm] removing a bad HD
Message-ID: <20031008180800.G3836@crusaders.no>
References: <20031004210122.S14777@crusaders.no> <3F8105B3.1040506@webhackande.se> <20031007175710.B25658@crusaders.no> <3F83BB32.7060308@webhackande.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3F83BB32.7060308@webhackande.se>; from richie@webhackande.se on Wed, Oct 08, 2003 at 09:22:26AM +0200
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
Date: Wed Oct  8 11:17:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 08, 2003 at 09:22:26AM +0200, Rickard Olsson wrote:
>> At the moment I'm a bit tempted to just set up a new VG, and migrate
>> data from the old VG file by file, disk by disk.
> If you have a spare disk to start the new VG with, that's probably a 
> good idea for several reasons (fresh filesystem, fresh metadata, the 
> ability to check disks offline before adding them to the VG and so on).

> I did this too since my old extents were rapidly becoming too small. New 
> LVs default to a max size of 2TB, when I originally created mine I 
> believe they were 250GB unless specified otherwise.

Yeah, it occured to me that this was probably the best opportunity I had
to increase the PE-size. So I set it to 32MB, giving me a maximum
LV-size of 2TB. 

BTW: What are the effects of choosing a large PE-size? Apart from
getting larger LV's, of course? Does it effect performance or memory
usage at all?

-- 
Trond Michelsen

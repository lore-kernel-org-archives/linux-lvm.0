Message-ID: <F888C30C3021D411B9DA00B0D0209BE8038F9672@cvo-exchange.cvo.roguewave.com>
From: Poul Petersen <petersp@roguewave.com>
Subject: RE: [linux-lvm] sar/iostat statistics for LVM
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
Date: Wed Sep 18 23:43:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

	Tsk, tsk, replying to my own post...
	
	It looks like the /proc/stat entry controls what is visible to
sar/iostat, and this is handled by the kstat_read_proc sub in
fs/proc/proc_misc.c. For whatever reason, disk info is added by looping
major 0->DK_MAX_MAJOR which is defined to be 16, so 58 never gets checked.
Has anyone ever fiddled with this to get sar/iostat working with LVM? I'm
thinking about just adding a check for major 58. Maybe this would be a post
for linux-scsi/kernel...

-poul

> -----Original Message-----
> From: Poul Petersen [mailto:petersp@roguewave.com]
> Sent: Wednesday, September 18, 2002 8:09 PM
> To: 'linux-lvm@sistina.com'
> Subject: [linux-lvm] sar/iostat statistics for LVM
> 
> 
> 	It seems that sar and iostat default to major 8 (sd) 
> when reporting
> disk activity statistics. For some reason, "iostat -x" seems broken in
> RedHat 7.2. Are other people using sar to monitor lvm disks? What was
> required to get sar/iostat to monitor major 58?
> 
> 
> Thanks,
> 
> 
> -poul
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 

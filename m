From: "James B. Byrne " <Support@Harte-Lyne.ca>
MIME-Version: 1.0
Message-ID: <3CF62BF4.16148.100D4B1C@localhost>
In-reply-to: <E17DJKw-0006ou-00@hermes.sistina.com>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] Re: LVM 1.03 root file system on Redhat 7.3
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
Date: Thu May 30 12:42:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On 30 May 2002 at 1:22, linux-lvm-request@sistina.com wrote:

> What I am seeing is this:
> 
> kmod: failed to exec /sbin/modprobe -s -k block-major-7 errno = 2 
> 
> repeated 16 times, followed by
> 
> vgvchange -- volume group "vg00" successfully activated
> 
> VFS: Cannot open root device "vg00"/lv01: or 00:00
> Please append correct "root=" boot option
> Kernel panic: VFS: Unable to mount root fs on 00:00


The kmod error is reputedly caused by the ramdisk image file 
(created by lvmcreate_initrd) not containing a /sbin/modprobe 
command.  How can I verify if this is so?  I note that redhat has 
/sbin/modprobe as a logical link to insmod.  Could this be confusing 
lvmcreate_initrd?

Regards,
Jim

---     e-mail is NOT a secure channel 
James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
Harte & Lyne Limited          http://www.harte-lyne.ca
9 Brockley Drive              vox: +1 905 561 1241
Hamilton, Ontario             fax: +1 905 561 0757
Canada  L8E 3C3

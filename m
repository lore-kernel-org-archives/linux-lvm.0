Message-ID: <134714172.1003357674676.JavaMail.root@boots>
Date: Wed, 17 Oct 2001 15:27:31 -0700
From: "Karl" <rmvzj001@sneakemail.com>
Subject: Re: [linux-lvm] read_intr errors
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wed, Oct 17, 2001 at 02:20:23PM -0700, Erick Calder e@arix.com XXXXXXXXXXXXXXXXXXXX wrote:
> I haven't tried that but if I unmount the filesystem and check it:
> 
> # umount /dev/LVM/mp3z
> # fsck /dev/LVM/mp3z
> 
> it comes up clean....  is that not an equivalent test?

Not sure. I don't think fsck checks every block. The errors I saw certainly
were consistant in location on the LVM, but there were no corrisponding errors
on the hardware. You can try the following

cat /dev/vg.../lvol/... >/dev/null # where vg and lvol are appropriate for your file system.

cat /dev/hd... # were hd is your physical device. If you get errors on one and
# not the other, you too will be an example of the problem we are talking about.

-- 
Karl Hakimian

Subject: Re: [linux-lvm] Chicken and egg problem..
Message-ID: <20011121140758.GH9907@pc.ilinx>
References: <1006347197.3bfba3bd23d95@imp.free.fr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1006347197.3bfba3bd23d95@imp.free.fr>
From: "Brian J. Murrell" <4fb38711a90b276be2ad0dff3761129b@interlinx.bc.ca>
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
Date: Wed Nov 21 12:36:07 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 21, 2001 at 01:53:17PM +0100, Georges Giralt wrote:
> 
> As I've previously said, I plan to make my RedHat 7.1 (kernel 2.4.5) a pure LVM 
> machine.
> To do so, I've build the 1.0.4 version of LVM into the kernel (with the NCR SCSI 
> driver). As to avoid an initrd. Simple is beautifull...

Simple might be beautiful but compiling LVM into the kernel does not
alleviate the need for an initrd if your root fs is on an LVM device.

> In the sysinit rc script, Redhat has put a vg activation command, but....
> My kernel panics, as it is unable to mount root, as the LVM activation commands 
> are after the root fsck (and mount..)
> 
> If I put the LVM activation lines early, in the sysinit script, these commands 
> complains beeing not able to access /etc/lvmtab....

Now you know why you need an initrd.  :-)

b.

-- 
Brian J. Murrell

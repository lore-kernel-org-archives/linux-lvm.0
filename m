From: lvm@interlinx.bc.ca
Subject: Re: [linux-lvm] moving single LVM disk from one system to another
Message-ID: <20020819090226.GA13367@linux.interlinx.bc.ca>
References: <20020817070901.GA5022@linux.interlinx.bc.ca> <20020819102427.A24314@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020819102427.A24314@sistina.com>
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
Date: Mon Aug 19 04:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Aug 19, 2002 at 10:24:27AM +0200, Heinz J . Mauelshagen wrote:
> 
> Is that with our without devfs?

Interesting you should ask.  :-)

> Have you checked, that device nodes are in your initrd for vgscan to be able
> to access them fine?

I am/was (for the past hour or two) just hunting this possibility
down.  I have the system currently booting from a tftp server (via an
etherboot diskette) so that I can shorten the cycle of "modify initrd
with more debugging and re-test".  I am just about to put some
debugging into the native hard disk booting initrd to see what disk
nodes are there and such.

The kernel is being booted with "devfs=mount", so they should be
there.  I should know in a few more minutes what is going on.

> Does vgscan fail finding your VG our is it just wrong entries in /etc/fstab
> failing your root mount?

vgscan fails to find the VG.  I am sure this is going to turn out to
be missing device nodes, but will have figure out why that is if devfs
is being mounted.

Will keep ya posted.

b.

-- 
Brian J. Murrell

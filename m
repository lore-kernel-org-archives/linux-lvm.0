From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm-1.0.1 patch causes kernel compile errors on SPARC64
Message-ID: <20011130181638.A24533@tykepenguin.com>
References: <Pine.GSO.4.21.0111300950270.5383-100000@devmail.dev.tivoli.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.21.0111300950270.5383-100000@devmail.dev.tivoli.com>
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
Date: Fri Nov 30 12:15:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 30, 2001 at 10:49:29AM -0600, Rich Scheller wrote:
> I just tried to build a generic 2.4.16 kernel with lvm-1.0.1 patches on a
> Sun Enterprise 250, following the directions in lvm_1.0.1.tar.gz.  I got
> an error in the SPARC 64/32-bit ioctl conversion code.  Does anyone have
> any ideas on how to proceed?  Is LVM even supported on SPARC64 platforms?

It certainly was working so it looks like some inconsistencies have crept in.
You should be able to remove all references to the inode member in ioctl32.c and
it will work.

As I don't have an UltraSPARC to test it on can you let me know whether it does
work please(!) - though I'm fairly sure it will.
 
patrick

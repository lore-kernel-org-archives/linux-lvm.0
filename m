Date: Tue, 28 Aug 2001 08:54:15 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] snapshot of reiserfs lv -- status of the VFS lock patches.
Message-ID: <20010828085415.C609@tykepenguin.com>
References: <wxxitfenw4n.fsf@ninhursaga.uio.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wxxitfenw4n.fsf@ninhursaga.uio.no>; from terjekv@math.uio.no on Fri, Aug 24, 2001 at 02:23:52AM +0200
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Aug 24, 2001 at 02:23:52AM +0200, Terje Kvernes wrote:
> 
>   using an unmodified (besides the lvm1.0-patches generated) kernel
>   I attempted to make a snapshot of a lv:
> 
>   [1] the patchlog of the 2.4.4 VFS lock patch against 2.4.9, the
>   reject of ksyms.c is as far as I can see only two
>   EXPORT_SYMBOL-calls. 

Chris Mason posted a new VFA lock patch for 2.4.8+ heer:

http://lists.sistina.com/pipermail/lvm-devel/2001-August/000612.html

And it's also in CVS now too.

patrick

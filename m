From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Some suggestions about lvminitrd_create
Message-ID: <20020517071903.GA1098@tykepenguin.com>
References: <E177uaF-0000ja-00@jelly.buzzard.org.uk> <20020516162341.A25098@sistina.com> <008c01c1fceb$e29f7660$3b00a8c0@aplabwp0368359> <20020516152200.GP1248@tykepenguin.com> <3CE48E38.40605@wanadoo.fr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3CE48E38.40605@wanadoo.fr>
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
Date: Fri May 17 02:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, May 17, 2002 at 06:59:36AM +0200, Francis SOUYRI wrote:
> Hello,
> 
>    I use "romfs" for the 'initrd" it take less place in the kernel than 
> "ext2" (I use "reiserfs" for "normal" filesystems), the only problem is 
> that "romfs" is a read only filesytem but you can use the "tmpfs" like 
> this in your "linuxrc" script:

Ah, now that makes a lot of sense.

-- 

patrick

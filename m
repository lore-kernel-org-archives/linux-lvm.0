From: Tren Blackburn <tren@EOTnetworks.com>
Message-ID: <Pine.LNX.4.33.0110301259320.5641-100000@EOTnetworks.com>
MIME-Version: 1.0
Subject: [linux-lvm] (no subject)
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
Date: Tue Oct 30 14:01:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thanks Patric,

I actually just decided to not use Alan Cox's patch and just reverted back
to a vanilla Linus kernel.  I'll wait for the dust to settle before
worrying about it.  Only reason this was a question was because I added
more memory to this server and needed HIGHMEM support in order to address
it (thank god for cheap memory!) so I wanted to upgrade the kernel in the
process.

Thanks for the information.

Regards,

Tren.


>Date: Tue, 30 Oct 2001 08:32:49 +0000
>From: Patrick Caulfield <caulfield@sistina.com>
>To: linux-lvm@sistina.com
>Subject: Re: [linux-lvm] Problems compiling LVM 1.0.1rc4 and kernel
>2.4.13-ac4
>Reply-To: linux-lvm@sistina.com

>On Mon, Oct 29, 2001 at 11:03:47AM -0700, Tren Blackburn wrote:
> Hi list;
>
> Not sure if this has been asked/solved yet.  I searched through the
lists
> and found
> http://lists.sistina.com/pipermail/linux-lvm/2001-October/009353.html
> however, what was stated in this message thread didn't seem to solve
this
> problem.  I'm getting these errors when linking the kernel:
>
>See http://lists.sistina.com/pipermail/linux-lvm/2001-October/009252.html
>
>For a patch.
>
>The gendisk fix is in CVS but the kiovec API change isn't because it's
>different
>between Alan and Linus kernels.
>
>patrick


-- 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
- Tren Blackburn - Owner                mailto:tren@eotnetworks.com  =
= EOT Networks                           http://www.eotnetworks.com  -
- Infinite Solutions for a Finite World              (403) 818-7658  =
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Is lvmcreate_initrd expected to work?
Message-ID: <20011129090508.B1408@tykepenguin.com>
References: <3C041A0D.70608@larsshack.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C041A0D.70608@larsshack.org>
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
Date: Thu Nov 29 03:03:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 27, 2001 at 05:56:13PM -0500, Lars Kellogg-Stedman wrote:
> Now that we've solved the pressing oh-my-goodness-my-system-won't-boot 
> problem, I've got a few other questions.
> 
> The lvm package comes with the nifty lvmcreate_initrd command...but in 
> my experience it simply doesn't work.  While it's especially clever 
> about resolving library dependencies, it seems to ignore the issue of 
> kernel modules. 

Yes it does ignore the issue of kernel modules. It's quite hard for 
lvmcreate_initrd to know just which modules are needed to get the system booted,
though I suppose it's possible.

It is recommended that you build the kernel with the drivers needed to mount the
root partition compiled in, rather than as modules. I realise this goes against
the Red Hat methodology of having everything as a module.

patrick

From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] cannot mount snapshot volumes
Message-ID: <20020925092633.GM1291@tykepenguin.com>
References: <001201c263e0$584c1340$db64a8c0@marien> <20020925071719.GH1291@tykepenguin.com> <003001c26473$7a6a5200$db64a8c0@marien>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <003001c26473$7a6a5200$db64a8c0@marien>
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
Date: Wed Sep 25 04:32:33 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 25, 2002 at 11:11:04AM +0200, Marien Tielemans - Van Boxtel Software BV wrote:
> Hello Patrick,
> 
> Redhat 7.3 uses kernel 2.4.18-3 .
> I tryed to patch the kernel with : linux-2.4.18-VFS-lock.patch (located in
> LVM/1.0.5/PATCHES )
> 
> In the README it is mentioned that kernels supplied with RedHat , Mandrake
> etc are a little different from the kernels
> supplied bij kernel.org .
> Since the lvm-1.0.5-2.4.18-3custom.patch worked fine with the "RedHat "
> kernel i thought the VFS-lock patch also should work.
> What do you advise me to do ?
>  Thanks,
> 

The LVM patches adapt themselves to the kernel you are patching so should apply
to most kernels without trouble. the VFS lock patch is just a static patch
against the named kernel.

Your options are:

1) build a 2.4.19 kernel from ftp.*.kernel.org
2) apply the VFS lock patch to the redhat kernel and manually fix the rejects
3) lean on redhat to include the patch

patrick

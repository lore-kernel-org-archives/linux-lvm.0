From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] cannot mount snapshot volumes
Message-ID: <20020925071719.GH1291@tykepenguin.com>
References: <001201c263e0$584c1340$db64a8c0@marien>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001201c263e0$584c1340$db64a8c0@marien>
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
Date: Wed Sep 25 02:44:44 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Sep 24, 2002 at 05:37:50PM +0200, Marien Tielemans - Van Boxtel Software BV wrote:
>    Hello ,
>     
>    I am using a stock RedHat 7.3 server (ext 3 fs) with lvm 1.0.3 installed ,
>    i upgraded lvm to 1.0.5 ( kernel patch etc.).
>    LVM works fine however i cannot mount the created snapshot volume.
>     
>    When doing a mount the server tells me : Wrong fs type , bad option, bas
>    superblock on /dev/lvmgroup1/snapshot , or too many mounted file systems.
>     
>    In the mailing list i read that the solution for this problem : patch the
>    kernel with  linux-2.4.18-VFS-lock.patch.( applied in the 1.0.5 tar file)
>     
>    However when i apply the patch i get messages about Reverse patches and
>    several chunks and files not being patched .So compiling the kernel again
>    also gives problems.
>     
>    I like to know, is there another patch file i have to use , or a better
>    solution for this problem ?

Which kernel version are you using? The VFS lock patch will probably only apply
to the named kernel.org kernel.

-- 

patrick

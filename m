Date: Tue, 27 Jun 2000 04:02:12 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Message-ID: <20000627040212.A11246@gruyere.muc.suse.de>
References: <299BF5F5EF5ED31196760008C7D9AE5D03AFCA1F@STLABCEXG022> <3957E4B8.99CC906C@inet.net.nz>
Mime-Version: 1.0
In-Reply-To: <3957E4B8.99CC906C@inet.net.nz>; from dale@inet.net.nz on Tue, Jun 27, 2000 at 11:18:16AM +1200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dale Kemp <dale@inet.net.nz>
Cc: "Wilson, Eric" <Eric.Wilson@anheuser-busch.com>, Linux LVM mailing list <linux-lvm@msede.com>

On Tue, Jun 27, 2000 at 11:18:16AM +1200, Dale Kemp wrote:
> Looking at the Linux VFS (Virtual FileSystem) seems to show up some problems,
> for example I was more than surprised to find a big union with all the inode types
> from every kind of filesystem in Linux. And yet there is still a call to register a
> filesystem
> with VFS. VFS is certainly not abstract. Any good OO programmer would have never
> done it this way. Maybe we need SGIs Irix/vfs system more than we
> need their XVM. See the white paper at SGI - "Porting the SGI XFS
> File System to Linux", for more on this.
> Linux VFS should know nothing about other filesystems until its told about them,
> for example when you insert a filesystem module into the kernel.
> [ Sorry this is a bit off topic for this list, but I feel its still important
> to the overall linux filesystem itself. ]

The generic VFS code just never looks into the union,it is certainly 
abstractly used. Putting it into the union is just an performance optimization 
to make it use one allocation less in critical paths. File systems that
do not want to change the source files are free to use the generic_ip
pointer instead and let it point to a private structure.

-Andi (who prefers Linux VFS over ``8.3 macro hell'' Sun/BSD derived VFS)  

Message-ID: <3EF781FB.2000804@cox.net>
From: "Kevin P. Fleming" <kpfleming@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] read-only media in a LVM?
References: <C42D120999B1CC4C886B6BB2832F356019BF8F@hermes.genomatica.com>
In-Reply-To: <C42D120999B1CC4C886B6BB2832F356019BF8F@hermes.genomatica.com>
Content-Transfer-Encoding: 7bit
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
Date: Mon Jun 23 17:41:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Sean P. Kane wrote:

> Ok, let me clarify a bit. I mis-spoke, when I spoke of memory I meant
> ramdisk (fs). This is basically what I was actually visualizing in my
> head:
> 
> 1) Boot cdrom into a Linux instance.
> 2) Mount a read-write filesystem into memory (this is why I asked the
> size issue, obviously coping the whole cdrom to memory wouldn't be
> practical)
> 3) Create a snapshot (I'm am really new to lvm, so I'm still learning
> what all this means), which would be a small reference table of some
> sort, plus 32k blocks of changed data.
> 4)This would then allow "changes" to the cdrom while running in that
> session until the ram disk filled up? Correct?
> 5) If a file is created then deleted in an environment like this will
> the space it was using in the snapshot fs be released?
> 

This is not really an application for LVM snapshots at all. Snapshots would 
continue to use more and more memory if those files are created and removed, 
unless the underlying filesystem is very intelligent about space allocation 
(which the iso9660 filesystem is very likely not).

This is really an application for a "union" mount. This could also be done with 
a "bind" mount, if the files that need changing can be isolated to a small 
number of directories. If they are spread all over the filesystem, or their 
locations are not known ahead of time, a "union" mount would do what you need, 
overlaying a tmpfs ram-based filesystem on top of the CD-ROM filesystem.

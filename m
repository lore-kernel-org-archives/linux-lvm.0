Return-Path: <josv@osp.nl>
Date: Fri, 23 Mar 2001 09:51:33 +0100
From: josv@osp.nl
Subject: Re: [linux-lvm] Re: [catch22] lvm vs reiserfs
Message-ID: <20010323095133.C5617@gatekeeper.osp.nl>
References: <416700000.985291855@tiny> <01032216065300.00692@oscar> <01032223332600.01178@oscar> <20010323091953.B10727@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20010323091953.B10727@colombina.comedia.it>
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

Snapshots are by their very nature read-only animals. Their internal
organisation is such that they can not easily be written to.
Mounting it readonly informs the file system of this fact.

It seems from the output that the ReiserFS code wants to replay
the journal, which leads me to believe that the file system was
not properly sync'ed before the snapshot was taken. Maybe the
VFS_lock patch needs to be updated?

++Jos

On Fri, Mar 23, 2001 at 09:19:53AM +0100, Luca Berra wrote:
> On Thu, Mar 22, 2001 at 11:33:26PM -0500, Ed Tomlinson wrote:
> > oscar# mount /dev/lv/snap /snap -treiserfs -oro
> why readonly?
> 
> > reiserfs: checking transaction log (device 3a:04) ...
> > clm-2076: device is readonly, unable to replay log
> > Replay Failure, unable to mount
> > reiserfs_read_super: unable to initialize journal space
> > mount: wrong fs type, bad option, bad superblock on /dev/lv/snap,
> >        or too many mounted file systems
> 
> -- 
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

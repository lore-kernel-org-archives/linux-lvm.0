Return-Path: <bluca@comedia.it>
Date: Fri, 23 Mar 2001 09:19:53 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: [catch22] lvm vs reiserfs
Message-ID: <20010323091953.B10727@colombina.comedia.it>
References: <416700000.985291855@tiny> <01032216065300.00692@oscar> <01032223332600.01178@oscar>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01032223332600.01178@oscar>; from tomlins@cam.org on Thu, Mar 22, 2001 at 11:33:26PM -0500
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

On Thu, Mar 22, 2001 at 11:33:26PM -0500, Ed Tomlinson wrote:
> oscar# mount /dev/lv/snap /snap -treiserfs -oro
why readonly?

> reiserfs: checking transaction log (device 3a:04) ...
> clm-2076: device is readonly, unable to replay log
> Replay Failure, unable to mount
> reiserfs_read_super: unable to initialize journal space
> mount: wrong fs type, bad option, bad superblock on /dev/lv/snap,
>        or too many mounted file systems

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

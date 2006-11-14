Date: Tue, 14 Nov 2006 17:02:47 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Update to lvm2create_initrd
Message-ID: <20061114170247.GD30653@agk.surrey.redhat.com>
References: <CA207AAA-711C-4AAD-911A-4301C61C165B@mayle.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA207AAA-711C-4AAD-911A-4301C61C165B@mayle.org>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Douglas Mayle <douglas@mayle.org>
Cc: Jeff Layton <jtlayton@poochiereds.net>, LVM <linux-lvm@redhat.com>

On Sat, Nov 11, 2006 at 12:18:39PM +0100, Douglas Mayle wrote:
> I've made an update to the lvm2create_initrd script that fixes some  
> problems with ldd output that were never addressed in the first  
> version (e.g. libraries linked with a static path).
 
> I also check for binaries in the path, rather than hardcoding their  
> location, and I've added support for the Gentoo style of MAKEDEV.


Please update the changelog.

Can someone confirm the updated script also still works on Debian?


-BINFILES=${BINFILES:-"/lib/lvm-200/lvm /bin/bash /bin/busybox /sbin/pivot_root"}
+BINFILES=${BINFILES:-"`which lvm` `which bash` `which busybox` `which pivot_root`"}

Will 'which lvm' always give the same answer as before on Debian,
or, if not, does it matter?


-LIBFILES=`ldd $BINFILES 2>/dev/null | awk '{if (/=>/) { print $3 }}' | sort -u`
+LIBFILES=`ldd $BINFILES 2>/dev/null |grep -v linux-gate |grep -v : | awk '{if (/=>/) { print $3 } else if (/\//) { print $1 }}' | sort -u`

This needs a comment explaining what's going on (e.g. include sample 
output in the comment).  What's special about linux-gate?
And why not combine the two greps?  -E (linux-gate|:)

Alasdair
-- 
agk@redhat.com

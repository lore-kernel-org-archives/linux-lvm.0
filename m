Date: Fri, 29 Feb 2008 18:31:48 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Page cache corruption when creating a snapshot
Message-ID: <20080229183148.GI1788@agk.fab.redhat.com>
References: <200802291732.m1THWfD7013248@outgoing.mit.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200802291732.m1THWfD7013248@outgoing.mit.edu>
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
To: ghudson@MIT.EDU
Cc: linux-lvm@redhat.com

On Fri, Feb 29, 2008 at 12:32:41PM -0500, ghudson@MIT.EDU wrote:
> The reproduction recipe looks like:
>   rm -rf /tmp/test
>   mkdir /tmp/test
>   # Put around 60MB of files into /tmp/test
>   find /tmp/test -type f | xargs md5sum > /tmp/sum.pre
>   lvcreate --size 2G --snapshot /dev/dink/gutsy-i386-sbuild --name testsnapshot
>   find /tmp/test -type f | xargs md5sum > /tmp/sum.post

Can you do that twice?
    find /tmp/test -type f | xargs md5sum > /tmp/sum.post2
and check the two post files are the same?

And add some syncs/blockdev --flushbufs at different places
in the script to see if you can make it go away.

Alasdair
-- 
agk@redhat.com

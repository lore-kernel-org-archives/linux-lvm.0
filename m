Subject: Re: [linux-lvm] mount reiserfs snapshot failed
Message-Id: <20020418094402.GA1233@fib011235813.fsnet.co.uk>
References: <3CBE92EB.89FB2B07@mc-lindinger.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3CBE92EB.89FB2B07@mc-lindinger.de>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Thu Apr 18 04:43:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Apr 18, 2002 at 11:33:31AM +0200, Markus Bartl wrote:
> Hi there.
> 
> Im using the original kernel 2.4.18 with the locking patch and the
> lvm-patch applied. I use the lvm in Version 1.1rc1.
> I got one harddisk with 4 partitions on it, 1 partition is Linux LVM.
> The volume to backup is mounted on /home and has reiserfs. 
> 
> I made a shell-script to perform a test using snapshots.
> Here is what it does (looped):
> 1) create snapshot
> 2) mount snapshot --> fails sometimes (35 loops, 6 fails)
> 3) backup snapshot
> 4) create file on original volume while backup is still running
> 5) unmount snapshot
> 6) remove snapshot
> 
> In some cases mounting the snapshot volume fails with error 32 (wrong fs
> type or bad superblock).
> Anybody got any idea???

Do version 1.0.3 tools fail in the same way ?

- Joe

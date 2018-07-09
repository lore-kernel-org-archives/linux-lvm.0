Date: Mon, 9 Jul 2018 12:18:59 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20180709171859.GB13875@redhat.com>
References: <CABZYMH7=O418BQ+Xh0bo_6mmp1nNmK4r5w_=vJkS4YdYyWjEwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABZYMH7=O418BQ+Xh0bo_6mmp1nNmK4r5w_=vJkS4YdYyWjEwQ@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] "VG xxx lock faied: error -221" while lv
 operation sucess
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Damon Wang <damon.devops@gmail.com>
Cc: linux-lvm@redhat.com

On Thu, Jul 05, 2018 at 05:37:57PM +0800, Damon Wang wrote:
> Hi,
> 
> Sometimes I got "VG f68643c145454594871f6f51b69bf8ba lock failed:
> error -221" at vg operations, likes lvcreate, while lv operation and
> i/o on disks is good.

It looks like the lock was acquired but not released for some reason,
so subsequent attempts to acquire it are failing.  There are a couple
things you could send that might narrow down what happened:

- Anything from /var/log/messages (or /var/log/sanlock.log) related
  to that lock.

- 'sanlock status' which will probably show that it's still held.

> I have tried stop lock and start again, but still error -221

That was the right idea.  Stop was probably ignored (because it thought
the lockspace/vg was busy).  I'll try some possible workarounds and send
you a suggestion based on that.

Dave

MIME-Version: 1.0
References: <CABZYMH7=O418BQ+Xh0bo_6mmp1nNmK4r5w_=vJkS4YdYyWjEwQ@mail.gmail.com>
	<20180709171859.GB13875@redhat.com>
In-Reply-To: <20180709171859.GB13875@redhat.com>
From: Damon Wang <damon.devops@gmail.com>
Date: Tue, 10 Jul 2018 15:52:26 +0800
Message-ID: <CABZYMH5_CTiubbMgAm-5GN+HrKcK+rVV4z6_n5xcad-oPm4qCg@mail.gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi dave,

Thank you for your reply, unfortunately I have rebooted that host last stat :(

But good news is I have saved some logs, but I don't know weather it
helps since I only saved "lvmlockctl -i", "sanlock client status",
sanlock.log and messages.

I pasted "sanlock client status" on https://pastebin.com/M9TRKeBk
"lvmlockctl -i ": https://pastebin.com/v9E1Atig

Related messages and sanlock.log:

"messages": https://pastebin.com/1tqtQvDS
"sanlock.log": https://pastebin.com/ESA4Wz3B

Thanks!
Damon
David Teigland <teigland@redhat.com> 于2018年7月10日周二 上午1:19写道：
>
> On Thu, Jul 05, 2018 at 05:37:57PM +0800, Damon Wang wrote:
> > Hi,
> >
> > Sometimes I got "VG f68643c145454594871f6f51b69bf8ba lock failed:
> > error -221" at vg operations, likes lvcreate, while lv operation and
> > i/o on disks is good.
>
> It looks like the lock was acquired but not released for some reason,
> so subsequent attempts to acquire it are failing.  There are a couple
> things you could send that might narrow down what happened:
>
> - Anything from /var/log/messages (or /var/log/sanlock.log) related
>   to that lock.
>
> - 'sanlock status' which will probably show that it's still held.
>
> > I have tried stop lock and start again, but still error -221
>
> That was the right idea.  Stop was probably ignored (because it thought
> the lockspace/vg was busy).  I'll try some possible workarounds and send
> you a suggestion based on that.
>
> Dave

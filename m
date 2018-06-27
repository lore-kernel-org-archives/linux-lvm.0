Date: Wed, 27 Jun 2018 10:26:08 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20180627152608.GC5690@redhat.com>
References: <CABZYMH6HdrtYOb-eu1VOfUAMv+OqzzuP3VBviZLX=2M5WJTX-g@mail.gmail.com>
	<20180627142357.GB5690@redhat.com>
	<39BDFE7B-6CB1-475C-877B-CA0A4ED59577@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39BDFE7B-6CB1-475C-877B-CA0A4ED59577@gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] "Duplicate sanlock global locks" warned
 but not found in "lvmlockctl -i"
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
To: Damon Wang <damon.devops@gmail.com>
Cc: linux-lvm@redhat.com

On Wed, Jun 27, 2018 at 11:15:03PM +0800, Damon Wang wrote:
> I’m wonder why I see only one global lock in lvmlockctl -i, should I got
> multiple gl lock in lvmlock -i when it warn “duplicate gl lock”？

lvmlockctl is showing you the one global lock that lvmlockd is using, and
the vgs command is showing you all the global locks that it sees on disk.
Just disable the global lock that is not being used (the one not in
lvmlockctl) with lvmlockctl --gl-disable and the warning should disappear.

Dave

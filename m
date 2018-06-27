Mime-Version: 1.0 (1.0)
From: Damon Wang <damon.devops@gmail.com>
In-Reply-To: <20180627152608.GC5690@redhat.com>
Date: Thu, 28 Jun 2018 00:35:22 +0800
Message-Id: <8D910C47-ADF5-4DAD-90FF-ED4AA30172E3@gmail.com>
References: <CABZYMH6HdrtYOb-eu1VOfUAMv+OqzzuP3VBviZLX=2M5WJTX-g@mail.gmail.com>
	<20180627142357.GB5690@redhat.com>
	<39BDFE7B-6CB1-475C-877B-CA0A4ED59577@gmail.com>
	<20180627152608.GC5690@redhat.com>
Content-Transfer-Encoding: 8bit
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
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

Got it, thanks a lot!

Damon

> 在 2018年6月27日，下午11:26，David Teigland <teigland@redhat.com> 写道：
> 
>> On Wed, Jun 27, 2018 at 11:15:03PM +0800, Damon Wang wrote:
>> I’m wonder why I see only one global lock in lvmlockctl -i, should I got
>> multiple gl lock in lvmlock -i when it warn “duplicate gl lock”？
> 
> lvmlockctl is showing you the one global lock that lvmlockd is using, and
> the vgs command is showing you all the global locks that it sees on disk.
> Just disable the global lock that is not being used (the one not in
> lvmlockctl) with lvmlockctl --gl-disable and the warning should disappear.
> 
> Dave

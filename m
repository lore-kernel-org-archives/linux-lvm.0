Date: Tue, 14 Sep 2004 21:16:19 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Unable to create lvm1 configurations
Message-ID: <20040914201619.GF2377@agk.surrey.redhat.com>
References: <ce9f1f9e040911233347ca7ec8@mail.gmail.com>
	<20040912115653.GK1094@agk.surrey.redhat.com>
	<ce9f1f9e04091301587ea0256b@mail.gmail.com>
	<20040913104134.GO1094@agk.surrey.redhat.com>
	<ce9f1f9e0409131339319648a3@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce9f1f9e0409131339319648a3@mail.gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanley Yue <stanley.yue@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Sep 13, 2004 at 01:39:58PM -0700, Stanley Yue wrote:
>   device-mapper ioctl cmd 13 failed: Invalid argument

13 is DM_LIST_VERSIONS_CMD

Newer versions of device-mapper support this, but the tools
cope fine without it.

But it is an indication you're not running the latest kernel
and you ought to update it:-)

Alasdair
-- 
agk@redhat.com

Date: Sun, 12 Sep 2004 12:56:53 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Unable to create lvm1 configurations
Message-ID: <20040912115653.GK1094@agk.surrey.redhat.com>
References: <ce9f1f9e040911233347ca7ec8@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce9f1f9e040911233347ca7ec8@mail.gmail.com>
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
To: Stanley Yue <stanley.yue@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Sep 11, 2004 at 11:33:06PM -0700, Stanley Yue wrote:
> [root@DAP-RHLNX1 tools]# vgcreate -v --metadatatype 1 vg1-lvm2
> /dev/hda6 /dev/hda7
>   Invalid argument 1
>   Error during parsing of command line.

Works for me.

Perhaps support for 'lvm1' metadata was not compiled in, or
not loaded from lvm.conf if you configured it shared?

Alasdair
-- 
agk@redhat.com

Date: Mon, 13 Sep 2004 11:41:34 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Unable to create lvm1 configurations
Message-ID: <20040913104134.GO1094@agk.surrey.redhat.com>
References: <ce9f1f9e040911233347ca7ec8@mail.gmail.com>
	<20040912115653.GK1094@agk.surrey.redhat.com>
	<ce9f1f9e04091301587ea0256b@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce9f1f9e04091301587ea0256b@mail.gmail.com>
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

On Mon, Sep 13, 2004 at 01:58:14AM -0700, Stanley Yue wrote:
> with the lvm-mod and device-mapper from lvm2. I want to test out
> whether lvm2 utilities can detect configurations created from lvm1
> utilities.
 
> pvcreate -- ERROR: VGDA in kernel and lvmtab are NOT consistent;
> please run vgscan

Never run LVM2 utilities while you have LVs active under LVM1.
Never run LVM1 tools while you have LVs active under LVM2.

i.e. Never mix use of the two, and always vgchange -an before switching 
between LVM1 and LVM2.
Also, if switching back from LVM2 to LVM1 you must first reset the 
LVM1 driver with lvmchange -R followed by vgscan -f.

Alasdair
-- 
agk@redhat.com

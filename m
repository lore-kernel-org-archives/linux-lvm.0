Date: Wed, 8 Sep 2004 10:35:18 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Resend: API for retrieving linux lvm information
Message-ID: <20040908093518.GC1094@agk.surrey.redhat.com>
References: <ce9f1f9e04090623046460fed8@mail.gmail.com>
	<20040907094413.GA6264@agk.surrey.redhat.com>
	<ce9f1f9e04090718394fa17cde@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce9f1f9e04090718394fa17cde@mail.gmail.com>
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

On Tue, Sep 07, 2004 at 06:39:24PM -0700, Stanley Yue wrote:
> As far as the parsing goes, is it better (in terms of compatibility,
> output stability) to parse against the command line output (i.e.
> lvdisplay) or against the /proc/filesystems (i.e.
> /proc/lvm/VGs/vg00/LVs)?
 
My answer was for LVM2.
Looks like you're using LVM1.
To simplify your future upgrade you should consider using LVM2 tools
lvs/pvs/vgs read-only even on an LVM1 installation as their output is 
designed to be easy to parse.

Alasdair
-- 
agk@redhat.com

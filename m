Date: Thu, 28 Oct 2004 16:11:58 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Bug#278606: LV names with hyphens don't work
Message-ID: <20041028151158.GA20444@agk.surrey.redhat.com>
References: <E1CN3GB-0004i8-6C@samv.private.marketview.co.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1CN3GB-0004i8-6C@samv.private.marketview.co.nz>
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
To: lvm2 <sam@vilain.net>, 278606@bugs.debian.org, LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Oct 28, 2004 at 06:55:43PM +1300, lvm2 wrote:
> I just created an LV with a hyphen, and it had all sorts of problems
> when I went to remove it - I couldn't remove the mount point directory
> (rmdir returned EBUSY), 

LVs with hyphens in them are certainly supported by LVM2.
Whether any other scripts/tools you used have problems, I don't know.

If it happens again, use something like 'lsof' to see what has 
it open stopping you from unmounting it.

Alasdair
-- 
agk@redhat.com

Date: Tue, 15 Jun 2010 17:47:09 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100615164709.GG15698@agk-dp.fab.redhat.com>
References: <4C179B03.2000102@cfl.rr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4C179B03.2000102@cfl.rr.com>
Subject: Re: [linux-lvm] Why does every lvm command insist on touching	every
	pv?
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
To: Phillip Susi <psusi@cfl.rr.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jun 15, 2010 at 11:23:47AM -0400, Phillip Susi wrote:
> Every time I run any lvm command, it goes out and touches every pv,
> causing all the disks to wake up from standby.  Why is this?  Shouldn't
> a simple lvs command be able to look in the /etc/lvm/cache for what it
> needs instead of touching every pv, even ones with no lvs on them?
 
It shouldn't normally scan unless it detects something might have changed, but
if you know the volume group name(s) already, put them on the command line: 
  lvs vg1 vg2

(As always -vvvv may give you clues as to what is triggering the scan.)

Alasdair

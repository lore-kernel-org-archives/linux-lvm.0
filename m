From: Toby Dickenson <toby@tarind.com>
Subject: Re: [linux-lvm] PV corruption: allocated PE > total PE
Date: Wed, 13 Oct 2004 00:01:19 +0100
References: <200410120841.14323@trumpet.tarind.com>
	<20041012131024.GR6404@agk.surrey.redhat.com>
In-Reply-To: <20041012131024.GR6404@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200410130001.19680@trumpet.tarind.com>
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
To: linux-lvm@redhat.com
Cc: Alasdair G Kergon <agk@redhat.com>

On Tuesday 12 Oct 2004 14:10, Alasdair G Kergon wrote:
> On Tue, Oct 12, 2004 at 08:41:14AM +0100, Toby Dickenson wrote:
> > Ive just noticed that one of my PVs has more allocated PE's than the
> > total available, leading to a negative amount of free space:
> >
> > This is on a gentoo linux system, kernel 2.6.6. The latest LVM userland
> > in gentoo is 2.00.08, I havent tried anything more recent, but there
> > doesnt seem anything relevant in the change log.
>
> Definitely try the latest version: there've been a few related fixes.

OK, I'm on lvm .25 and device mapper .19. 

I removed the newest LV in that PV, then rebooted. Everything looked right, 
and the metadata backup was as I expected. However using lvcreate again to 
create a sufficiently large LV (large enough to fill this PV plus a bit more) 
recreated the original problem in pvdisplay's output.

> (With lvm1 on-disk format, may need to backup restore/metadata if it's
> wrong on disk.)

The following values all seem to be consistent:
* pvdisplay 'Total PE'
* pe_count in /etc/lvm/backup/
* the total of the relevant 'extent_count' fields in /etc/lvm/backup/

But the value reported by pvdisplay 'Allocated PE' is too large. Where does 
pvdisplay get that value from? Do I need to worry about data corruption, or 
could this be just a display formatting bug?

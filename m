Return-Path: <juergens@muon.de>
Date: Fri, 26 Jan 2001 23:36:26 +0100
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Re: [lvm-devel] Keeping swap in the middle of the disk
Message-ID: <20010126233626.B19697@guldukat.muon>
References: <200101262008.f0QK8F715746@webber.adilger.net> <Pine.SOL.4.21.0101262055260.19267-100000@green.csi.cam.ac.uk>
Mime-Version: 1.0
In-Reply-To: <Pine.SOL.4.21.0101262055260.19267-100000@green.csi.cam.ac.uk>; from cdw22@hermes.cam.ac.uk on Fri, Jan 26, 2001 at 09:05:52PM +0000
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 26.01.01, Chris Wilson <cdw22@hermes.cam.ac.uk> wrote:
> 
> 
> On Fri, 26 Jan 2001, Andreas Dilger wrote:
> 

[cut some stuff]

> > you should do it in 2 steps (filling the first two partitions, and then
> > moving on to the second partitions) so that you are sure the stripes
> > are across disks, instead of across partitions in the same disk.  I'm not
> > sure whether the LVM user tools check this (or even can).
> 
> Okay, but as soon as I start deleting some of the data in the first 46gig
> and replacing it then we're back with the striping across two partitions
> on the same disk problem aren't we?

Yes and no. The harddisk has to seek to the beginning (or the general
direction), but this would have happend also if the filesystem was on
one partition. Note that LVM does not _stripe_ data unless instructed
to (lvcreate -i) but does "linear append" (well, not exactly) instead.

greetings,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <

Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0SBNC8w022194
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 06:23:13 -0500
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <4B616F73.9050208@redhat.com>
References: <20100128095014.GA6725@danisch.de> <4B616F73.9050208@redhat.com>
Date: Thu, 28 Jan 2010 11:27:53 +0000
Message-Id: <1264678073.8090.137.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] dmsetup and 2.6.31 kernel?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2010-01-28 at 12:05 +0100, Milan Broz wrote:
> On 01/28/2010 10:50 AM, Hadmut Danisch wrote:
> > With a 2.6.31 kernel (ubuntu) I run into the problem that some dmsetup
> > and dmlosetup commands that used to work before do not work anymore. 
> > 
> > e.g.
> > 
> > dd if=/dev/zero of=/tmp/testdisk count=1000
> > dmsetup create xxxtest --table '0 1000 loop /tmp/testdisk 0'
> 
> dm-loop target was never in upstream kernel, it is still available only
> as separate kernel patch.
> 
> You had patched kernel previously perhaps?

I think at some point someone was packaging unofficial Ubuntu kernels
with the dm-loop patch applied (I got some bugmail from launchpad about
it).

Hadmut, is it possible you had one of these installed previously?

Regards,
Bryn.

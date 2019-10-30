MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <23992.55411.809240.777787@quad.stoffel.home>
Date: Tue, 29 Oct 2019 20:25:23 -0400
From: "John Stoffel" <john@stoffel.org>
Subject: [linux-lvm] bcache now to become io-manager?
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
Cc: David Teigland <teigland@redhat.com>

>>>>> "Joe" == Joe Thornber <thornber@redhat.com> writes:

[ I saw this and couldn't resist asking for more details ...]

Joe> Also there are big changes to bcache coming, that remove file
Joe> descriptors from the interface completely.  See the branch
Joe> 2019-09-05-add-io-manager for more info (bcache has been renamed
Joe> io_manager).

Can you post the full URL for this, and maybe give us a teaser on what
to expect?  I run lvache on my home system and I'd love to know how to
A) improve reporting of how well it works, and B) whether I'm using it
right, and of course C) if bcache would be a better replacement.

I'm using Linux v5.0.21 (self compiled) on Debian 9.11 with lvcache
setup.  It's a pair of mirrored 250gb SSDs in front of 4tb of mirrored
disk.

So anything where I can use my SSDs to cache my data accesses is
certainly interesting.

John

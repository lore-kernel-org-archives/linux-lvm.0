Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8OJ19r01146
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 15:01:09 -0400
Received: from hoemail1.lucent.com (hoemail1.lucent.com [192.11.226.161])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8OJ13TF010456
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 15:01:03 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <16724.28393.548757.225220@gargle.gargle.HOWL>
Date: Fri, 24 Sep 2004 15:00:57 -0400
From: "John Stoffel" <stoffel@lucent.com>
Subject: Re: [linux-lvm] which files, which physical volumes?
In-Reply-To: <41538691.2040807@myself.gen.nz>
References: <41538691.2040807@myself.gen.nz>
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
To: Steve Wray <steve.wray@paradise.net.nz>, LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Steve" == Steve Wray <steve@myself.gen.nz> writes:

Steve> Or maybe pvmove is *still* broken, in which case I need to find
Steve> the files which occupy that physical volume, move them to a
Steve> different logical volume altogether and then forcibly remove
Steve> that physical volume without regard to the files that are no
Steve> longer on it... and hopefuly this won't cause corruption on the
Steve> filesystem on that logical volume.

You will destroy that filesystem, no ifs, ands or buts about it, if
you just remove the phyiscal volume.  Don't even think of doing it.
Think about it for a seond, maybe in terms of layers.

You've got the physical disks on the bottom layer, with an LV on top
of that, and a filesystem on top of that.  If you remove any lower
layer, you will immediately impact and probably corrupt the upper
layers, unless you have the proper redundancy in the lower layer.

Sorry I can't help with the pmove stuff though, I haven't tried it
yet.

John

Date: Tue, 6 Jun 2000 16:42:20 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
Message-ID: <20000606164220.A6566@gruyere.muc.suse.de>
References: <Pine.LNX.4.21.0006061049540.26807-100000@fogarty.jakma.org>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0006061049540.26807-100000@fogarty.jakma.org>; from paul@clubi.ie on Tue, Jun 06, 2000 at 10:51:54AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Jakma <paul@clubi.ie>
Cc: Linux LVM list <linux-lvm@msede.com>

On Tue, Jun 06, 2000 at 10:51:54AM +0100, Paul Jakma wrote:
> is 0.8final going to be backported to 2.2? I'd love to have the
> snapshot capabilities of 0.8final, but there's no way i'm going to
> run 2.3/2.4test on a production machine.

The SuSE 6.4 kernel contains a back port. You can download a source
rpm from ftp.suse.com 

Note that the snapshots may not be as useful as you may think though -
they are readonly and it is therefore impossible to replay a journal
or run a fsck on them. This means you effectively can only take
snapshots from unmounted file systems.

-Andi

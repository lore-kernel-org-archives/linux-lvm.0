Date: Wed, 22 Mar 2000 19:59:12 +0100
From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] snapshots not stable with 2.3.99pre2
Message-ID: <20000322195912.A17361@gondor.com>
References: <20000322145124.A6838@gondor.com> <38D9054C.A53AB6AB@heider.de>
Mime-Version: 1.0
In-Reply-To: <38D9054C.A53AB6AB@heider.de>; from rhj@heider.de on Wed, Mar 22, 2000 at 06:39:24PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richard@heider.de
Cc: "linux-lvm@msede.com" <linux-lvm@msede.com>

On Wed, Mar 22, 2000 at 06:39:24PM +0100, Richard Heider jr. wrote:
> When snapshots were mentioned the other week, I tried finding something
> in the docs, but I couldn't. Could someone please give me a reference
> on what snapshots are and how they work - or is it "RTF..Source" ?-)

Snapshots are virtual copys of logical volumes. Such a copy is read only
and doesn't change when you write to the cloned volume. 

This is often used for backups: If you backup a filesystem while 
it's in use, you may end up with an inconsistant or incomplete backup.
(after you wrote the first half of your filesystem to tape, someone moves
a file from the second half to the first one, so you miss it when you write
the second half to tape, for example.)
If you have snapshots, you create the snapshot at one moment and then 
write the (read only) snapshot to tape.


Jan
